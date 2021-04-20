Skeleton README
===============

USAGE
-----
You'll need Docker and the ability to run Docker as your current user.

You'll need to build the container:

    > docker build . -t project_env

This Docker container is based on rocker/verse. To run rstudio server:

    > docker run -v `pwd`:/home/rstudio -p 8787:8787 -e PASSWORD=mypass -t project_env
      
Then connect to the machine on port 8787.

Username: rstudio \
Password: mypass

#### Rshiny Application
To run the application use:

    > docker run -v `pwd`:/home/rstudio -e PASSWORD=mypass -p 8787:8787 -p 8788:8788 -t project_env 
    
Then in the rstudio server on port 8787 go to the terminal and use:

    > PORT=8788 make RShiny_Tool
    
Then connect machine on port 8788.

###### To run on antoher port, replace 8788 above (in all places) with the appropriate port.

#### Jupyter Notebook
To run Jupyter Notebook use:

    > docker run -p 8765:8765 -p 8718:8718 -v `pwd`:/home/rstudio -e PASSWORD=mypass -it project-env sudo -H -u rstudio /bin/bash -c "cd ~/; jupyter lab --ip 0.0.0.0 --port 8765"
    
Then connect machine on port 8765.

#### Make
Use Makefile as recipe book for building artifacts found in derived directories. 

##### Example:
In local project directory, to build artifact named Analysis.pdf:

    > make Analysis.pdf
    
Use artifacts before colon as make targets. Dependencies are listed after colon.