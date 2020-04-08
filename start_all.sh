docker stop redis ethereum-testnet bob-node charlie-node  bob-eth bob-xrp charlie-xrp david-eth david-ltc david-node felix-ltc felix-xtz felix-node  hugo-xtz hugo-xmr hugo-node ingrid-xmr ingrid-node ubuntu_truffle
docker rm redis ethereum-testnet bob-node charlie-node  bob-eth bob-xrp charlie-xrp david-eth david-ltc david-node felix-ltc felix-xtz felix-node  hugo-xtz hugo-xmr hugo-node ingrid-xmr ingrid-node ubuntu_truffle
docker network rm local-ilp
docker pull interledgerrs/ilp-cli
docker pull interledgerrs/ilp-settlement-ethereum
docker pull trufflesuite/ganache-cli
docker pull interledgerjs/settlement-xrp
docker pull redis
docker build -f ./docker/ilp-node.dockerfile -t interledgerrs/ilp-node --build-arg CARGO_BUILD_OPTION="--release --features monitoring --manifest-path ./crates/ilp-node/Cargo.toml" --build-arg RUST_BIN_DIR_NAME="release" https://github.com/interledger-rs/interledger-rs.git
sleep 2
docker network create local-ilp
sleep 2
docker run -d \
  --name redis \
  --network local-ilp \
  redis --databases 35
sleep 2
docker run -d \
  --name ethereum-testnet \
  --network local-ilp \
  trufflesuite/ganache-cli \
  -m "abstract vacuum mammal awkward pudding scene penalty purchase dinner depart evoke puzzle" \
  -i 1
sleep 2
docker run  -d \
  --name bob-eth \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-settlement-ethereum \
  --private_key cc96601bc52293b53c4736a12af9130abf347669b3813f9ec4cafdf6991b087e \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://ethereum-testnet:8545 \
  --connector_url http://bob-node:7771 \
  --redis_url redis://redis:6379/2 \
  --asset_scale 1 \
  --settlement_api_bind_address 0.0.0.0:3000
 sleep 2
 docker run  -d \
  --name bob-xrp \
  --network local-ilp \
  -e "DEBUG=settlement*" \
  -e "CONNECTOR_URL=http://bob-node:7771" \
  -e "REDIS_URI=redis://redis:6379/3" \
  -e "ENGINE_PORT=3001" \
  interledgerjs/settlement-xrp
sleep 2
  docker run --rm -itd --network=local-ilp -e "RUST_LOG=interledger=trace" --name bob-node interledgerrs/ilp-node --admin_auth_token hi_bob --redis_url redis://redis:6379/4  --secret_seed 1604966725982139900555208458637022875563691455429373719368053354   --ilp_address example.bob  --settlement_api_bind_address 0.0.0.0:7771 --http_bind_address 0.0.0.0:7770  --exchange_rate.provider CoinCap
sleep 2
docker run -d \
  --name charlie-xrp \
  --network local-ilp \
  -e "DEBUG=settlement*" \
  -e "CONNECTOR_URL=http://charlie-node:7771" \
  -e "REDIS_URI=redis://redis:6379/5" \
  -e "ENGINE_PORT=3000" \
  interledgerjs/settlement-xrp
sleep 2
docker run --rm -itd --network=local-ilp -e "RUST_LOG=interledger=trace" --name charlie-node interledgerrs/ilp-node --admin_auth_token hi_charlie --redis_url redis://redis:6379/6  --secret_seed 1232362131122139900555208458637022875563691455429373719368053354   --ilp_address example.charlie  --settlement_api_bind_address 0.0.0.0:7771 --http_bind_address 0.0.0.0:7770  --exchange_rate.provider CoinCap
 sleep 2
docker run -d \
  --name david-ltc \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-settlement-ethereum \
  --private_key 9544f9dc4144d3703e11b5101753d7e689b2adeb65f710810549b1cfd9410b30 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://ethereum-testnet:8545 \
  --token_address 0x770bC1820890415bB14a3B8f992c19caA74906aD \
  --connector_url http://david-node:7771 \
  --redis_url redis://redis:6379/7 \
  --asset_scale 1 \
  --settlement_api_bind_address 0.0.0.0:3000
sleep 2
docker run -d \
  --name david-eth \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-settlement-ethereum \
  --private_key 9544f9dc4144d3703e11b5101753d7e689b2adeb65f710810549b1cfd9410b30 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://ethereum-testnet:8545 \
  --connector_url http://david-node:7771 \
  --redis_url redis://redis:6379/8 \
  --asset_scale 1 \
  --settlement_api_bind_address 0.0.0.0:3000 
sleep 2
docker run -d \
  --name david-node \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-node \
  --ilp_address example.david \
  --secret_seed 998dc239980a32a1c9b57baaa4dd148d25bf8e09cb969d92252c1610622ee950 \
  --admin_auth_token hi_david \
  --redis_url redis://redis:6379/9 \
  --http_bind_address 0.0.0.0:7770 \
  --settlement_api_bind_address 0.0.0.0:7771 \
  --exchange_rate.provider CoinCap  
sleep 2
docker run -d \
  --name felix-ltc \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-settlement-ethereum \
  --private_key 6160e7b1c3d369a20a795ce45ebd183f18fdcd2d29afa164f7c4a3462c2a2e30 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://ethereum-testnet:8545 \
  --token_address 0x770bC1820890415bB14a3B8f992c19caA74906aD \
  --connector_url http://felix-node:7771 \
  --redis_url redis://redis:6379/12 \
  --asset_scale 1 \
  --settlement_api_bind_address 0.0.0.0:3000
sleep 2
docker run -d \
  --name felix-xtz \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-settlement-ethereum \
  --private_key 6160e7b1c3d369a20a795ce45ebd183f18fdcd2d29afa164f7c4a3462c2a2e30 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://ethereum-testnet:8545 \
  --token_address 0x93B76470AFaF43155cbDD57E42F16E0Bd96eC881 \
  --connector_url http://felix-node:7771 \
  --redis_url redis://redis:6379/13 \
  --asset_scale 1 \
  --settlement_api_bind_address 0.0.0.0:3000
sleep 2
docker run -d \
  --name felix-node \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-node \
  --ilp_address example.felix \
  --secret_seed da5527165fdfdd8390559fcffb1ee5387441229e43101a5b4e208969d1872dc3 \
  --admin_auth_token hi_felix \
  --redis_url redis://redis:6379/14 \
  --http_bind_address 0.0.0.0:7770 \
  --settlement_api_bind_address 0.0.0.0:7771 \
  --exchange_rate.provider CoinCap  
sleep 2
docker run -d \
  --name hugo-xtz \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-settlement-ethereum \
  --private_key 39723127198f3712aa3924b6e282a169f438c53a26e9141d304a328ba23f8175 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://ethereum-testnet:8545 \
  --token_address 0x93B76470AFaF43155cbDD57E42F16E0Bd96eC881 \
  --connector_url http://hugo-node:7771 \
  --redis_url redis://redis:6379/17 \
  --asset_scale 1 \
  --settlement_api_bind_address 0.0.0.0:3000
sleep 2
docker run -d \
  --name hugo-xmr \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-settlement-ethereum \
  --private_key 39723127198f3712aa3924b6e282a169f438c53a26e9141d304a328ba23f8175 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://ethereum-testnet:8545 \
  --token_address 0xcf5270f9Fad4C9b3E05074B7C3F2c0D5F5707fDB \
  --connector_url http://hugo-node:7771 \
  --redis_url redis://redis:6379/18 \
  --asset_scale 1 \
  --settlement_api_bind_address 0.0.0.0:3000
sleep 2
docker run -d \
  --name hugo-node \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-node \
  --ilp_address example.hugo \
  --secret_seed 887cac04a3d6a297e19d8a9d89d3efd611a004528f979139914b1b89245def90 \
  --admin_auth_token hi_hugo \
  --redis_url redis://redis:6379/19 \
  --http_bind_address 0.0.0.0:7770 \
  --settlement_api_bind_address 0.0.0.0:7771 \
  --exchange_rate.provider CoinCap  
sleep 2
docker run -d \
  --name ingrid-xmr \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-settlement-ethereum \
  --private_key 7eef7cc831dff98c8c7cf742b183e4c5505cd19f0538dafccdcbfd986d441a6c \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://ethereum-testnet:8545 \
  --token_address 0xcf5270f9Fad4C9b3E05074B7C3F2c0D5F5707fDB \
  --connector_url http://ingrid-node:7771 \
  --redis_url redis://redis:6379/20 \
  --asset_scale 1 \
  --settlement_api_bind_address 0.0.0.0:3000
sleep 2
docker run -d \
  --name ingrid-node \
  --network local-ilp \
  -e "RUST_LOG=interledger=trace" \
  interledgerrs/ilp-node \
  --ilp_address example.ingrid \
  --secret_seed f5afcae854869ad7eba9e278983af25685c45c90e84778005d01fc8c7d6340b3 \
  --admin_auth_token hi_ingrid \
  --redis_url redis://redis:6379/21 \
  --http_bind_address 0.0.0.0:7770 \
  --settlement_api_bind_address 0.0.0.0:7771 \
  --exchange_rate.provider CoinCap 
sleep 2
git clone https://github.com/andrii482/7nodes.git
cd 7nodes
docker build --no-cache -t ubuntu_truffle .
sleep 2
docker run --rm -itd  --name ubuntu_truffle  --network local-ilp  ubuntu_truffle
cd
sleep 2
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://ingrid-node:7770 accounts create ingrid \
  --auth hi_ingrid \
  --ilp-address example.ingrid \
  --asset-code XMR \
  --asset-scale 1 \
  --ilp-over-http-incoming-token ingrid_password
sleep 2
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://ingrid-node:7770 accounts create hugo \
  --auth hi_ingrid \
  --ilp-address example.hugo \
  --asset-code XMR \
  --asset-scale 1 \
  --settlement-engine-url http://ingrid-xmr:3000 \
  --ilp-over-http-incoming-token hugo_password \
  --ilp-over-http-outgoing-token ingrid_password \
  --ilp-over-http-url http://hugo-node:7770/accounts/ingrid/ilp \
  --settle-threshold 2 \
  --settle-to 1 \
  --min-balance -150000 \
  --routing-relation Peer
sleep 2
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://hugo-node:7770 accounts create ingrid \
  --auth hi_hugo \
  --ilp-address example.ingrid \
  --asset-code XMR \
  --asset-scale 2 \
  --max-packet-amount 100000 \
  --settlement-engine-url http://hugo-xmr:3000 \
  --ilp-over-http-incoming-token ingrid_password \
  --ilp-over-http-outgoing-token hugo_password \
  --ilp-over-http-url http://ingrid-node:7770/accounts/hugo/ilp \
  --settle-threshold 2 \
  --settle-to 1 \
  --min-balance -150000 \
  --routing-relation Peer
sleep 2
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://hugo-node:7770 accounts create felix \
  --auth hi_hugo \
  --ilp-address example.felix \
  --asset-code XTZ \
  --asset-scale 1 \
  --max-packet-amount 100000 \
  --settlement-engine-url http://hugo-xtz:3000 \
  --ilp-over-http-incoming-token felix_password \
  --ilp-over-http-outgoing-token hugo_other_password \
  --ilp-over-http-url http://felix-node:7770/accounts/hugo/ilp \
  --settle-threshold 2 \
  --settle-to 1 \
  --min-balance -150000 \
  --routing-relation Peer
sleep 2
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://felix-node:7770 accounts create hugo \
  --auth hi_felix \
  --ilp-address example.hugo \
  --asset-code XTZ \
  --asset-scale 1 \
  --max-packet-amount 100000 \
  --settlement-engine-url http://felix-xtz:3000 \
  --ilp-over-http-incoming-token hugo_other_password \
  --ilp-over-http-outgoing-token felix_password \
  --ilp-over-http-url http://hugo-node:7770/accounts/felix/ilp \
  --settle-threshold 2 \
  --settle-to 1 \
  --min-balance -150000 \
  --routing-relation Peer
sleep 2
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://felix-node:7770 accounts create david \
  --auth hi_felix \
  --ilp-address example.david \
  --asset-code LTC \
  --asset-scale 1 \
  --max-packet-amount 100000 \
  --settlement-engine-url http://felix-ltc:3000 \
  --ilp-over-http-incoming-token david_password \
  --ilp-over-http-outgoing-token felix_other_password \
  --ilp-over-http-url http://david-node:7770/accounts/felix/ilp \
  --settle-threshold 2 \
  --settle-to 1 \
  --min-balance -150000 \
  --routing-relation Peer
sleep 2
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://david-node:7770 accounts create felix \
  --auth hi_david \
  --ilp-address example.felix \
  --asset-code LTC \
  --asset-scale 1 \
  --max-packet-amount 100000 \
  --settlement-engine-url http://david-ltc:3000 \
  --ilp-over-http-incoming-token felix_other_password \
  --ilp-over-http-outgoing-token david_password \
  --ilp-over-http-url http://felix-node:7770/accounts/david/ilp \
  --settle-threshold 2 \
  --settle-to 1 \
  --min-balance -150000 \
  --routing-relation Peer
sleep 2  
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://bob-node:7770 accounts create david \
  --auth hi_bob \
  --ilp-address example.david \
  --asset-code ETH \
  --asset-scale 1 \
  --max-packet-amount 100000 \
  --settlement-engine-url http://bob-eth:3000 \
  --ilp-over-http-incoming-token david_other_password \
  --ilp-over-http-outgoing-token bob_password \
  --ilp-over-http-url http://david-node:7770/accounts/bob/ilp \
  --settle-threshold 20 \
  --settle-to 10 \
  --min-balance -150000 \
  --routing-relation Peer
sleep 2  
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://david-node:7770 accounts create bob \
  --auth hi_david \
  --ilp-address example.bob \
  --asset-code ETH \
  --asset-scale 1 \
  --max-packet-amount 100000 \
  --settlement-engine-url http://david-eth:3000 \
  --ilp-over-http-incoming-token bob_password \
  --ilp-over-http-outgoing-token david_other_password \
  --ilp-over-http-url http://bob-node:7770/accounts/david/ilp \
  --settle-threshold 2 \
  --settle-to 1 \
  --min-balance -150000 \
  --routing-relation Peer
sleep 2  
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://bob-node:7770 accounts create charlie \
  --auth hi_bob \
  --ilp-address example.charlie \
  --asset-code XRP \
  --asset-scale 1 \
  --max-packet-amount 100000 \
  --settlement-engine-url http://bob-xrp:3001 \
  --ilp-over-http-incoming-token charlie_password \
  --ilp-over-http-outgoing-token bob_other_password \
  --ilp-over-http-url http://charlie-node:7770/accounts/bob/ilp \
  --settle-threshold 2200 \
  --settle-to 100 \
  --min-balance -150000 \
  --routing-relation Peer
sleep 2  
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://charlie-node:7770 accounts create bob \
  --auth hi_charlie \
  --ilp-address example.bob \
  --asset-code XRP \
  --asset-scale 1 \
  --max-packet-amount 100000 \
  --settlement-engine-url http://charlie-xrp:3000 \
  --ilp-over-http-incoming-token bob_other_password \
  --ilp-over-http-outgoing-token charlie_password \
  --ilp-over-http-url http://bob-node:7770/accounts/charlie/ilp \
  --settle-threshold 2200 \
  --settle-to 100 \
  --min-balance -150000 \
  --routing-relation Peer
sleep 2  
docker run --rm --network local-ilp interledgerrs/ilp-cli --node http://charlie-node:7770 accounts create charlie \
  --auth hi_charlie \
  --ilp-address example.charlie \
  --asset-code XRP \
  --asset-scale 1 \
  --ilp-over-http-incoming-token charlie_password
