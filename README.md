# content_shell
Execute `cp-content-shell.sh` to copy content_shell from chromium build.


## IronFrame Layout Tests
The IronFrame layout tests are under `third_party/WebKit/LayoutTests/http/tests/ironframe`.

To run them without X11, execute:
```
python testing/xvfb.py out/Default/ python third_party/WebKit/Tools/Scripts/run-webkit-tests -t Default http/tests/ironframe
```

To run in an XTerm, execute:
```
python third_party/WebKit/Tools/Scripts/run-webkit-tests -t Default http/tests/ironframe
```


# amazon aws
## amazon aws codecommit

### ssh config
File `~/.ssh/config`:
```
Host git-codecommit.us-east-1.amazonaws.com
User CODECOMMIT_RSA_KEY_ID e.g. DQLBE6UBHSLICOQENFZQ
IdentityFile ~/.ssh/id_rsa
```
### git config
```
[remote "origin"]
    url = ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/chrome
    fetch = +refs/heads/*:refs/remotes/origin/*
```

# buildbot
Execute `buildbot/buildbot-master-slave.sh` to setup up a buildbot master and slave in the current directory.

# Xvfb
Setup for running chrome via Xvfb
## Server side
```
export DISPLAY=:1
Xvfb :1 -screen 0 1024x768x16 &
fluxbox &
x11vnc -display :1 -bg -nopw -listen localhost -xkb
```

## Client side e.g. laptop
```
ssh -N -T -L 5900:localhost:5900 user@remotehost &
vncviewer -encodings 'copyrect tight zrle hextile' localhost:5900
```

# RequestVisibility, UISecurity and IntersectionObserver
W3C UISecurity - [https://w3c.github.io/webappsec/specs/uisecurity/](https://w3c.github.io/webappsec/specs/uisecurity/), https://github.com/w3c/webappsec.

IntersectionObserver - [https://github.com/WICG/IntersectionObserver/](https://github.com/WICG/IntersectionObserver/)
