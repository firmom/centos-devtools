# centos-devtools
The project contains pre-instaled developer tools and the most popular programming languages.

A Dockerfile / docker image created for developers environment. It contains pre-instaled the most popular programming languages like php, ruby, sass, nodejs, gulp, bower, yarn, golang. Web tools like apache2. The project contains [atom](https://atom.io/) with file-icons, go-debug, go-plus, language-docker, atom-beautify, git-plus plugins. Provide access by [VNC](https://pl.wikipedia.org/wiki/Virtual_Network_Computing) and [noVNC](https://github.com/novnc/noVNC).

## Introduction
It is based on [docker-headless-vnc-container](https://github.com/ConSol/docker-headless-vnc-container). There is description how to use vnc and novnc (webbrowser terminal).

## Run devtools
Recomended way to run devtools:
```bash
docker run -it --rm -p 5901:5901 -p 6901:6901 -p 3000:3000 -p 3001:3001 -p 80:80 -p 8080:8080 -p 5555:5555 -e VNC_RESOLUTION=1600x900 -e VNC_COL_DEPTH=24 -e VNC_PW=pass123 -v fwork:/headless/Desktop/work -v fgit:/headless/.git -v fatom:/headless/.atom -v fwww:/var/www -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --privileged=true --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH firmom/centos-devtools
```

## Git configuration
You can configure git by add GIT_USER_NAME and GIT_USER_EMAIL to your environments. Alternative way you can add configuration to autorun.sh
```
git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"
```
Replace *$GIT_USER_EMAIL* and *$GIT_USER_NAME* with your personal information.

## VNC client
Recomended open source client is [TigerVNC](http://tigervnc.org/). Make Windows and Linux working together.
![Windows and linux on one laptop](https://raw.github.com/firmom/docker-desktop-devtools/master/screenshots/desktop.jpg)

## Add shared directory (via SMB)
You must run docker container with extra parameteris like:
```
docker run ... \
  --cap-add SYS_ADMIN \
  --cap-add DAC_READ_SEARCH \
 firmom/devtools
```
And add your mount script to "$HOME/Desktop/autorun.sh" file
```
mkdir "$HOME/Desktop/shared"
mount -t cifs -o username=<share user>,password=<share password> //MACHINE_IP/<share name> "$HOME/Desktop/shared"
```

## Help
* [Port list](image/root/Desktop/DevToolsHelp/ports.md)

## Docker image
Use official docker hub to pull pre-build image:
https://hub.docker.com/r/firmom/centos-devtools/
