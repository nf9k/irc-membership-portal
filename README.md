# IRC Membership Portal v2.2 - Deployment Guide

**Release Date:** February 6, 2026  
**Version:** 2.2 Final

---

## What's New in v2.2

### Major Features
1. **Auto-Generated Passwords** - Members set their own passwords via email
2. **Administrator Comments** - Internal payment tracking field (500 chars)
3. **PDF Export** - Sorted by last name, professional formatting
4. **Call Sign Editing** - Admins can update member call signs
5. **Automated Expiration Notifications** - Email alerts on status changes
6. **Send Update Notices** - Notify members when records are updated

### Bug Fixes & Improvements
- Fixed admin status preservation when editing own profile
- Added sortable dashboard columns
- Made call signs clickable links to edit
- Improved status badge logic (Active/Expiring/Expired)
- Enhanced security validations

---

## Quick Start Deployment

### Prerequisites
- Docker and Docker Compose installed
- Existing IRC Portal v2.1 or fresh installation
- Root/sudo access to server

### Step 1: Backup Current System
```bash
cd /docker/irc-membership-db
docker exec irc_membership_db mariadb-dump -u root -p > backup_pre_v2.2.sql
cp -r app app_backup_v2.1
```

### Step 2: Extract Release Files
```bash
cd /docker/irc-membership-db
unzip irc-portal-v2.2-release.zip
```

### Step 3: Apply Database Migrations
```bash
source .env

# Add admin comments field
docker exec -i irc_membership_db mariadb -u root -p"${DB_ROOT_PASSWORD}" < database/add_admin_comments.sql

# Add expiration tracking (if not already present)
docker exec -i irc_membership_db mariadb -u root -p"${DB_ROOT_PASSWORD}" < database/add_expiration_tracking.sql 2>/dev/null || echo "Expiration tracking already exists"
```

### Step 4: Update Application Files
```bash
# Backend
cp application/app.py app/app.py
cp application/requirements.txt requirements.txt

# Templates
cp templates/*.html app/templates/

# Scripts
cp scripts/check_expirations.py .
cp scripts/run_expiration_check.sh .
cp scripts/setup_expiration_notifications.sh .
chmod +x *.sh

# Optionally copy backup script
cp scripts/backup_and_email.sh .
chmod +x backup_and_email.sh
```

### Step 5: Rebuild and Restart
```bash
# Rebuild with new requirements
docker compose down
docker compose up -d --build

# Verify containers are running
docker compose ps

# Check logs
docker compose logs -f web
```

### Step 6: Test Deployment
```bash
# Test login
curl -I http://localhost:5000

# Check database connection
docker exec irc_membership_db mariadb -u root -p"${DB_ROOT_PASSWORD}" -e "SELECT COUNT(*) FROM irc_membership_db.members;"
```

### Step 7: Setup Expiration Notifications (Optional)
```bash
# Add to crontab
crontab -e

# Add this line for daily 9am checks:
0 9 * * * /docker/irc-membership-db/run_expiration_check.sh >> /docker/irc-membership-db/backups/expiration_check.log 2>&1
```

---

## File Structure

```
irc-portal-v2.2-release/
├── README.md (this file)
├── DEPLOYMENT.md
├── CHANGELOG.md
├── application/
│   ├── app.py
│   └── requirements.txt
├── templates/
│   ├── add_member.html
│   ├── base.html
│   ├── dashboard.html
│   ├── forgot_password.html
│   ├── login.html
│   └── profile.html
├── database/
│   ├── add_admin_comments.sql
│   └── add_expiration_tracking.sql
├── scripts/
│   ├── check_expirations.py
│   ├── run_expiration_check.sh
│   ├── setup_expiration_notifications.sh
│   └── backup_and_email.sh
├── documentation/
│   ├── IRC_Administrator_Manual_v2.2.md
│   ├── IRC_Member_User_Guide_v2.2.md
│   ├── IRC_MEMBERSHIP_PORTAL_TEST_PLAN_v2.2.md
│   └── EXPIRATION_NOTIFICATION_SYSTEM.md
└── tests/
    └── test_data_setup.sql
```

---

## Rollback Procedure

If issues arise:

```bash
cd /docker/irc-membership-db

# Stop services
docker compose down

# Restore application
rm -rf app
mv app_backup_v2.1 app

# Restore database (if needed)
docker compose up -d db
sleep 10
docker exec -i irc_membership_db mariadb -u root -p < backup_pre_v2.2.sql

# Restart
docker compose up -d
```

---

## Verification Checklist

After deployment, verify:

- ☐ Login works (admin and regular member)
- ☐ Dashboard displays with sortable columns
- ☐ Adding member auto-sends password reset email
- ☐ Admin comments field visible on profile (admins only)
- ☐ PDF export downloads and sorts by last name
- ☐ Status badges show correct colors
- ☐ Call signs are clickable links
- ☐ Password reset emails send correctly
- ☐ Update notifications send correctly

---

## Support

For issues or questions:
- Review documentation in `documentation/` folder
- Check test plan for validation procedures
- Contact: IRC administrators

---

## License

Proprietary - Indiana Repeater Council Internal Use Only
