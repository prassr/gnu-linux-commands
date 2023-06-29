# Networking Commands and SSH

Accessing remote machines on command line

<!-- 
Explaination of Network private , public
Routing
Types of Network
Network classes or IP address range
Ports, routing
-->

## Ways to gain remote access

* VPN access
* ssh tunneling
* Remote desktop : x2go, rdp, pcoip,
* Desktop over browser: Apache Guacomole
* Commercial, over internet : Teamviewer, AnyDesk, Zoho assist, ...

## Some important ports

| port | service | description |
| :--- | :------ | :---------- |
| 21 | ftp | File transfer |
| 22 | ssh |Secure Shell |
| 25 | smtp | Simple Mail Transfer Protocol |
| 80 | http | Hypertext Tranfer Protocol |
| 443 | https | Secure Hypertext Tranfer Protocol |
| 631 | cups | Common Unix Printing System |
| 3306 | mysql | MySQL database |

## Firewall

* [` ufw `]
* Ports open on my machine
* Ports needed to be accessed on remote machine
* Network routing over the port
* Firewall controls at each hop

## Protecting a server

A server with a public service is protected from anonymous user using using Web Application Filter and Network Firewall.

## SElinux

* Security Enhanced Linux mode available on Ubuntu too, apart from server grade flavors like CentOS, Fedora, RHEL, SuSE Linux etc.,
* Additional layer of access control on files to services
* Role Based Access Control
* Process sandboxing, least privilege access for subjects
* Check using ` ls -lZ ` and ` ps -eZ `
* RBAC items: user (**unconfined_u**), role (**object_r**), type (**user_home_t**), level (**s0**)
* Modes: **disabled**, **enforcing**, **permissive**
* Tools: ` semanage `, ` restorecon `

SELinux is recommended for all publicly visible servers

## Network tools

| tool   | Description    |
| :---------------: | :--------------- |
| ` ping ` | To see if the remote machine is up |
| ` traceroute ` | Diagnostics the hop timings to the remote machine |
| ` nslookup ` | Ask for conversion of IP address to name |
| ` dig `  | DNS lookup utility |
| ` netstat ` | Print network connections |
| mxtoolbox.com | For help with accessibility from public network |
| whois lookup | Who owns which domain name |
| ` nmap ` | (careful !) Network port scanner |
| ` wireshark ` | (careful !) Network protocol analyzer |

## High Performance Computing

* Look at [www.top500.org](www.top500.org) for statistics
* Accessing a remote HPC machine is usually over SSH
* Long duration jobs are submitted to a job scheduler for execution
* Raw data if large needs to be processed remotely before being transferred to your machine (network charges? bandwidth?)
* Comfort with command line is a must

## [` ifconfig `](/Week-6/Lecture1.md#ifconfig)

## ` nslookup `

* Convert names to IP addresses.

Syntax:

```
nslookup <domain-name>
```
Example:

```bash
nslookup www.iitm.ac.in
```
  - Try for www.mit.edu & aqua.iitm.ac.in

The same information can be obtained from https://mxtoolbox.com/.

## ` dig `
* ` dig ` is a DNS lookup utility.
* It can show the IP address of a domain name or can reverse lookup the domain name of the IP address.

Syntax:

1. dig for the IP address using domain name

```
dig <domain-name>
```


2. dig for the domain name using IP address.

```syntax
dig -x <IP-address>
```

Example:

```bash
dig www.google.com # 1
```

```bash
dig -x 54.209.123.136 # 2
```

* Getting only the DNS of the IP address by suppressing all other output

```terminal
~$ dig +noall +answer -x 34.234.167.93
```

## ` w `
* See the people who are currently logged into the system

## ` qstat `
* Job scheduler especially used in High Performance Computing.
* Lists job id, job name, user, time, Q( in queue) / R (running), type of Q  (CPU, GPU)

```bash
qstat
```

## ` ping `

* It is used to check if a particular host or IP address is reachable.

```
ping <host or IP address>
```

Example:

```bash
ping 170.187.251.202 # VM used for se2001 
```

## ` netstat `

* It is a command used to show network statistics and lists the active Internet Connections and Active UNIX domain sockets.

```bash
netstat
```
