#!/bin/bash

# IRC Expiration Notification System Setup Script

set -e

echo "=========================================="
echo "IRC Expiration Notification Setup"
echo "=========================================="
echo ""

cd /docker/irc-membership-db

# Load environment variables
if [ ! -f .env ]; then
    echo "Error: .env file not found!"
    exit 1
fi

source .env

# 1. Add database columns
echo "Step 1: Adding database tracking columns..."
docker exec -i irc_membership_db mariadb -u root -p"${DB_ROOT_PASSWORD}" < add_expiration_tracking.sql

echo "✓ Database updated"
echo ""

# 2. Make script executable
echo "Step 2: Setting up notification script..."
chmod +x check_expirations.py run_expiration_check.sh

echo "✓ Script ready"
echo ""

# 3. Test the script
echo "Step 3: Testing notification check (dry run)..."
echo "This will check for status changes and may send notifications if statuses have changed."
read -p "Press Enter to continue..."

docker cp check_expirations.py irc_membership_web:/tmp/check_expirations.py
docker cp .env irc_membership_web:/tmp/.env

docker exec irc_membership_web python3 /tmp/check_expirations.py

docker exec irc_membership_web rm /tmp/check_expirations.py /tmp/.env

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo ""
echo "1. Review the test output above"
echo "2. Add to crontab for daily checks:"
echo ""
echo "   crontab -e"
echo ""
echo "   Add this line:"
echo "   0 9 * * * /docker/irc-membership-db/run_expiration_check.sh >> /docker/irc-membership-db/backups/expiration_check.log 2>&1"
echo ""
echo "This will run daily at 9:00 AM and log output."
echo ""
echo "To manually run a check:"
echo "   ./run_expiration_check.sh"
echo ""
echo "=========================================="
