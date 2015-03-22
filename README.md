---
title: "README.md"
output: html_document
---

## Overview

The files in this repo are for the Getting and Cleaning Data course project,
the purpose of which is to demonstrate my ability to collect, work with, and
clean a data set to be used later for analysis.

The files include the following:  
* this README.md;  
* a CodeBook.md file describing the data, variables, and work performed; and   
* the run_analysis.R script containing the logic used to create a tidy data set 
from the provided Samsung data, following the project instructions.

To prepare the data, the R script combines multiple text files, extracts all the
requested mean and standard deviation measurements, updates the 
ordinal values, and finally spells out variable abbreviations for better 
understanding for future users of the data.  From this prepared data, the
script creates a second summary tidy data file with averages of each of the
variables by activity and subject.


## Sources

1. Johns Hopkins Coursera Getting and Cleaning Data course project instructions

2. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and 
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a 
Multiclass Hardware-Friendly Support Vector Machine. International Workshop 
of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012