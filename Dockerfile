FROM node
COPY erc20_tokens ./
WORKDIR /erc20_tokens
RUN npm install
CMD ["npm", "run", "deploy"] 
