import os
import time
import subprocess

SERVICE_NAME = "apache2"
CHECK_INTERVAL = 60  # Vérifier toutes les 60 secondes

def is_service_running(service_name):
    try:
        output = subprocess.check_output(f"systemctl is-active {service_name}", shell=True)
        return output.strip() == b'active'
    except subprocess.CalledProcessError:
        return False

def restart_service(service_name):
    os.system(f"sudo systemctl restart {service_name}")

while True:
    if not is_service_running(SERVICE_NAME):
        print(f"{SERVICE_NAME} est tombé, redémarrage en cours...")
        restart_service(SERVICE_NAME)
    time.sleep(CHECK_INTERVAL)

