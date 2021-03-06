# Installation

The artifact has two different executable parts. 1) the data analysis code and 2) the experiment application used to collect the data. The data analysis code can be used to analyze the accompanying data and review the data analysis procedure, while the experiment application can enable anyone who is willing to use our software to run the same or a similar experiment for replication.

## Data Analysis

Go to folder `data` and find the `analysis.R` file. Open the file in RStudio, adjust the working directory path, and execute it. It will produce all the results used in the paper but for the ones excluded from the de-indentified data for ethical reasons. The output of all the different statistics will be produced by running the script step by step. 

Alternatively, you can use `R -f analysis.R` (provided you have R installed) to run the file from the command
line, or you can use the docker version in `data/docker-version`. There, just
execute the build file by using `./build.sh` in the folder (make sure docker is installed and
running). This can take a while as it installs (~10-15 minutes) and compiles a number of
libraries. You can then use `./run.sh` to run the docker container, which will
output the results on standard output. Graphs that are generated while it is
running will be saved to the same folder. You can delete those by running
`./cleanup.sh`.

*The Docker version was built to specifically load the library versions that
were used for analysis and should be the most 'future proof' variant*

The initial analysis was last run with R version 3.6.3 and Rstudio 1.2.5033.

If nothing else works, there is a ready-made `output.txt` file, which includes
all the outputs from the R script running, as well as the graphs in the
`data/graphs` folder.

## Application

To run the experiment application go to the folder `experiment-application` and follow the Docker local environment instructions below.

### Docker Local Environment

* Make sure docker is installed and running [windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows/), [Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac/), [ubuntu](https://docs.docker.com/engine/install/ubuntu/)
* Run `docker-compose up` in experiment-application folder to start the three containers. This might take a little the first time. 
* Access the actual application at `http://localhost`. Just follow the instructions on the screen from there.
* Access phpmyadmin at `http://localhost:8080`. Login with user "root" and password "example" if you didn't change the change the configuration.
* Use `connect_to_mysql.sh <container-id>` to connect to the mysql database directly if desired. The container-id can be found out by using `docker ps` first to look for the mysql database container.

### Using this in production

* Change the hardcoded values for database passwords and names in
  docker-compose.yml. A good choice for this might be to use environment
  variables and using an .env file.
* Change the database connection configuration in `EPI/code/configuration.php` to
  fit your database connection values
* Get ethics approval to run this experiment
* Change the ethics content on the pages `index.php`, `informed_consent.php`, and `experiment_protocol.php` depending on where it is necessary. You also might need to change the informed consent pdf in the `documents` folder that is linked on the `informed_consent.php` page.
* Host the docker containers on one or multiple devices, make sure you can reach them from the outside.
