#!/bin/bash
# scripts/collect_metrics.sh — Collects system metrics and saves to reports/

# Define directories
BASE_DIR="$(dirname "$(dirname "$0")")"
REPORT_DIR="${BASE_DIR}/reports"
ARCHIVE_DIR="${BASE_DIR}/archive"

# Ensure directories exist
mkdir -p "$REPORT_DIR" "$ARCHIVE_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M")
OUTPUT_FILE="${REPORT_DIR}/metrics_${TIMESTAMP}.txt"

# Collect metrics
{
    echo "===== System Metrics Report ====="
    echo "Generated on: $(date)"
    echo ""
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)"
    echo ""
    echo "Memory Usage:"
    free -h
    echo ""
    echo "Disk Usage:"
    df -h
    echo ""
    echo "System Uptime:"
    uptime -p
    echo ""
    echo "Load Average:"
    uptime | awk -F'load average:' '{print $2}'
    echo "================================="
} > "$OUTPUT_FILE"

# Compress all today's reports at end of day (23:59)
CURRENT_DATE=$(date +"%Y%m%d")
if [ "$(date +%H%M)" == "2359" ]; then
    tar -czf "${ARCHIVE_DIR}/metrics_${CURRENT_DATE}.tar.gz" ${REPORT_DIR}/metrics_${CURRENT_DATE}_*.txt
    rm -f ${REPORT_DIR}/metrics_${CURRENT_DATE}_*.txt
fi

