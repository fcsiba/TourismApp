dataset <- data(dataset/dataset.xls) ##load data
head(dataset) ## see the studcture
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
##Generate a random number that is 90% of the total number of rows in dataset.
ran <- sample(1:nrow(data()), 0.9 * nrow(iris)) 

##the normalization function is created
normaFunct <-function(x) { (x -min(x))/(max(x)-min(x))   }

##Run nomalization on first 4 coulumns of dataset because they are the predictors
data_norm <- as.data.frame(lapply(iris[,c(1,2,3,4)], nor))

summary(data_norm)
##   Sepal.Length     Sepal.Width      Petal.Length     Petal.Width     
##  Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min. :0.00
##  1st Qu.:0.2222   1st Qu.:0.3333   1st Qu.:0.1017   1st Qu.:0.08  
##  Median :0.4167   Median :0.4167   Median :0.5678   Median :0.50
##  Mean   :0.4287   Mean   :0.4406   Mean   :0.4675   Mean   :0.45
##  3rd Qu.:0.5833   3rd Qu.:0.5417   3rd Qu.:0.6949   3rd Qu.:0.70
##  Max.   :1.0000   Max.   :1.0000   Max.   :1.0000   Max.   :1.00
##extract training set
data_train <- data_norm[ran,] 
##extract testing set
data_test <- data_norm[-ran,] 
##extract 5th column of train dataset because it will be used as 'cl' argument in knn function.
data_target_category <- data[ran,5]
##extract 5th column if test dataset to measure the accuracy
data_test_category <- data[-raSn,5]
##load the package class
library(class)
##run knn function
pr <- knn(data_train,data_test,cl=data_target_category,k=13)

##create confusion matrix
tab <- table(pr,data_test_category)

##this function divides the correct predictions by total number of predictions that tell us how accurate teh model is.

accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tab)
## [1] 80