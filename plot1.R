x<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")
x[[1]]<-paste(x[[1]],x[[2]])
names(x)[1]<-"Date_Time"
x[[1]]<-strptime(x[[1]],"%d/%m/%Y %H:%M:%S")
y<-x[x[[1]]>="2007-02-01 00:00:00" & x[[1]]<"2007-02-03 00:00:00",]
good<-!is.na(y[[1]])*!is.na(y[[2]])*!is.na(y[[3]])*!is.na(y[[4]])*!is.na(y[[5]])*!is.na(y[[6]])*!is.na(y[[7]])*!is.na(y[[8]])*!is.na(y[[9]])
z<-y[good,]


hist(z[["Global_active_power"]],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png,file="plot1.png")

