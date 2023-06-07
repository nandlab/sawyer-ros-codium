FROM sawyer-ros:latest

USER root

RUN wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | tee /usr/share/keyrings/vscodium-archive-keyring.gpg > /dev/null

RUN echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | tee /etc/apt/sources.list.d/vscodium.list

RUN apt-get update && apt-get install -y codium

USER docker
WORKDIR /home/docker

RUN printf "\
export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'\n\
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'\n\
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'\n\
export VSCODE_GALLERY_CONTROL_URL=''\n\
" >> ~/.profile

RUN . ~/.profile && codium --pre-release --install-extension ms-iot.vscode-ros

CMD ["/bin/bash", "--login"]