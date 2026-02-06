#!/bin/bash

# IRC Membership Expiration Check - Cron Wrapper
# This script runs the Python expiration checker inside the Docker container

cd /docker/irc-membership-db

# Copy script and .env to container
docker cp check_expirations.py irc_membership_web:/tmp/check_expirations.py
docker cp .env irc_membership_web:/tmp/.env

# Run the checker
docker exec irc_membership_web python3 /tmp/check_expirations.py

# Clean up
docker exec irc_membership_web rm -f /tmp/check_expirations.py /tmp/.env

exit 0
