FROM ubuntu
RUN apt-get update
RUN apt-get -y install curl git wget
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get -y install nodejs
RUN npm install -g truffle
RUN wget -r https://github.com/boivlad/erc20-tokens
RUN wget -r https://github.com/andrii482/7nodes/truffle_npm_install_deploy.sh
RUN  chmod +x 7nodes/truffle_npm_install_deploy.sh
CMD sh 7nodes/truffle_npm_install_deploy.sh
