# FakeBash

**Linux commands for Windows**

FakeBash is a collection of Windows batch files and PowerShell scripts that bring Linux/Unix command-line muscle to Windows. Drop the folder anywhere, run the installer, and start typing like you're on Linux in both `cmd.exe` and PowerShell.

Made by [0xDrakon](https://github.com/0xDrakon)

---

## Folder Structure

```
FakeBash/
├── cmd/            Windows batch files (.bat) - for CMD Prompt
├── powershell/     PowerShell scripts (.ps1)  - for PowerShell
├── install.bat     Installer - run as administrator
└── README.md       This file
```

---

## Installation

### Quick Install (Recommended)

1. [Download or clone this repo](https://github.com/0xDrakon/FakeBash)
2. Right-click `install.bat` → **Run as administrator**
3. Open a **new** terminal window (CMD or PowerShell)
4. Start using Linux commands

The installer does all of this automatically:

- Adds `FakeBash\cmd\` to your system `PATH` (for CMD commands)
- Adds `FakeBash\powershell\` to your system `PATH` (for PowerShell commands)
- Adds `.PS1` to `PATHEXT` so you can type `grep` instead of `grep.ps1`
- Sets PowerShell execution policy to `RemoteSigned` so scripts run without extra prompts

### Manual Install

```cmd
setx /M PATH "%PATH%;C:\path\to\FakeBash\cmd;C:\path\to\FakeBash\powershell"
setx /M PATHEXT "%PATHEXT%;.PS1"
```

Then in an admin PowerShell:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force
```

---

## Requirements

- Windows 10 or later
- Administrator privileges (for the installer)
- PowerShell 5.1+ (included in Windows 10 by default)
- `curl` is built into Windows 10 1803+
- `tar` is built into Windows 10 1803+
- `ssh` / `scp` are built into Windows 10 1809+

---

## CMD vs PowerShell - Which Should I Use?

| | CMD (`cmd\`) | PowerShell (`powershell\`) |
|---|---|---|
| File type | `.bat` | `.ps1` |
| Pipes objects | No | Yes, pipes real objects |
| `-h` / human flags | Rarely | Yes, where applicable |
| Script logic | Limited | Full scripting language |
| Background jobs | Via `start` | Native `Start-Job` / `Get-Job` |
| Best for | Quick commands, legacy tools | Everything else |

Both folders are on your PATH. When you type a command, Windows checks `PATHEXT` order. You can always be explicit: `ls.bat` or `ls.ps1`.

---

## Commands

### File & Directory

| Command | Example | Description |
|---------|---------|-------------|
| `ls` | `ls`, `ls C:\Users` | List directory |
| `ll` | `ll` | Long listing with details |
| `la` | `la` | List all including hidden |
| `pwd` | `pwd` | Print working directory |
| `cat` | `cat file.txt` | Print file contents |
| `head` | `head file.txt`, `head -n 5 file.txt` | First N lines (default 10) |
| `tail` | `tail file.txt`, `tail -n 20 file.txt` | Last N lines (default 10) |
| `tail -f` | `tail -f app.log` | Follow file live (PowerShell only) |
| `tac` | `tac file.txt` | Print file in reverse line order |
| `touch` | `touch newfile.txt` | Create file or update timestamp |
| `cp` | `cp src.txt dst.txt` | Copy file |
| `mv` | `mv old.txt new.txt` | Move or rename |
| `rm` | `rm file.txt` | Remove file |
| `rm -r` | `rm -r folder` | Remove directory recursively |
| `rm -rf` | `rm -rf folder` | Force remove recursively |
| `mkdir` | `mkdir mydir`, `mkdir -p a/b/c` | Create directory |
| `find` | `find . -name *.txt` | Find files by name |
| `stat` | `stat file.txt` | File metadata |
| `file` | `file archive.zip` | File type info |
| `realpath` | `realpath .\file.txt` | Absolute path |
| `basename` | `basename C:\Users\me\file.txt` | Strip directory |
| `dirname` | `dirname C:\Users\me\file.txt` | Strip filename |
| `readlink` | `readlink symlink` | Resolve symlink |
| `ln` | `ln -s target link`, `ln target link` | Create link |
| `truncate` | `truncate file.txt` | Truncate file to zero |
| `mktemp` | `mktemp` | Create a temporary file |
| `split` | `split -l 100 bigfile.txt` | Split file into parts |

### Text Processing

| Command | Example | Description |
|---------|---------|-------------|
| `grep` | `grep "error" log.txt`, `grep -r "foo" .` | Search for pattern |
| `diff` | `diff file1.txt file2.txt` | Compare two files |
| `cmp` | `cmp file1.txt file2.txt` | Binary compare |
| `sort` | `sort file.txt`, `sort -r`, `sort -n` | Sort lines |
| `uniq` | `uniq file.txt`, `uniq -c file.txt` | Filter duplicate lines |
| `wc` | `wc file.txt`, `wc -l file.txt` | Word/line/char count |
| `nl` | `nl file.txt` | Number lines |
| `cut` | `echo a,b,c \| cut -d , -f 2` | Cut columns |
| `tr` | `tr a-z A-Z` | Translate characters |
| `tee` | `dir \| tee output.txt` | Write to file and stdout |
| `rev` | `rev file.txt` | Reverse characters per line |
| `fold` | `fold -w 60 file.txt` | Wrap long lines |
| `fmt` | `fmt file.txt` | Reflow text |
| `pr` | `pr file.txt` | Format file with line numbers |
| `paste` | `paste file1.txt file2.txt` | Merge files side by side |
| `join` | `join file1.txt file2.txt` | Join on common field |
| `comm` | `comm file1.txt file2.txt` | Compare sorted files |
| `expand` | `expand file.txt` | Tabs to spaces |
| `unexpand` | `unexpand file.txt` | Spaces to tabs |
| `column` | `column file.txt` | Columnize output |
| `shuf` | `shuf file.txt` | Shuffle lines randomly |
| `xargs` | `dir /b \| xargs type` | Build commands from stdin |
| `less` / `more` | `less file.txt` | Paginated output |

### System Info

| Command | Example | Description |
|---------|---------|-------------|
| `ps` | `ps`, `ps -aux` | List processes |
| `top` | `top` | Live process viewer |
| `kill` | `kill 1234`, `kill notepad.exe` | Kill process |
| `df` | `df`, `df -h` | Disk space |
| `du` | `du`, `du -sh C:\Users` | Directory size |
| `free` | `free`, `free -m`, `free -h` | Memory usage |
| `uname` | `uname -a`, `uname -r` | System info |
| `uptime` | `uptime` | System uptime since last boot |
| `lscpu` | `lscpu` | CPU information |
| `lsblk` | `lsblk` | Block devices |
| `lsusb` | `lsusb` | USB devices |
| `lspci` | `lspci` | PCI devices |
| `lsof` | `lsof` | Open connections |
| `jobs` | `jobs` | Background jobs |
| `dmesg` | `dmesg` | System event log |

### User Management

| Command | Example | Description |
|---------|---------|-------------|
| `whoami` | `whoami` | Current user |
| `id` | `id` | UID, groups, admin status |
| `groups` | `groups` | Group memberships |
| `w` | `w` | Who is logged in |
| `last` | `last` | Login history |
| `useradd` | `useradd john` | Add local user |
| `userdel` | `userdel john` | Delete local user |
| `passwd` | `passwd`, `passwd john` | Change password |
| `su` | `su`, `su john` | Switch user |
| `sudo` | `sudo netstat -ano` | Run as administrator |

### Networking

| Command | Example | Description |
|---------|---------|-------------|
| `ifconfig` | `ifconfig` | Network interfaces |
| `ip` | `ip addr`, `ip route`, `ip link` | IP / routing |
| `ping` | `ping google.com`, `ping -t google.com` | Ping host |
| `traceroute` | `traceroute google.com` | Trace route |
| `nslookup` | `nslookup google.com` | DNS lookup |
| `netstat` | `netstat -ano` | Network connections |
| `ss` | `ss`, `ss -u` | Socket statistics |
| `arp` | `arp -a` | ARP table |
| `iwconfig` | `iwconfig` | Wireless info |
| `nmcli` | `nmcli dev`, `nmcli con` | Network manager |
| `wget` | `wget https://example.com/file.zip` | Download file |
| `curl` | `curl https://api.example.com` | HTTP requests |
| `ssh` | `ssh user@host` | SSH client |
| `scp` | `scp file.txt user@host:/path` | Secure copy |
| `rsync` | `rsync -av src/ dst/` | File sync (robocopy fallback) |
| `nmap` | `nmap 192.168.1.1` | Network scanner (requires nmap) |

### Hashing & Encoding

| Command | Example | Description |
|---------|---------|-------------|
| `md5sum` | `md5sum file.txt` | MD5 hash |
| `sha1sum` | `sha1sum file.txt` | SHA1 hash |
| `sha256sum` | `sha256sum file.txt` | SHA256 hash |
| `cksum` | `cksum file.txt` | Checksum |
| `base64` | `base64 file.txt`, `base64 -d enc.txt` | Base64 encode/decode |
| `xxd` | `xxd file.bin` | Hex dump |
| `hexdump` | `hexdump file.bin` | Hex dump |
| `od` | `od file.bin` | Octal/hex dump |
| `strings` | `strings binary.exe` | Extract printable strings |

### Archives & Compression

| Command | Example | Description |
|---------|---------|-------------|
| `tar` | `tar -czf out.tar.gz folder`, `tar -xzf f.tar.gz` | Archive (native tar) |
| `zip` | `zip output.zip file.txt` | Create ZIP |
| `unzip` | `unzip archive.zip`, `unzip archive.zip -d dir` | Extract ZIP |

### System Services

| Command | Example | Description |
|---------|---------|-------------|
| `systemctl start` | `systemctl start Spooler` | Start service |
| `systemctl stop` | `systemctl stop Spooler` | Stop service |
| `systemctl restart` | `systemctl restart Spooler` | Restart service |
| `systemctl status` | `systemctl status Spooler` | Service status |
| `systemctl enable` | `systemctl enable Spooler` | Enable at boot |
| `systemctl disable` | `systemctl disable Spooler` | Disable at boot |
| `systemctl list-units` | `systemctl list-units` | List all services |
| `service` | `service Spooler start` | Control a service |
| `journalctl` | `journalctl`, `journalctl -u Spooler` | System logs |
| `crontab -l` | `crontab -l` | List scheduled tasks |
| `dmesg` | `dmesg` | Kernel/system log |

### Storage & Mount

| Command | Example | Description |
|---------|---------|-------------|
| `mount` | `mount`, `mount C:\folder Z:` | Show/mount drives |
| `umount` | `umount Z:` | Unmount a virtual drive |

### Misc Utilities

| Command | Example | Description |
|---------|---------|-------------|
| `clear` | `clear` | Clear screen |
| `sleep` | `sleep 5` | Wait N seconds |
| `history` | `history` | Command history |
| `alias` | `alias`, `alias ll=dir` | Create/list aliases |
| `source` | `source setup.bat` | Execute script in current shell |
| `env` | `env` | Print all env variables |
| `export` | `export MY_VAR=hello` | Set persistent env variable |
| `printenv` | `printenv PATH` | Print specific env variable |
| `man` | `man xcopy` | Manual / help pages |
| `which` | `which python` | Find command location |
| `hostname` | `hostname` | Print hostname |
| `date` | `date` | Current date/time |
| `time` | `time dir` | Time a command |
| `watch` | `watch -n 5 netstat -ano` | Repeat command periodically |
| `bc` | `bc` | Interactive calculator |
| `seq` | `seq 10`, `seq 1 2 10` | Number sequence |
| `yes` | `yes`, `yes "confirm"` | Repeat string forever |
| `factor` | `factor 360` | Prime factorization |
| `numfmt` | `numfmt 1000000` | Format number |
| `rev` | `rev file.txt` | Reverse characters |
| `shuf` | `shuf file.txt` | Shuffle lines |
| `nano` | `nano file.txt` | Open file in Notepad |
| `vim` / `vi` | `vim file.txt` | vim (or Notepad fallback) |
| `nohup` | `nohup myapp.exe` | Run immune to hangup |
| `bg` | `bg myapp.exe` | Run in background |
| `fg` | `fg` | Bring background job to front |
| `jobs` | `jobs` | List background jobs |
| `true` | `true` | Return success (exit 0) |
| `false` | `false` | Return failure (exit 1) |
| `apt` | `apt install nodejs`, `apt update` | Package manager (winget) |
| `reboot` | `reboot` | Reboot |
| `poweroff` | `poweroff` | Shut down |
| `halt` | `halt` | Halt system |
| `chmod` | `chmod 755 file` | Permission notice + hint |
| `chown` | `chown user file` | Ownership change / hint |

---

## Notes

### PowerShell-specific
- **PowerShell scripts use real PowerShell cmdlets** - `df -h` gives human-readable output, `grep` returns pipeable `MatchInfo` objects, `kill` uses `Stop-Process`, etc.
- **Background jobs** (`bg`, `nohup`, `fg`) use native PowerShell `Start-Job` / `Receive-Job` - they persist across the session.
- **`fg`** works in PowerShell (uses `Wait-Job`); the CMD version just prints a message since cmd.exe has no job control.
- **`tail -f`** follows a file live in PowerShell via `Get-Content -Wait`.
- **`export`** persists the variable for the current user scope. Open a new shell to inherit it.
- **`free -m` / `free -h`** - proper unit flags work in PowerShell; the CMD version only shows KB.

### General
- **chmod / chown** - Windows uses NTFS ACLs. CMD prints an `icacls` hint; PowerShell attempts `Set-Acl`.
- **apt** - Wraps `winget`. Requires Windows Package Manager (ships with Windows 11 and Windows 10 1809+ via App Installer).
- **vim / vi** - Uses real `vim` or `nvim` if found in PATH, otherwise opens Notepad.
- **wget** - CMD wraps `curl -L`; PowerShell uses `Invoke-WebRequest`.
- **sudo** - Launches a new elevated window via `RunAs`.
- **rsync** - Falls back to `robocopy` if `rsync` is not installed.
- **nmap** - Requires [Nmap for Windows](https://nmap.org/download.html).
- **tar** - Uses native Windows `tar.exe` (available since Windows 10 build 17063).

---

## Uninstall

1. Open **System Properties** → **Advanced** → **Environment Variables**
2. Under **System variables**, edit `Path` and remove both FakeBash entries (`cmd\` and `powershell\`)
3. Edit `PATHEXT` and remove `.PS1`
4. Click OK and open a new terminal

Or via command line (run as administrator):

```cmd
setx /M PATH "%PATH:;C:\path\to\FakeBash\cmd=%"
setx /M PATH "%PATH:;C:\path\to\FakeBash\powershell=%"
```

Then optionally remove `.PS1` from `PATHEXT` the same way.

---

## Contributing

Pull requests welcome. If you want to add a command:

- One `.bat` file in `cmd/` and one `.ps1` file in `powershell/`, both named exactly as the Linux command
- No `REM` comments inside `.bat` files; no `#` comments inside `.ps1` files
- Should work on Windows 10+ out of the box where possible
- Falls back gracefully if a dependency is missing - print a helpful message, don't silently fail
- PowerShell versions should use native PowerShell cmdlets, not just wrap `cmd.exe` calls

---

## License

MIT License, do whatever you want with it.

---

## Author

**0xDrakon** - [github.com/0xDrakon](https://github.com/0xDrakon)
