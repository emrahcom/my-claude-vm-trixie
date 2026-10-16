# my-claude-vm-trixie

`claude-vm-installer` creates a Claude Code work environment on a basic Debian
13 Trixie VM.

## Supported distributions

- Debian 13 Trixie

## Usage

- **Don't run this script on your desktop machine.**
- Run it on an isolated environment such as a virtual machine.
- Run it as `root`.

### use root account

If you are not already `root`, switch to `root` account:

```bash
su -l
```

### download installer

```bash
apt-get update
apt-get install wget

wget -T 10 -O claude-vm-installer https://raw.githubusercontent.com/emrahcom/my-claude-vm-trixie/main/claude-vm-installer
```

### run the installer

The installer clones this repo into `/tmp/my-claude-vm-trixie` and uses the
files from there.

```bash
bash claude-vm-installer
```
