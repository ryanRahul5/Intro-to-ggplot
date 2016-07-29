## intro to ggplot2

library(ggplot2)

diamonds

## visualise the cut variable in the diamond dataset using the bar chart

ggplot(diamonds, aes(x= cut)) + geom_bar()

## use the BOD

?BOD
BOD

ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat = "identity") ## by default stat takes count , now here we have specified not to count statistically but to take the identity


## notice that there is a gap at 6 this is because the time variable is contionous not categorical

str(BOD)

ggplot(BOD, aes(x=as.factor(Time), y=demand)) + geom_bar(stat = "identity")

ggplot(BOD, aes(x=as.factor(Time), y=demand)) + geom_bar(stat = "identity", col="red" , fill = "lightblue")
+ xlab("TIME") + ylab("DEMAND")


## grouping bars together in ggplot2

ggplot(diamonds, aes(cut, fill= clarity)) + geom_bar()


ggplot(diamonds, aes(cut, fill= clarity)) + geom_bar(position = "dodge", col = "black")


ggplot(diamonds, aes(cut, fill= clarity)) + geom_bar(position = position_dodge(1))


## use our own color
# install gcookbook

library(gcookbook)
uspopchange


y <- arrange(uspopchange, desc(Change))
x  <- filter(y[1:10,])  ## can use slice command also

# bar chart

ggplot(x, aes(reorder(Abb, Change), y= Change, fill = Region)) +  geom_bar(stat="identity")
  
## manually change the color of the bars

ggplot(x, aes(reorder(Abb, Change), y= Change, fill = Region)) +  geom_bar(stat="identity")+
  scale_fill_manual(values = c("pink", "lightblue"))


# create a horizontal barchart

ggplot(x, aes(reorder(Abb, Change), y= Change, fill = Region)) +  geom_bar(stat="identity", fill="red")+
  scale_fill_manual(values = c("pink", "lightblue")) + coord_flip()


# try using scale_fill before geom_bar and see the difference


### create a dot plot

library(gcookbook)
tophitters2001

data <- tophitters2001 %>%
  select(name,avg) %>%
  slice(1:25)

ggplot(data, aes(x= avg, y= reorder(name, avg))) +
  geom_point()  # reordering to make  more sense of the visualisation






## lubridate function
library(lubridate)
date1 <- mdy("3/27/2016")


#date and time using "as.POSIXlt" & "as.POSIXct" function

x <- Sys.time()
p <- as.POSIXlt(x)
p$sec


#In case dates are written in different format use "strptime" function

library()
datestring <- c("January 10, 2012  10:40" , "December 9,2012  9:20")
x <- strptime(datestring, %B %d, %Y %H:%M)

#...... character strings can be coerced to date/time classes by using function "strptime", "as.Date", "as.POSIXlt", "as.POSIXct"













