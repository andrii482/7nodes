FROM node
RUN npm install -g truffle
COPY erc20_tokens .
RUN ls -la
WORKDIR /erc20_tokens
RUN pwd
RUN ls -la
RUN npm install
CMD ["npm", "run", "deploy"] 
