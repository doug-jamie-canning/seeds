####    Seed Classification by Random Forest    ####
# you may need to install.packages("randomForest")

library(randomForest)  # load the package
seeds <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/00236/seeds_dataset.txt", header=FALSE, sep="", as.is=TRUE)
colnames(seeds) <- c("area", "perimeter", "compactness", "length", "width", "asymmetry", "length2", "seedType")  # rename the columns
seeds$seedType <- factor(seeds$seedType)   # rename the attribute that has categorical values to a factor
trainSize <- round(nrow(seeds) * 0.7)   # calculate and store the sizes of each dataset
testSize <- nrow(seeds) - trainSize
set.seed(123)   # set the seed dataset for the random generator
training_indices <- sample(seq_len(nrow(seeds)), size=trainSize)
trainSet <- seeds[training_indices, ]
trainSet <- seeds[-training_indices, ]

set.seed(123)   # set the seed dataset for the random generator
model <- randomForest(seedType ~ . , data=trainSet)   # create a random forest model

#help(randomForest)  # the default value for ntree is 500, explore help if you want to adjust parameters

model # find the estimate of error rate
plot(model)
testPrediction <- predict(model, newdata=testSet)
table(testPrediction, testSet$seedType)

newPrediction <- predict(model, list(area=11, perimeter=13, compactness=0.855, length=5, width=2.8, asymmetry=6.5, length2=5))
newPrediction
