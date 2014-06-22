# function to get a dataset of average by subject & activity (for training and testing data)
# returns a dataframe containing the Subject, Activity, and average values for all features
get.dataset.2 <- function(dataset.type) {  
    # function to get the subject
    # param string dataset.type:  the type of dataset ("train" or "test")
    # returns data frame with a single column representing the subject
    get.use <- function(dataset.type, use.length) {
        Data.Use <- rep(dataset.type, use.length)
        return (data.frame(Data.Use=Data.Use))
    }
    
    # function to get the subject
    # param string dataset.type:  the type of dataset ("train" or "test")
    # returns data frame with a single column representing the subject
    get.subject <- function(dataset.type) {
        file.path <- paste0("data/UCI HAR Dataset/", dataset.type, "/subject_", dataset.type, ".txt")
        return (data.frame(Subject=read.table(file.path)[[1]]))
    }
    
    # function to get the activity
    # param string dataset.type:  the type of dataset ("train" or "test")
    # returns data frame with a single column representing the activity as a factor
    get.activity <- function(dataset.type) {
        label.reference.file.path <- "data/UCI HAR Dataset/activity_labels.txt"
        act.df <- read.table(label.reference.file.path)
        
        file.path <- paste0("data/UCI HAR Dataset/", dataset.type, "/y_", dataset.type, ".txt")
        activity.int <- read.table(file.path)[[1]]
        activity.char <- character(length(activity.int))
        
        for (i in 1:nrow(act.df)) {
            activity.char[activity.int == i] <- as.character(act.df[[2]][i])
        }
        
        return (data.frame(Activity=factor(activity.char)))
    }
    
    # function to get the features of interest
    # param string dataset.type:  the type of dataset ("train" or "test")
    # returns data frame containing mean and std features
    get.features <- function(dataset.type) {
        feature.info <- get.feature.info()
        file.path <- paste0("data/UCI HAR Dataset/", dataset.type, "/X_", dataset.type, ".txt")
        dataset <- read.table(file.path)
        dataset <- dataset[, feature.info$indices]
        names(dataset) <- feature.info$names
        return (dataset)
    }
    
    # utility function called by get.features
    # param string names.file: the file name where the features are listed
    # param int name.column: the column in the file where the names are stored
    # returns a list of two vectors:
    #   int indices: the indices of the feature vector that correspond to mean or std
    #   character names: the feature names corresponding to the indices
    get.feature.info <- function(file.path = "data/UCI HAR Dataset/features.txt", name.column = 2) {
        # get a character vector for all feature names
        features <- read.table(file.path, stringsAsFactors=F)[[name.column]]
        
        # return the two vectors in a list
        return (list(indices=seq(length(features)), names=features))
    }
    
    dataset <- cbind(get.subject(dataset.type), get.activity(dataset.type), get.features(dataset.type))
    return(dataset)
}