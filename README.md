## Description of scripts

### run_analyses.R

This script coordinates the other scripts, which get the data and create the tidy datasets.

 * Two calls to get.dataset.1.R create train and test datasets, per the instructions for the first tidy dataset.  The two datasets are then merged into a combined dataset.

 
### get.dataset.1.R
This script gets information on subject, activity, and features having to do with the mean or std.

