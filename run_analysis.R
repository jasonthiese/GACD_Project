# assumption:  the ZIP file has been downloaded and unzipped
# the path from the working directory to the file should be ./data/{unzipped = "UCI HAR Dataset"}

# clear working memory
rm(list=ls(all=T))

source("get.dataset.1.R")
#debug(get.dataset)
combined.data <- rbind(get.dataset.1("train"), get.dataset.1("test"))
write.csv(combined.data, "data/tidy.data.1.csv")

# get the second dataset

source("get.dataset.2.R")
dat <- rbind(get.dataset.2("train"), get.dataset.2("test"))
