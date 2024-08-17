import re

# Configuration
log_file_path = "/path/to/your/logfile.log"
report_file_path = "/path/to/output/report.txt"
error_pattern = r"ERROR"

def analyze_logs(log_file, report_file, pattern):
    with open(log_file, "r") as log, open(report_file, "w") as report:
        errors = []
        for line in log:
            if re.search(pattern, line):
                errors.append(line)
        
        if errors:
            report.write(f"Found {len(errors)} errors in the log file:\n\n")
            report.write("\n".join(errors))
        else:
            report.write("No errors found in the log file.\n")

    print(f"Analysis complete. Report saved to {report_file_path}")

if __name__ == "__main__":
    analyze_logs(log_file_path, report_file_path, error_pattern)
#pour executer periodiquement 
#crontab -e
#ensuite 
#0 2 * * * /path/to/backup_db.sh
#ainsi le script sera lancé tout les jours à 2h00 du matin

