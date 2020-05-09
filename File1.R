batting<-read.csv('Batting.csv')
head(batting)
str(batting)
head(batting$AB)
head(batting$X2B)
batting$BA<-batting$H/batting$AB
print(batting)
tail(batting$BA)
batting$OBP<-batting$H+batting$BB+batting$HBP/batting$AB+batting$BB+batting$HBP+batting$SF
print(batting)
batting$X1B<-batting$H-batting$X2B-batting$X3B-batting$HR
batting$SLG<-(batting$X1B)+(2*batting$X2B)+(3*batting$X3B)+(4*batting$HR)/batting$AB
str(batting)
sal<-read.csv('Salaries.csv')
print(sal)
summary(batting)
summary(sal)
subset(batting$yearID<=1985)
newbatting<-subset(batting,batting$yearID>=1985,)
str(newbatting)
summary(newbatting)
combo<-merge(batting,sal,by = c('playerID','yearID'))
summary(combo)
lost_players <- subset(combo,playerID %in% c('giambja01','damonjo01','saenzol01') )
summary(lost_players)
lost_players
lost_players<-subset(lost_players,yearID==2001)
lost_players
head(lost_players)
library(dplyr)
avail.players <- filter(combo,yearID==2001)
library(ggplot2)
ggplot(avail.players,aes(x=OBP,y=salary)) + geom_point()
avail.players <- filter(avail.players,salary<8000000,OBP>0)
avail.players <- filter(avail.players,AB >= 500)
possible <- head(arrange(avail.players,desc(OBP)),10)
possible <- possible[,c('playerID','OBP','AB','salary')]
possible
possible[2:4,]

