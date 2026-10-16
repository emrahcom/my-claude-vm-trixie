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

## After installation

These steps are needed once, after the first run.

### switch to the user account

Use your `USER_NAME` if you set one for the installer.

```bash
su -l emrah
```

### SSH access

Add your public SSH key to `~/.ssh/authorized_keys` if you connect to the VM
over SSH.

### secrets

Add your private environment variables such as access tokens to `~/.zshrc`.
They are not part of this repo.

### Claude Code

Start Claude Code and log in:

```bash
claude
```

### GitLab

Log in to your GitLab with a read-only token (`read_api` and `read_repository`
scopes):

```bash
glab auth login --hostname gitlab.yourdomain.com
```

### audio

To use Claude Code voice input, add a sound device to the VM. See
[Audio for a libvirt VM](docs/libvirt-audio.md).

## Docs

- [Audio for a libvirt VM](docs/libvirt-audio.md): add a sound device to the
  VM for Claude Code voice input
