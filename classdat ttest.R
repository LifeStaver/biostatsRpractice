library(readxl)
classdat <- read_excel("class data 2019.xlsx")
View(classdat)
hist(classdat$Height)

# data has impossible outlier < 100 cm

classd2 <- subset(classdat, classdat$Height > 100)

#remove impossible outliers

View(classd2)                
hist(classd2$Height)

#differences do not appear to be normally distributed 

classd2$diffhw = classd2$Height - classd2$Wingspan
hist(classd2$diffhw)
shapiro.test(classd2$diffhw)
classd2$lnheight = log(classd2$Height)
classd2$lnwing = log(classd2$Wingspan)

#attemped ln transformation

classd2$difflnhw = classd2$lnheight - classd2$lnwing
hist(classd2$difflnhw)

#diffs still do not look normally distributed

binom.test(11,28)

#used sign test. 11 out of 28 had difference < 0. Not sig.
