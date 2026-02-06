# Indiana Repeater Council
# Membership Portal
# Administrator Manual

**Version 2.2**  
Updated: February 5, 2026

---

## Table of Contents

1. Introduction
2. Getting Started
3. Dashboard Overview
4. Managing Members
5. Membership Status Management
6. Exporting Data
7. Automated Expiration Notifications (NEW)
8. PDF Export Feature (NEW)
9. Security Best Practices
10. Troubleshooting
11. Support and Contact

---

## 1. Introduction

Welcome to the Indiana Repeater Council Membership Portal Administrator Manual. This guide provides comprehensive instructions for managing the membership database, user accounts, and system administration tasks.

### 1.1 Administrator Responsibilities

* Manage member accounts and information
* Update membership status and dues records
* Handle password reset requests
* Send update notifications to members
* Export membership data for reporting
* Maintain data accuracy and security
* Monitor expiration notifications

---

## 2. Getting Started

### 2.1 Accessing the Portal

1. Navigate to the membership portal URL
2. Enter your call sign (uppercase, e.g., NF9K)
3. Enter your password
4. Click 'Login' to access the dashboard

### 2.2 Password Recovery

If you forget your password:

1. Click 'Password Recovery' on the login page
2. Enter your registered email address
3. Click 'Send Recovery Link'
4. Check your email for the reset link (valid for 24 hours)
5. Follow the link and create a new password

---

## 3. Dashboard Overview

The administrator dashboard displays all members and provides quick access to management functions.

### 3.1 Dashboard Features

* **Sortable Columns**: Click any column header to sort the member list
* **Clickable Call Signs**: Click a call sign to edit that member's profile
* **Member Count**: Total number of members displayed at bottom
* **Status Badges**: Color-coded membership status (Active/Expiring/Expired)

### 3.2 Action Buttons

**Export PDF (Blue)**: Download complete member list as PDF

**Add Member (Green)**: Create a new member account

**Send Update Notice (Blue envelope)**: Email member about record changes

**Reset Password (Yellow key)**: Send password reset email to member

**Delete Member (Red trash)**: Remove member from database (requires confirmation)

---

## 4. Managing Members

### 4.1 Adding a New Member

1. Click the 'Add Member' button on the dashboard
2. Complete the required fields:
   * **Call Sign** (required, used for login)
   * **Email Address** (required - password reset link will be sent automatically)
   * **Name/Group Name** (required)
3. Fill in contact information (address, city, state, phone)
4. Set membership status:
   * Member Type (Full, Associate, Life, Honorary)
   * Paid Through (year, e.g., 2025)
5. **Administrator Comments** (optional) - Add payment tracking notes:
   * Payment amount, date, method
   * Check numbers, PayPal confirmation
   * Renewal notes, special circumstances
   * This field is only visible to administrators
6. Check 'Grant Admin Privileges' if applicable
7. Click 'Add Member'

**What happens next:**
* System automatically generates a secure random password
* Member receives email with password reset link (valid 24 hours)
* Member clicks link and sets their own password
* Administrator never handles or knows member passwords

**Note**: Email address is required for the automated password setup process. If member doesn't have email, you'll need to manually assist them with password setup.

### 4.2 Editing Member Information

1. Click the member's call sign in the dashboard
2. Update any fields as needed
3. **Administrator Comments** (admin-only field):
   * Use this field to track payment information
   * Record: amounts, dates, payment methods, check numbers
   * Document special circumstances, board decisions
   * Members cannot see this field
   * 500 character limit
4. Click 'Save Changes'
5. Optionally send an update notification (see section 4.5)

**Note**: Only administrators can edit call signs. If a member upgrades their license, you must update their call sign. The member will need to re-login with the new call sign.

**Administrator Comments Examples:**
```
Paid $25 via check #1234 on 02/05/2026
Renewed 2026-2027, PayPal conf XYZ123
Life membership granted 01/15/2020
Comp membership - board decision 11/2024
```

### 4.3 Changing a Call Sign

When a member upgrades or changes their license:

1. Click the member's old call sign to edit their profile
2. Update the Call Sign field to the new call sign
3. Click 'Save Changes'
4. System will verify the new call sign is not already in use
5. If you changed your own call sign, you will be logged out and must re-login
6. If you changed another member's call sign, they will need to login with the new call sign
7. Send an update notice to inform the member (recommended)

### 4.4 Resetting Member Passwords

To send a password reset email to a member:

1. Locate the member in the dashboard
2. Click the yellow key icon in the Actions column
3. Confirm the email address in the popup
4. Member will receive an email with a reset link (valid 24 hours)

**Note**: Member must have a valid email address on file for this feature to work.

### 4.5 Sending Update Notifications

After updating a member's record, you can notify them:

1. Return to the dashboard after saving changes
2. Locate the member in the list
3. Click the blue envelope icon in the Actions column
4. Confirm sending the notification
5. Member receives email: 'Your membership record has been updated'

**Note**: You cannot send update notifications to yourself.

### 4.6 Deleting a Member

**WARNING**: Deletion is permanent and cannot be undone.

1. Locate the member in the dashboard
2. Click the red trash icon in the Actions column
3. Confirm the deletion in the popup dialog
4. Member is immediately removed from the database

**Note**: You cannot delete your own account.

---

## 5. Membership Status Management

### 5.1 Member Types

**FULL** - Regular voting member

**ASSOCIATE** - Non-voting member

**LIFE** - Lifetime member (no annual dues)

**HONORARY** - Honorary member

### 5.2 Updating Dues Status

1. Click the member's call sign to edit their profile
2. Update 'Paid Through' field with the year (e.g., 2025, 2026)
3. Update 'Member Type' if needed
4. Click 'Save Changes'

### 5.3 Status Badges

The dashboard displays color-coded status badges:

**GREEN (Active)** - Paid through a future year (e.g., paid through 2027 when it's 2026)

**YELLOW (Expiring Soon)** - Paid through current year (e.g., paid through 2026 when it's 2026)
* These members need to renew for next year
* Shows year-round so you can track renewals

**RED (Expired)** - Paid through a past year (e.g., paid through 2025 when it's 2026)

**Example in February 2026:**
* Member paid through 2027+ → Active (Green) - good for next year
* Member paid through 2026 → Expiring (Yellow) - needs to renew for 2027
* Member paid through 2025 or earlier → Expired (Red) - past due

---

## 6. Exporting Data

### 6.1 PDF Export (NEW)

To export the complete member list as PDF:

1. Click the 'Export PDF' button on the dashboard
2. PDF is generated and downloaded automatically
3. Filename format: IRC_Membership_MMDDYYYY_HHMM.pdf

The PDF includes:

* Header with IRC logo and title
* Generation date and time
* Total member count
* Complete member table with all fields **sorted by last name**
* Professional formatting suitable for printing
* Confidentiality notice

### 6.2 Automated Backups

The system automatically emails database backups to designated administrators. Each backup includes:

* Complete SQL database dump
* CSV export of member data
* Compressed ZIP file for easy storage

Backups are retained for 30 days on the server.

---

## 7. Automated Expiration Notifications (NEW)

The system automatically monitors membership expiration status and sends email notifications to members when their status changes.

### 7.1 How It Works

The notification system runs automatically (via cron) and only sends emails when a member's status actually changes:

* Member approaching expiration → Email: 'Membership expiring soon'
* Member expires → Email: 'Membership expired'
* Member renews → Email: 'Thank you! Membership is active'
* No status change → No email (prevents spam)

### 7.2 Status Definitions

**ACTIVE** - Paid through a future year (e.g., 2027 when current year is 2026)

**EXPIRING** - Paid through current year (e.g., 2026 when current year is 2026)
* Member needs to renew for next year
* Shown year-round to track who needs renewal

**EXPIRED** - Paid through a past year (e.g., 2025 when current year is 2026)

### 7.3 Administrator Summary Emails

After each automated check, administrators receive a summary email containing:

* Number of notifications sent
* Status changes detected (expired, expiring, renewed)
* List of members notified with their status transitions
* Failed notifications (members without email addresses)
* Overall membership statistics
* Action items requiring administrator attention

Example summary:

```
IRC Membership Expiration Notification Summary
Date: 2026-02-05 09:00:15

Notifications Sent: 12
Failed to Send: 2

Status Changes:
- Now Expired: 5
- Expiring Soon: 3
- Renewed/Active: 4

Details:
✓ W9ABC (expiring → expired) - w9abc@email.com
✓ K9XYZ (expired → active) - k9xyz@email.com
✗ N9TEST (expiring → expired) - NO EMAIL

Total Active Members: 85
Total Expiring Soon: 8
Total Expired: 10

Members Without Email Addresses:
  • N9TEST (expired)
  • KC9ABC (expiring)
```

### 7.4 What Triggers Notifications

Notifications are triggered by status changes, not by calendar dates:

**Example 1**: On January 1st, member's status changes from 'expiring' (paid 2025) to 'expired'
→ Email sent: 'Your membership has expired'

**Example 2**: Administrator updates member's paid_thru from 2025 to 2027
→ Email sent: 'Thank you! Your membership is active'

**Example 3**: Member's status remains 'expiring' throughout the year (paid 2026)
→ No emails sent (status unchanged - prevents spam)

**Example 4**: Member renews mid-year: paid_thru updated from 2026 to 2027
→ Status changes 'expiring' to 'active'
→ Email sent: 'Thank you for renewing!'

### 7.5 Administrator Actions

When you receive a summary email:

1. Review failed notifications - Contact members without email addresses
2. Verify expired members - Confirm if renewals are pending
3. Update records - Add missing email addresses when available
4. Monitor trends - Watch for unusual spikes in expirations

### 7.6 Member Email Templates

Members receive professional, personalized emails containing:

* Their call sign and current status
* Paid through year information
* Clear action items (renew, no action needed, etc.)
* Contact information for renewal or questions
* Link to the membership portal

### 7.7 Preventing Duplicate Notifications

The system tracks notification history in the database using two fields:

* `expiration_status` - Last known status (active, expiring, expired)
* `expiration_notice_sent` - Date of last notification

Each time the system runs, it compares the current status to the stored status. Emails are only sent when these differ, ensuring members never receive duplicate notifications for the same status.

---

## 8. PDF Export Feature (Details)

### 8.1 Using PDF Exports

PDF exports are useful for:

* Board meetings and reports
* Offline reference
* Sharing with authorized personnel
* Record keeping and archives
* Printing hard copies

**Note**: PDF exports contain confidential member information. Store and share securely.

### 8.2 PDF vs Database Backups

**PDF Export** - Human-readable snapshot for reports and sharing

**Database Backup** - Complete data backup for disaster recovery (automated, emailed to admins)

Both serve different purposes. PDF exports are for reference; database backups are for system restoration.

---

## 9. Security Best Practices

### 9.1 Password Management

* Use a strong, unique password for your admin account
* Change your password regularly (every 90 days recommended)
* Never share your admin credentials
* Log out when finished, especially on shared computers

### 9.2 Data Protection

* Member data is confidential - only share with authorized individuals
* Verify member identity before making changes to accounts
* Be cautious with bulk changes - double-check before saving
* Store downloaded backups and PDFs securely

### 9.3 Admin Account Management

* Grant admin privileges only to trusted individuals
* Review admin accounts periodically
* Remove admin access when no longer needed
* Document who has admin access

---

## 10. Troubleshooting

### 10.1 Cannot Login

**Solution**:
* Verify call sign is entered in uppercase
* Use Password Recovery if needed
* Contact system administrator if problem persists

### 10.2 Password Reset Email Not Received

**Solution**:
* Check spam/junk folder
* Verify correct email address is on file
* Wait a few minutes and try again
* Contact system administrator to verify SMTP configuration

### 10.3 Call Sign Already in Use

**Solution**:
* Search for existing member with that call sign
* If duplicate entry, delete the incorrect one
* If member changed call signs, update the old record instead of creating new

### 10.4 Member Cannot Login After Call Sign Change

**Solution**:
* Verify they are using the NEW call sign to login
* Send password reset if they've forgotten password
* Send update notification to remind them of the change

### 10.5 Expiration Notifications Not Sending

**Solution**:
* Check that cron job is running properly
* Verify SMTP settings in system configuration
* Review admin summary emails for error details
* Contact system administrator

---

## 11. Support and Contact

For technical support or questions about the membership portal:

**Indiana Repeater Council Service Desk**  
Website: https://service-desk.ircinc.org  
Email: chairman@ircinc.org

**Current Administrators:**
* NF9K
* AK9R
* WA9FDO

---

73,  
Indiana Repeater Council  
Membership Portal Team

---

*Indiana Repeater Council - Membership Portal Administrator Manual - Version 2.2*
