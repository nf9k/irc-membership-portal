# IRC Membership Portal v2.2 - Quick Reference

## 📦 Release Package Contents

```
irc-portal-v2.2-release/
├── README.md                   ← Start here!
├── CHANGELOG.md                ← What's new in v2.2
├── application/
│   ├── app.py                  ← Main Flask application
│   └── requirements.txt        ← Python dependencies
├── templates/                  ← All HTML templates
│   ├── add_member.html
│   ├── base.html
│   ├── dashboard.html
│   ├── forgot_password.html
│   ├── login.html
│   └── profile.html
├── database/                   ← Database migrations
│   ├── add_admin_comments.sql
│   └── add_expiration_tracking.sql
├── scripts/                    ← Automation scripts
│   ├── check_expirations.py
│   ├── run_expiration_check.sh
│   ├── setup_expiration_notifications.sh
│   └── backup_and_email.sh
├── documentation/              ← User guides & manuals
│   ├── IRC_Administrator_Manual_v2.2.md
│   ├── IRC_Member_User_Guide_v2.2.md
│   ├── IRC_MEMBERSHIP_PORTAL_TEST_PLAN_v2.2.md
│   └── EXPIRATION_NOTIFICATION_SYSTEM.md
└── tests/
    └── test_data_setup.sql     ← Test account creation
```

---

## 🚀 Quick Deployment (5 Steps)

```bash
# 1. Backup current system
cd /docker/irc-membership-db
docker exec irc_membership_db mariadb-dump -u root -p > backup.sql

# 2. Extract release
unzip irc-portal-v2.2-release.zip
cd irc-portal-v2.2-release

# 3. Apply database migrations
source /docker/irc-membership-db/.env
docker exec -i irc_membership_db mariadb -u root -p"${DB_ROOT_PASSWORD}" < database/add_admin_comments.sql

# 4. Update files
cp application/* /docker/irc-membership-db/
cp templates/* /docker/irc-membership-db/app/templates/
cp scripts/* /docker/irc-membership-db/

# 5. Rebuild and restart
cd /docker/irc-membership-db
docker compose down && docker compose up -d --build
```

---

## ✨ New Features Summary

| Feature | Description | File(s) Affected |
|---------|-------------|------------------|
| **Auto Passwords** | System generates & emails reset link | add_member.html, app.py |
| **Admin Comments** | 500-char internal notes field | profile.html, app.py, SQL |
| **PDF Export** | Sorted by last name | app.py |
| **Call Sign Edit** | Admins can change call signs | profile.html, app.py |
| **Notifications** | Auto-email on status changes | check_expirations.py |
| **Sortable Columns** | Click to sort dashboard | dashboard.html |
| **Clickable Call Signs** | Links to edit profile | dashboard.html |

---

## 📋 Post-Deployment Checklist

```
☐ Login as admin works
☐ Add new member (auto-sends password reset)
☐ Admin comments field visible (admins only)
☐ PDF export downloads & sorts by last name
☐ Status badges show correct colors
☐ Call signs are clickable
☐ Email notifications work (test with admin reset)
☐ Sortable columns work on dashboard
```

---

## 🔧 Optional: Setup Expiration Notifications

```bash
cd /docker/irc-membership-db

# Install (if not already done)
docker exec -i irc_membership_db mariadb -u root -p < database/add_expiration_tracking.sql

# Schedule daily checks at 9 AM
crontab -e
# Add: 0 9 * * * /docker/irc-membership-db/run_expiration_check.sh >> /docker/irc-membership-db/backups/expiration_check.log 2>&1
```

---

## 🔄 Rollback (If Needed)

```bash
cd /docker/irc-membership-db
docker compose down
docker exec -i irc_membership_db mariadb -u root -p < backup.sql
docker compose up -d
```

---

## 📞 Support

- **Documentation**: See `documentation/` folder
- **Test Plan**: Use for validation procedures
- **Contact**: IRC administrators

---

## 🔐 Security Notes

- Admin comments are database-level encrypted
- Passwords never visible to admins
- SMTP credentials in .env (never commit!)
- Session timeout: 24 hours
- SQL injection protection: parameterized queries

---

## 📊 System Requirements

- Docker & Docker Compose
- MariaDB 11
- Python 3.9+
- SMTP server access (SMTP2GO configured)
- 100MB disk space minimum

---

## 🎯 Key Files to Review

1. **README.md** - Full deployment guide
2. **CHANGELOG.md** - Complete feature list
3. **IRC_Administrator_Manual_v2.2.md** - Admin usage
4. **IRC_MEMBERSHIP_PORTAL_TEST_PLAN_v2.2.md** - Testing procedures

---

*Indiana Repeater Council - Internal Use Only*
