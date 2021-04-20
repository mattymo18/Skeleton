#This is a Skeleton Dockerfile
FROM rocker/verse
MAINTAINER First Last <email>

#For Python
RUN apt update -y && apt install -y python3-pip
RUN pip3 install jupyter jupyterlab
RUN pip3 install numpy pandas sklearn plotnine matplotlib pandasql bokeh

#For R
RUN R -e "install.packages('package')"