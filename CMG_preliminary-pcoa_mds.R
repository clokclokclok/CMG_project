table <- read.csv("results.csv", header = TRUE)


########################metricMDS##################

d <- dist(table) # euclidean distances between the rows(optional)
fit <- cmdscale(d,eig=TRUE, k=3) # k is the number of dim

# plot results
x <- fit$points[,1]
y <- fit$points[,2]
grpcol <- c(rep("blue",5), rep("red",5), rep("green",5), rep("yellow",5) , rep("pink",3), rep("purple",5), rep("orange",5) )
plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2",
     main="Metric MDS", type="p", col=grpcol)

x <- fit$points[,2]
y <- fit$points[,3]
grpcol <- c(rep("blue",5), rep("red",5), rep("green",5), rep("yellow",5) , rep("pink",3), rep("purple",5), rep("orange",5) )
plot(x, y, xlab="Coordinate 2", ylab="Coordinate 3",
     main="Metric MDS", type="p", col=grpcol)


#text(x, y, labels = row.names(table), cex=.7)<-------if point sigle point labelling is needed

######################non-metriMDS#####################
library(MASS)
d <- dist(table) # euclidean distances between the rows
fit <- isoMDS(d, k=3) # k is the number of dim
fit # view results

# plot results
x <- fit$points[,1]
y <- fit$points[,2]
grpcol <- c(rep("blue",5), rep("red",5), rep("green",5), rep("yellow",5) , rep("pink",3), rep("purple",5), rep("orange",5) )
plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2",
     main="nonMetric MDS", type="p", col=grpcol)

x <- fit$points[,2]
y <- fit$points[,3]
grpcol <- c(rep("blue",5), rep("red",5), rep("green",5), rep("yellow",5) , rep("pink",3), rep("purple",5), rep("orange",5) )
plot(x, y, xlab="Coordinate 2", ylab="Coordinate 3",
     main="nonMetric MDS", type="p", col=grpcol)

