# Automating Scripts

* Scheduled, recurring, automatic execution of scripts.

## ` cron ` 

* Service called ` cron.d ` (a daemon) to run scripts automatically at scheduled times.
* Tools : ` at `, ` crontab `, ` anacron ` and ` logrotate `.
* Script locations : 
  - ` /etc/crontab `
  - ` /etc/cron.d `
  - ` /etc/cron.hourly`
  - ` /etc/cron.daily `
  - ` /etc/cron.weekly `
  - ` /etc/cron.monthly `

* ` cron ` feature can be used for
  - Rotating log 
  - Taking backup
  - Cleaning up temporary files
  - Getting alerts through email on system failures.

### Job Definition

* Run a mkbackup.sh as root every working day at 02:05 AM.

```terminal
# ----------------------------- minute (0 - 59)
# |  --------------------------- hour (0 - 23)
# |  |  ------------------------- day of month (1 - 31)
# |  |  |   -------------------- month (1 - 12) OR jan,feb,... 
# |  |  |   |   ------------- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,...
# |  |  |   |   |   --------- user-name
# |  |  |   |   |   |    ---- command to execute
# |  |  |   |   |   |    |
# m  h dom mon dow user cmd
  5  2  *   *  1-5 root cd /home/a/scripts/backup && ./mkbackup.sh 
```

### Startup Scripts

* Some scripts are run every time you boot the machine.
* Startup scripts
  - ` /etc/init/ `
  - ` /etc/init.d/ `

* Runlevel Scripts
  - Scripts run to perform certain actions and to run the machine in a specific mode.


|       |          |              |
| :---: | -------- | ------------ |
| 0 | ` /etc/rc0.d/ ` | Shutdown and power off |
| 1 | ` /etc/rc1.d/ ` | Single user mode |
| 2 | ` /etc/rc2.d/ ` | Non GUI multi-user mode w/o networking |
| 3 | ` /etc/rc3.d/ ` | Non GUI multi-user mode with networking |
| 4 | ` /etc/rc4.d/ ` | Non GUI multi-user mode for special purposes |
| 5 | ` /etc/rc5.d/ ` | GUI multi-user mode with networking (default) |
| 6 | ` /etc/rc6.d/ ` | Shutdown and reboot |

### Examples

* See file [mkbackup.sh](files/mkbackup.sh)

* Opening ` crontab `
  - After the command, select your favourite editor from options given.

```bash
crontab -e
```

* To run the ` mkbackup.sh ` script insert the line below in ` crontab ` file. (Pick time suitable to your needs)

 - ` 27 * * * * cd /home/a/scripts/backup && ./mkbackup.sh `
  - The script will run automatically at choosen time.
