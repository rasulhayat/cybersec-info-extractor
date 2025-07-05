# 🛠️ Info Extractor – System Diagnostics Bash Script

A simple, lightweight bash script to extract key diagnostic information from a Linux system. Designed for system administrators, cybersecurity learners, and anyone looking to understand basic system-level data using terminal commands.

---

## 📋 Features

This script performs the following tasks:

1. **Public IP Address** – Retrieves the system's external IP using `curl`.
2. **Private IP Address** – Extracts IP assigned to the system's network interface using `ifconfig`.
3. **Masked MAC Address** – Displays the MAC address with the last three octets masked for privacy.
4. **Top CPU-Consuming Processes** – Lists the top 5 processes based on CPU usage using `top`.
5. **Memory Usage Stats** – Shows total and available memory using `free -h`.
6. **Active Services** – Displays active systemd services using `systemctl`.
7. **Top 10 Largest Files in /home** – Finds the largest files in `/home` and displays their size and location.

---

## 🖥️ Sample Output

```bash
Project : Info Extractor

System Diagnostics
----------------------------------------------------------------------------------
1) Public IP:
   Public IP: 203.0.113.45

2) Private IP:
   Private IP: 192.168.1.10

3) MAC Address:
   MAC Address: a4:5e:60:**:**:**

4) CPU Usage:
   PID USER     PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   937 root     20   0  162520   7024   5336 R  34.9   0.2   0:00.14 top
   ...

5) Memory:
   Total memory: 7.6G
   Available memory: 5.4G

6) Active Services:
   accounts-daemon.service     loaded active running Accounts Service
   ...

7) Largest Files in /home:
   1.2G    /home/user/videos/movie.mp4
   987M    /home/user/Downloads/iso.img
