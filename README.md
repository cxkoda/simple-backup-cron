simple-backup-cron
==================

A simple bash script to backup remote databases and folders, forked from [marcaube/simple-backup-cron](https://github.com/marcaube/simple-backup-cron).

This is a low-tech skeleton script to perform a generic backup task keeping a history of 14 days.
I use this script mainly to backup a git repository from a somewhat unsave environment.


## Usage

Copy the script to the computer where you want to store the backups and configure the script.

```bash
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
```

You can run the script manually

```bash
$ sh backup.sh >> backup_errors.log
```

Or you can configure a cron job to run it every `hour|day|week` using crontab

```bash
$ crontab -e
```

This would be a cron job to do the backups every morning at 9:00

```bash
0       9       *       *       *       sh ~/path/backup.sh >> ~/path/backup_errors.log
```


## License

simple-backup-cron is released under the MIT License. See the bundled [LICENSE]() file for details.
