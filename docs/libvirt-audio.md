# Audio for a libvirt VM

Claude Code voice input needs a microphone inside the VM. These steps add a
sound device to a libvirt VM and pass the host's PipeWire audio into it.

All steps except the last one run on the **host**, as `root`. `emrah` and `1000`
below are the host user and its uid (`id -u`), not the user inside the VM.

Source:
[emrah-docs libvirt audio](https://github.com/emrahcom/emrah-docs/blob/master/applications/libvirt.md#audio)

## run VMs with the user account

PipeWire runs in the host user's session, so QEMU has to run as this user to
reach it. This applies to all VMs on the host.

`/etc/libvirt/qemu.conf`

```
user = "emrah"
group = "emrah"
```

Restart the service:

```bash
systemctl restart libvirtd.service
systemctl is-active libvirtd.service
```

## apparmor permissions

```bash
mkdir -p /etc/apparmor.d/local/abstractions
```

`/etc/apparmor.d/local/abstractions/libvirt-qemu`

```
/usr/share/pipewire/** r,
/etc/pipewire/** r,
/home/emrah/.config/pipewire/** r,
/usr/lib/@{multiarch}/spa-0.2/** mr,
/usr/lib/@{multiarch}/pipewire-0.3/** mr,
/run/user/1000/ r,
/run/user/1000/pipewire-[0-9]* rw,
/run/user/1000/pipewire-[0-9]*-manager rw,
```

```bash
systemctl reload apparmor
```

## sound device per VM

```bash
virsh --connect qemu:///system edit <VM name>
```

Set the sound device and the audio backend as below. If the `<sound>` element
already has an `<address .../>` line, keep it inside `<sound>`.

```
<sound model='ich9'>
  <audio id='1'/>
</sound>
<audio id='1' type='pipewire' runtimeDir='/run/user/1000'/>
```

Restart the VM.

## inside the VM

`claude-vm-installer` already installs `alsa-utils` and adds the user to the
`audio` group. Log in again as the user after the installer so the new group
applies, then test:

```bash
arecord -l
arecord -f cd -d 5 /tmp/t.wav
aplay /tmp/t.wav
```
