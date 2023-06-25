# Knowing your Hardware

## Hardware Items

* CPU
* Storage and Partitions
* Graphics Card
* Memory Modules
* Battery and Status
* Network devices and configuration

## Required Packages

The following packages are required to explore the hardware


| | | | |
| :----: | :----: | :----: | :----: |
| clinfo | coreutils | dmidecode | fdisk |
| hardinfo | hdparm | hwinfo | lshw |
| memtester | net-tools | pciutils | procps |
| sysstat | upower | util-linux | |
| | | | |


### ` hwinfo ` 

* It is used to probe for the hardware present in the system.
* You can probe for a specific hardware and get information about it.
* For this `--<HARDWARE_ITEM>` option is used, i.e. probe for a particular **HARDWARE_ITEM**.
* Available hardware items list can be found using `man hwinfo` command.
* A few are

>	all, arch, bluetooth, memory, scanner, printer, mouse 

```bash
hwinfo
```

* Output is roughly equivalent to ` hwinfo --all --log=- `.

* Task :
	- Run the ` hwinfo ` command and store output to a file. Read the using `less`.

### ` lshw `

* It is used to get detailed information on the hardware configuration of the machine.

* It can report exact memory configuration, firmware  version,  mainboard configuration,  CPU  version  and  speed,  cache configuration, bus speed, etc

```bash
lshw
```

* To get information about specific hardware.
	- ` lshw -c <HARDWARE> `

```bash
lshw -c display
```

* Task:
	- Print information about ` memory `.

### ` /proc/cpuinfo `

* This filesystem contains information about the CPU.
* in file
    - *flags*: Capabilities of the CPU
    - *cache*: How well the machine performs the computation?

```bash
cat /proc/cpuinfo
```

### `/proc/partitions`

* This filesystem has the partition information.
* loop devices usually are there for snap packages.

```bash
cat /proc/partitions
```

### ` lsblk `

* It lists information about all available or the specified block devices. 
* The ` lsblk ` command reads the ` sysfs ` filesystem and ` udev db ` to gather information.
* If ` udev db ` is absent, it gathers information from LABELs, UUIDs and filesystem types from the block device (`su` required).

```bash
lsblk -o NAME,SIZE
```

* ` -o ` or ` --output ` is used to gather  only ` NAME ` and ` SIZE ` of the block device.

### ` lspci `

* It lists information about **PCI** (Peripheral Component Interconnect, a type of expansion slot on motherboard) buses and devices connected to them.

```bash
lspci
```

### ` free `

* Display amount of free and used memory in the system.

```bash
free -h
```

* ` -h ` : human-readable

### ` dmidecode `

* low level command, ` su ` required.
* The tool is used for dumping   a  computer's DMI (some  say  SMBIOS) table contents in a human-readable    format.

```bash
dmidecode -type memory
```

* Task:
	- Explore the ` man ` page to know more about ` --type ` keyword arguments

### ` hardinfo `

* A GUI based utility to display hardware information.

```bash
hardinfo
```

### ` clinfo `

* Prints the information about graphics card.

```bash
clinfo
```


### ` upower `

* It's a tool used to display battery status.
* It is based on UPower daemon.

```bash
upower -e 	# lists all the battery devices.
```

* To explore the **ITEM** in the above list use the syntax below.

```bash
upower -i <ITEM>
```

### ` hdparm `

* `hdparm` utility is used to check hard disk parameters.
* This command shows the speed of the disk.

```bash
hdparm -Tt /dev/sda
```

<!--
df
df - report file system disk space usage
-->

### ` iostat `

* Prints the information about input output speed.
* The output of this command can be used to compare speed at different times with speed at ideal timing.

```bash
iostat -dx /dev/sdb
```

### ` ifconfig `

* Prints the network configuration of the system like wi-fi, ethernet and loopback connection.

```bash
ifconfig
```
