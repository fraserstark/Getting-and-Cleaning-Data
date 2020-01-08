# Getting-and-Cleaning-Data
This repository contains the solution files for Coursera's Getting and Cleaning Data assignment. 

## Overview 
One of the most exciting areas in all of data science right now is wearable computing - see for example this article http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the data used in the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**The goal is to take a set of existing data and prepare it into a tidy dataset which can be used for later analysis.**

## This repository contains

* README.md which provides a brief overview of this repository and the goals of the project
* run_analysis.R - an R script which loads & prepares the raw data and outputs a tidy dataset
* Codebook.md - a document containing information on each of the contents, structure and decriptions of the data
* tidydata.txt - the resulting output from the script, as per the goal of the project

## run_analysis.R 
This script 
  * Loads the training data
  * Loads the test data
  * Loads the supporting metadata (features, activity labels)
  * Merges these datasets 
  * Extracts the relevant measurements
  * Uses the provided metadata to appropriately label variables
  * Creates a new tidy independent dataset with the average of each variable per activity per subject.
