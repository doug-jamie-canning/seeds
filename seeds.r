####  seeds prediction model using decision trees ####
seeds <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/00236/seeds_dataset.txt", header=FALSE, sep="", as.is=TRUE)

summary(seeds)   # find more information about the data you just loaded
str(seeds)   # know the structure of your data

colnames(seeds) <- c("area", "perimeter", "compactness", "length", "width", "asymmetry", "length2", "seedType")  # rename the columns
seeds$seedType <- factor(seeds$seedType)   # rename the attribute that has categorical values to a factor
str(seeds)   # view the data after the data-preparation process

trainSize <- round(nrow(seeds) * 0.7)   # calculate and store the sizes of each dataset
testSize <- nrow(seeds) - trainSize

trainSize  # should be 147
testSize   # should be 63

set.seed(123)   # set the seed dataset for the random generator
training_indices <- sample(seq_len(nrow(seeds)), size=trainSize)
trainSet <- seeds[training_indices, ]
trainSet <- seeds[-training_indices, ]
training_indices   # check your output
model <- ctree(seedType ~ . , data=trainSet)   # create a decision-tree model
summary(model)   # see some useful information about the model you just created
model
plot(model)   # visualize the model by creating a plot of the decision tree with this code
