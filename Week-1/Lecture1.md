# Getting Started

## Launching a GNU-Linux OS using Virtual Machine

### Requirements

* ISO image of the GNU-Linux OS.

> [Ubuntu 20.04 LTS](https://releases.ubuntu.com/20.04.5/?_ga=2.125119434.1524606981.1671093211-1303727683.1671093211) for x86_64 platform
> or
> [Ubuntu 22.04 LTS](https://ubuntu.com/download/desktop/thank-you?version=22.04.1&architecture=amd64) for x86_64 platform

* Hosted Hypervisor
    - Virtualization helps to run different operating systems using same physical resources.
    - Hypervisor is a software which makes virtualization possible.
    - If your machine does not support dual boot, you may need a hosted hypervisor to run the GNU-Linux operating system. 
    - Hosted hypervisors runs within another operating system known as host operating system. The operating system installed within hypervisor is called guest operating system.
    - e.g.
        * [Oracle VM VirtualBox](https://www.virtualbox.org/)
        * [VMware Workstation Player](https://customerconnect.vmware.com/en/downloads/info/slug/desktop_end_user_computing/vmware_workstation_player/17_0)
 
* Adequate space on hard disk. (20 GB - 50 GB, depending on requirement.)

### Steps

* Download Ubuntu ISO file. 
* Download hypervisor.
* Install the hypervisor
* Launch the hypervisor and configure a virtual machine.
* Launch the virtual machine.

## Launching a GNU/Linux OS using WSL (Windows Subsystem for Linux).
* Run powershell as an administrator.
* Run command ` wsl --install `
* Reboot the machine.

## Other command line environments.

### On Cloud

* https://replit.com/
* https://cocalc.com/

### On Phone

* Termux app from Fredrick Fornwall 
    - [GitHub](https://github.com/termux/termux-app/releases)
    - [F-Droid](https://f-droid.org/en/packages/com.termux/) (Direct link. No need to download F-Droid)
    - [Google Play Store](https://play.google.com/store/apps/details?id=com.termux) (deprecated)

Now we are ready!
Let's dive into terminal to be ` su `! :)





