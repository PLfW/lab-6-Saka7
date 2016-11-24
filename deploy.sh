#!/bin/bash

# Login with username or email
rhc setup -l IhorSakaylyuk@gmail.com
# Create Node.js app
rhc app create sunbird nodejs-latest
# Add postgreSQL
rhc cartridge-add postgresql --app sunbird
# Get remote SSH address
sunbird_ssh=$(rhc app-show sunbird --gears ssh)
# Add to git repository
git remote add production $sunbird_ssh
# Push to production
git push production master
