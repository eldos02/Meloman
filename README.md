# Dockerized Web Application Deployment with Bash Automation
## In this project, we built a web application in Python Flask and created bash scripts to automate image building and deployment of the application. Also with bash scripts we created a deployment pipeline with three stages: build , test, deploy.

## Project Architecture
1. **Backend:** Python (Flask framework)
2. **Frontend:** HTML + JS
3. **Database:** MySQL (Web Interface: phpMyAdmin)
## System Requirements
- **OS:** Linux, Windows (to run bash scripts, you need to use either Windows Subsystem for Linux or
Linux-like terminals like Git Bash)
- **Docker** and **docker-compose**
## Load and Start the Project
To install our project, clone the repository into your computer using the command:
```bash
git clone https://github.com/eldos02/Meloman.git
```
Then open a terminal or Linux-like terminal on Windows and navigate to the root folder of our project. Now,
you can run the project with the following instructions:
Dockerized Web Application Deployment with Bash Automation
### 1. Check Bash Scripts and Run the Project
To check the bash scripts, enter the following commands one by one:
#### Docker Installation Check
```bash
./bash_scripts/docker_installation.sh
```
*Checks if Docker is present in the system.*
#### Start Services
```bash
./bash_scripts/running_services.sh
```
*Creates images and launches the application as containers, then you can go to the links shown in the script
itself and check the main page, database, requests, etc.*
#### Check Services
```bash
./bash_scripts/services_checking.sh
```
*Checks the status of running containers.*
#### Stop Services
Dockerized Web Application Deployment with Bash Automation
```bash
./bash_scripts/stopping_services.sh
```
*Stops containers and deletes them so that they do not occupy memory.*
### 2. Check the Deployment Pipeline
Enter the following commands one by one:
#### Building Stage
```bash
./deployment_pipeline/building.sh
```
*The build stage creates the necessary images.*
#### Testing Stage
```bash
./deployment_pipeline/testing.sh
```
*The test stage checks the services by sending requests to the servers.*
#### Deploying Stage
```bash
./deployment_pipeline/deploying.sh
```
*The deploy stage deploys our application.*
## Recommendations
If you're new to Docker, check out the [Docker documentation](https://docs.docker.com/get-started/overview/)
to get started.
That's it! Follow these instructions and you will successfully launch our project on your computer.

**The project was developed by:**
- **Sanabek Yeldos:** [GitHub](https://github.com/eldos02)
- **Yerdali Akarys:** [GitHub](https://github.com/profaka)
- **Bakirbayev Sanzhar:** [GitHub](https://github.com/etozhegatito)
