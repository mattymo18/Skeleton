#This is a skeleton Makefile

#################################################

#Phony target for cleaning repository
.PHONY: clean
#cleans entire repository of derived elements
clean:
	rm derived_data/*.csv
	rm derived_graphs/*.png
	rm derived_graphs/*.rds
	rm derived_models/*.rds
	rm Analysis.pdf

################################################
	
#Phony target for running an Rshiny App
.PHONY: Rshiny_Tool
#runs the Rshiny App on specified port with dependencies 
#derived_data/clean_data.csv and Rshiny_Tool.R
Rshiny_Tool:\
 derived_data/clean_data.csv\
 RShiny_Tool.R
	Rscript RShiny_Tool.R ${PORT}

#################################################
	
#builds final report	
Analysis.pdf:\
 Analysis.Rmd
	R -e "rmarkdown::render('Analysis.Rmd')"
	
#################################################
	
#build genercic artifact called Artifact.csv with 
#dependencies Data_Source1, Data_source2, and Script.R
Artifact.csv:\
 Data_Source1.csv\
 Data_Source2.csv\
 Script.R
	Rscript Script.R