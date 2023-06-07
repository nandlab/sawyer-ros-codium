# Sawyer-ROS-Codium Docker Container 

Based on [sawyer-ros](https://github.com/nandlab/sawyer-ros), additionally installs [VSCodium](https://vscodium.com/) with the [ROS](https://marketplace.visualstudio.com/items?itemName=ms-iot.vscode-ros) extension.

Build: `docker-compose build`

Run: `docker-compose run app`

Note: The container runs in priviliged mode, which is required for VSCodium to work. It might be a security risk.
