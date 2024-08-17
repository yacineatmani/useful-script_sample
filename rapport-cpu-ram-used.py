import psutil

def generate_report():
    cpu_usage = psutil.cpu_percent(interval=1)
    memory_info = psutil.virtual_memory()
    memory_usage = memory_info.percent

    report = f"""
    Rapport d'utilisation système
    ------------------------------
    Utilisation CPU : {cpu_usage}%
    Utilisation RAM : {memory_usage}%
    """

    return report

if __name__ == "__main__":
    report = generate_report()
    print(report)
    with open("/path/to/report.txt", "w") as f:
        f.write(report)

