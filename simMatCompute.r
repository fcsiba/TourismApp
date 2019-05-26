mydata <- data.frame(trial,stim1,stim2,response)

mytable <- tapply(mydata$response,list(mydata$stim1,mydata$stim2),mean)

cl1 <- cbind(rnorm(100,0.2,0.05),rnorm(100,0.8,0.06))
cl2 <- cbind(rnorm(100,0.7,0.08),rnorm(100,0.3,0.05))
x <- rbind(cl1,cl2)

## calculating eucledian distance
simMat1 <- negDistMat(x)

## computing similiarity matrices.
simMat2 <- negDistMat(x, r=2)

## compute RBF kernel
simMat3 <- expSimMat(x, r=2)

##
sel <- sort(sample(1:nrow(x), nrow(x)*0.25)) 
simMat4 <- negDistMat(x, sel, r=2)


##
cl1 <- cbind(rnorm(150,0.2,0.05),rnorm(150,0.8,0.06))
cl2 <- cbind(rnorm(100,0.7,0.08),rnorm(100,0.3,0.05))
x <- rbind(cl1,cl2)

apres <- apclusterL(s=negDistMat(method="minkowski", p=2.5, r=2),
                    x, frac=0.2, sweeps=3, p=-0.2)
show(apres)
