
x<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")
x[[1]]<-paste(x[[1]],x[[2]])
names(x)[1]<-"Date_Time"
x[[1]]<-strptime(x[[1]],"%d/%m/%Y %H:%M:%S")
y<-x[x[[1]]>="2007-02-01 00:00:00" & x[[1]]<"2007-02-03 00:00:00",]
good<-!is.na(y[[1]])*!is.na(y[[2]])*!is.na(y[[3]])*!is.na(y[[4]])*!is.na(y[[5]])*!is.na(y[[6]])*!is.na(y[[7]])*!is.na(y[[8]])*!is.na(y[[9]])
z<-y[good,]


plot(z[[1]],z[[7]],type="l", xlab="",ylab="Energy sub Metering")
lines(z[[1]],z[[8]],col="red")
lines(z[[1]],z[[9]],col="blue")
dev.copy(png,file="plot3.png")
