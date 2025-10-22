
# System Monitor Project

## Overview
This project collects system performance metrics such as:
- CPU Usage
- Memory Usage
- Disk Usage
- System Uptime
- Load Average

Metrics are saved every 15 minutes into the `reports/` directory.
Every 24 hours, all reports are compressed into the `archive/` directory.

## Setup
1. Clone the repository.
2. Make the script executable:
   ```bash
   chmod +x scripts/collect_metrics.sh



command used for this:


---

## 🌐 Step 8: Initialize Git & Push

```bash
git init
git add scripts/collect_metrics.sh .gitignore README.md
git commit -m "Add system monitor script and documentation"
git branch -M main
git remote add origin https://github.com/sandeep428/system_monitor_project.git
git push -u origin main
