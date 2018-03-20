#!/bin/sh

# CONFIG ----------------------------------------------------------------------

# Where to save the backups on your local machine (absolute path)
BACKUPS=~/Backups

# The naming used for backup folders (i.e. $(date +%Y-%m-%d) or $(date +%Y-%m-%d-%H.%M.%S))
FOLDER=$(date +%Y-%m-%d)

# How many days before backups are "stale" and ready to be trashed
MAXAGE=14

# backup commands, concatenate multiple commands with && (e.g. git clone ... && wget ...)
BACKCOM=""

# END CONFIG ------------------------------------------------------------------



# Setup the $BACKUPS folder and start the clock
# =============================================
clear

START=$(date +%Y%m%d%H%M%S)

if [ ! -d "$BACKUPS" ]; then
    mkdir $BACKUPS
fi
cd $BACKUPS


# Delete backup folders older than $MAXAGE days
# =============================================
for i in `find * -maxdepth 1 -type d -mtime +$MAXAGE -print`
do
    echo "Deleting directory $i"
    rm -rf $i
done


# Create the folder for the current backup
# ========================================
if [ ! -d "$FOLDER" ]; then
    mkdir $FOLDER
fi
cd $FOLDER


# Execute Backup coommands
# =================================
eval $BACKCOM


# Stop the clock and show how much time we had to drink coffees|beers
# ===================================================================
END=$(date +%Y%m%d%H%M%S)
DELTA=$(( $END - $START ))

echo "Backup took $DELTA seconds"
