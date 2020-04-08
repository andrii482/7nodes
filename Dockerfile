FROM ubuntu
RUN apt-get update
RUN apt-get -y install curl git
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get -y install nodejs
RUN npm install -g truffle
RUN git clone https://github.com/boivlad/erc20-tokens.git
WORKDIR /erc20-tokens
RUN npm install
CMD ["npm", "run", "deploy"] 
