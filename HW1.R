library('ggplot2')
library('tidyverse')

#problem 1
su=read.delim("C:\\Users\\zrsm9\\OneDrive\\Documents\\MS Data Analytics\\CSC587\\DATA\\Su_raw_matrix.txt")
mean(su$Liver_2.CEL)
sd(su$Liver_2.CEL)
colMeans(su)
colSums(su)

#problem 2
data1=rnorm(10000,0,.2)
hist(data1,xlim=c(-5,5))
data2=rnorm(10000,0,.5)
hist(data2,xlim = c(-5,5))

#problem 3
#a
dat <- data.frame(cond = factor(rep(c("A","B"), each=200)),
                  rating = c(rnorm(200),rnorm(200, mean=.8)))
#b
# Overlaid histograms
ggplot(dat, aes(x=rating, fill=cond)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")

#c
# Interleaved histograms
ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, position="dodge")

#d
# Density plots
ggplot(dat, aes(x=rating, colour=cond)) + geom_density()

#e
# Density plots with semitransparent fill
ggplot(dat, aes(x=rating, fill=cond)) + geom_density(alpha=.3)

#f
diabetes=read.delim("C:\\Users\\zrsm9\\OneDrive\\Documents\\MS Data Analytics\\CSC587\\DATA\\diabetes_train.csv",TRUE,",")

#Overlaid Histograms
ggplot(diabetes, aes(x=mass,fill=class)) +
  geom_histogram(binwidth=.5, alpha = .5, position = "identity")

#Interleaved Histograms
ggplot(diabetes, aes(x=mass, fill=class)) +
  geom_histogram(binwidth=.5, position = "dodge")

#density plots
ggplot(diabetes, aes(x=mass, colour=class)) + geom_density()

#Density Plots with semitransparent fill
ggplot(diabetes, aes(x=mass, fill=class)) + geom_density(alpha=.3)

#problem 4
passengers=read.delim("C:\\Users\\zrsm9\\OneDrive\\Documents\\MS Data Analytics\\CSC587\\DATA\\titanic.csv",TRUE,",")
#a (Removes any rows that contain miss values in any of the columns. Then generates
# a summary for each column (min, median, max, quartiles, etc)
passengers %>% drop_na() %>% summary()

#b (provides a filtered list a male passengers)
passengers %>% filter(Sex == "male")

#c (reorders the rows of data by fare in descending order (high to low)
passengers %>% arrange(desc(Fare))

#d (create new column "FamSize" based on parents, children, siblings, and spouses)
passengers %>% mutate(FamSize = Parch + SibSp)

#e (split data by sex, then summarizes for each group the average fare and count of survivors)
passengers %>% group_by(Sex) %>% summarise(meanFare = mean(Fare), numSurv = sum(Survived))

#problem 5
quantile(diabetes$skin, probs=c(.1,.3,.5,.6))
