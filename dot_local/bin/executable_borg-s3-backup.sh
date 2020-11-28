#!/bin/bash

# Adapted from https://github.com/luispabon/borg-s3-home-backup

# Check if environment vars are set
if [[ ! "$BORG_REPO" ]]; then
	printf "\n ** Please provide with BORG_REPO on the environment\n"
	exit 1
fi

if [[ ! "$BORG_S3_BACKUP_ORIGIN" ]]; then
	printf "\n ** Please provide with BORG_S3_BACKUP_ORIGIN on the environment\n"
	exit 1
fi

if [[ ! "$BORG_S3_BACKUP_BUCKET" ]]; then
	printf "\n ** Please provide with BORG_S3_BACKUP_BUCKET on the environment\n"
	exit 1
fi

if [[ ! "$BORG_S3_BACKUP_AWS_PROFILE" ]]; then
	printf "\n ** Please provide with BORG_S3_BACKUP_AWS_PROFILE on the environment (awscli profile)\n"
	exit 1
fi

# Name to give this backup within the borg repo
BACKUP_NAME=snapshot-$(date +%Y-%m-%dT%H.%M)

printf "\n\n ** Starting backup ${BACKUP_NAME} of directory ${BORG_S3_ORIGINAL}...\n"

# Local borg backup
borg create ::${BACKUP_NAME} \
	${BORG_S3_BACKUP_ORIGIN} \
	--compression zlib,6

# Define and store the backup's exit status
OPERATION_STATUS=$?

# Only continue if backup was actually successful
if [ $OPERATION_STATUS == 0 ]; then
	# Clean up old backups
	# Prune operation is not important, s3 sync is - do not exit were this to fail
	borg prune --keep-daily=7 --keep-weekly=4 --keep-monthly=12

	# Sync borg repo to s3
	printf "\n\n ** Sync to s3...\n"
	borg with-lock ${BORG_REPO} aws s3 sync ${BORG_REPO} s3://${BORG_S3_BACKUP_BUCKET} --profile=${BORG_S3_BACKUP_AWS_PROFILE} --delete

	# We do care about s3 sync succeeding though
	OPERATION_STATUS=$?
fi

if [ $OPERATION_STATUS == 0 ]; then
	STATUS_MESSAGE="Backup successful"
else
	STATUS_MESSAGE="Backup failed because reasons - see output"
fi

# Send desktop notification and exit appropriately if supported by the system - this will probably
# only work on a linux desktop. Accepting contributions for the mac.
if hash notify-send 2>/dev/null; then
	if [ $OPERATION_STATUS == 0 ]; then
		notify-send -t 0 "Home folder backup" "${STATUS_MESSAGE}" --urgency=normal --icon=dialog-information
	else
		notify-send -t 0 "Home folder backup" "${STATUS_MESSAGE}" --urgency=critical --icon=dialog-error
	fi
fi

# Same as above, but on stdout
printf "\n ** ${STATUS_MESSAGE}\n"
exit ${OPERATION_STATUS}
