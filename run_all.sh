sleep 2
ingrid-cli accounts create ingrid \
  --auth hi_ingrid \
  --ilp-address example.ingrid \
  --asset-code XMR \
  --asset-scale 1 \
  --ilp-over-http-incoming-token ingrid_password
sleep 2
ingrid-cli accounts create hugo \
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
hugo-cli accounts create ingrid \
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
hugo-cli accounts create felix \
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
felix-cli accounts create hugo \
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
felix-cli accounts create david \
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
david-cli accounts create felix \
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
bob-cli accounts create david \
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
david-cli accounts create bob \
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
bob-cli accounts create charlie \
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
charlie-cli accounts create bob \
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
charlie-cli accounts create charlie \
  --auth hi_charlie \
  --ilp-address example.charlie \
  --asset-code XRP \
  --asset-scale 1 \
  --ilp-over-http-incoming-token charlie_password
sleep 2
charlie-cli accounts balance charlie --auth hi_charlie 
charlie-cli accounts balance bob --auth hi_charlie
bob-cli accounts balance charlie --auth hi_bob
bob-cli accounts balance david --auth hi_bob
david-cli accounts balance bob --auth hi_david
david-cli accounts balance felix --auth hi_david
felix-cli accounts balance david --auth hi_felix
felix-cli accounts balance hugo --auth hi_felix
hugo-cli accounts balance felix --auth hi_hugo
hugo-cli accounts balance ingrid --auth hi_hugo
ingrid-cli accounts balance hugo --auth hi_ingrid
ingrid-cli accounts balance ingrid --auth hi_ingrid
charlie-cli pay charlie \
  --auth charlie_password \
  --amount 2500 \
  --to http://ingrid-node:7770/accounts/ingrid/spsp
sleep 2
charlie-cli accounts balance charlie --auth hi_charlie 
charlie-cli accounts balance bob --auth hi_charlie
bob-cli accounts balance charlie --auth hi_bob
bob-cli accounts balance david --auth hi_bob
david-cli accounts balance bob --auth hi_david
david-cli accounts balance felix --auth hi_david
felix-cli accounts balance david --auth hi_felix
felix-cli accounts balance hugo --auth hi_felix
hugo-cli accounts balance felix --auth hi_hugo
hugo-cli accounts balance ingrid --auth hi_hugo
ingrid-cli accounts balance hugo --auth hi_ingrid
ingrid-cli accounts balance ingrid --auth hi_ingrid
