FROM node
RUN npm install -g truffle
COPY erc20_tokens .
RUN npm install
CMD ["npm", "run", "deploy"] 
