setwd("C:/Users/612ra/OneDrive/Documents/UNI/movement physilogy")


install.packages('ez')
library(ez) 

mydataset = read.csv('jumpheightANOVA.csv')
attach(mydataset)
names(mydataset)
data

myresults = ezANOVA(data=mydataset,dv=.(Height),wid=.(ID),within=.(Type),type=3)
myresults
mydataset$Type<- factor(mydataset$Type, levels = c("S", "CMJ", "CMJA"))
dev.off()
boxplot(mydataset$Height~mydataset$Type, ylab = "HEIGHT IN CM", xlab = "TYPE OF JUMP",col= c("green","yellow","red"))
install.packages("ggpot2")
library(ggplot2)
ggplot(mydataset, aes(x=Type, y=Height ,fill=Type)) + geom_boxplot( )+ theme_classic()+scale_fill_manual(values=c("green", "orange","red"),ylab = "HEIGHT IN CM", xlab = "TYPE OF JUMP")
      
        
        
       
        
#For extra credit in your lab case study, consider evidencing the following things:
# Check the results for the 'Mauchly Test for Sphericity'. Do some reading around the test. What does this mean when the test p < 0.05.
#   Should you use the uncorrected results, or the Sphericity Corrected Results?


# The default boxplot is quite ugly. Spend time making it more intuitive to readers:
#   Consider rearranging the order of the boxes into something more intuitive e.g. S, CMJ, CMJA 
#   Hint: https://www.r-graph-gallery.com/9-ordered-boxplot.html
# Improve the axis labels and make sure you include units
# Replace the default grey fill of the boxes with something else
# Get rid of the black box frame surrounding the plot