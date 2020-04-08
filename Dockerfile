FROM ubuntu
RUN apt-get update
RUN apt-get -y install curl git
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get -y install nodejs
RUN npm install -g truffle
COPY erc20_tokens ./
WORKDIR /erc20_tokens
RUN npm install
CMD ["npm", "run", "deploy"] 
