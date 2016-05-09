

setwd("~/Desktop/files_duplicate/amplicon/_scripts/src/")
source("plotHaplotypes.R")

studyIdInfo <- list(timepoint=c(0,4,8,16,24,32), # week of sample taken
                    treatment=c(1,0,0,1,1,0),    # treatment positiv 1=TRUE 0=FALSE
                    qpcr=c(1,0,1,1,0,1))         # qPCR positiv 1=TRUE 0=FALSE

# list of haplotypes found at the individual timepoints
alleles <- list(c("H1","H2"),
                NULL,
                c("H1"),
                c("H1"),
                NULL,
                c("H3"))

title <- "Test plot"

plotHaplotypesLongitutinalPerPatient(studyIdInfo,
                                     alleles, 
                                     title, 
                                     timepointUnit="weeks", 
                                     xAxisMarks=c(0,5,10,15,20,25,30,35))
  