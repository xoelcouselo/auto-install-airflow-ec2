echo "
   ███████╗ ██████╗██████╗  ─────▄█▀█▄──▄███▄────❤ █████╗ ██╗██████╗ ███████╗██╗      ██████╗ ██╗    ██╗
   ██╔════╝██╔════╝╚════██╗ ────▐█░██████████▌──── ██╔══██╗██║██╔══██╗██╔════╝██║     ██╔═══██╗██║    ██║
   █████╗  ██║      █████╔╝ ─────██▒█████████───── ███████║██║██████╔╝█████╗  ██║     ██║   ██║██║ █╗ ██║
   ██╔══╝  ██║     ██╔═══╝  ──────▀████████▀────── ██╔══██║██║██╔══██╗██╔══╝  ██║     ██║   ██║██║███╗██║
   ███████╗╚██████╗███████╗ ─────────▀██▀───────── ██║  ██║██║██║  ██║██║     ███████╗╚██████╔╝╚███╔███╔╝
   ╚══════╝ ╚═════╝╚══════╝                        ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝ ╚═════╝  ╚══╝╚══╝ 
                                                                                                         
   ### The install has been started ###                                                                   
"

# Incial of install
cd /tmp

# Install Anaconda3 (2022.05) and comprobation of Hash (sha256sum)
echo "   ### The install Anaconda3 ###                                                                   "
sleep 1
curl -O https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh

sha256sum Anaconda3-2022.05-Linux-x86_64.sh

bash Anaconda3-2022.05-Linux-x86_64.sh

# Refresh .bashrc
echo "   ### Load a new configuration on ~/.bashrc ###                                                  "
source ~/.bashrc

# Create a python virtual enviroment
echo "   ### Create a enviroment  called: airflow (Python=3.9) ###                                       "
sleep 1
conda create -n airflow python=3.9

# Enter to the airflow enviroment
conda activate airflow

# Install of Airflow
echo "   ### Install AirFlow with pip ###                                   "
sleep 1

pip install apache-airflow


# Start DDBB of airflow
echo "   ### Starting DDBB of airflow ###                                        "
sleep 1

airflow initdb

echo "   ### Starting Web UI of airflow ###                                        "
sleep 1

airflow web server -p 8070

airflow web server -p 8070 -D
echo "   ### Web UI of airflow go to: http://localhost:8070 ###                         "
echo "   ### Please remenber go to Inbound rules and edit port 8070 of this instance ###"
echo "   ### Recomend 0.0.0.0/0 ###                                                     "
echo "   ### Other for more Security Options ###                                        "
sleep 3

source activate airflow
echo "   ### Starting Scheduler of airflow ###                                        "
sleep 1
airflow scheduler

