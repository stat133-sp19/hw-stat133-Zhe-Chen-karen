# title: Data Preparation

# description: preparing shots data for visualization phase, and making data summaries

# inputs: 
# andre-iguodala.csv
# draymond-green.csv
# kevin-durant.csv
# klay-thompson.csv
# stephen-curry.csv

# outputs:
# andre-iguodala-summary.txt
# draymond-green-summary.txt
# klay-thompson-summary.txt
# kevin-durant-summary.txt
# stephen-curry-summary.txt
# shots-data.csv
# shots-data-summary.txt

library(dplyr)
iguodala=read.csv("../data/andre-iguodala.csv",stringsAsFactors = FALSE)
green=read.csv("../data/draymond-green.csv",stringsAsFactors = FALSE)
thompson=read.csv("../data/klay-thompson.csv",stringsAsFactors = FALSE)
durant=read.csv("../data/kevin-durant.csv",stringsAsFactors = FALSE)
curry=read.csv("../data/stephen-curry.csv",stringsAsFactors = FALSE)

iguodala=mutate(iguodala,name="Andre Iguodala")
green=mutate(green,name="Draymond Green")
thompson=mutate(thompson,name="Klay Thompson")
durant=mutate(durant,name="Kevin Durant")
curry=mutate(curry,name="Stephen Curry")

iguodala$shot_made_flag[iguodala$shot_made_flag=='n'] = 'shot_no'
iguodala$shot_made_flag[iguodala$shot_made_flag=='y'] = 'shot_yes'
green$shot_made_flag[green$shot_made_flag=='n'] = 'shot_no'
green$shot_made_flag[green$shot_made_flag=='y'] = 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag=='n'] = 'shot_no'
durant$shot_made_flag[durant$shot_made_flag=='y'] = 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag=='n'] = 'shot_no'
thompson$shot_made_flag[thompson$shot_made_flag=='y'] = 'shot_yes'
curry$shot_made_flag[curry$shot_made_flag=='n'] = 'shot_no'
curry$shot_made_flag[curry$shot_made_flag=='y'] = 'shot_yes'
 
curry<-mutate(curry,minute=curry$period*12-curry$minutes_remaining)
thompson<-mutate(thompson,minute=thompson$period*12-thompson$minutes_remaining)
durant<-mutate(durant,minute=durant$period*12-durant$minutes_remaining)
green<-mutate(green,minute=green$period*12-green$minutes_remaining)
iguodala<-mutate(iguodala,minute=iguodala$period*12-iguodala$minutes_remaining)

sink(file="../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file="../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file="../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file="../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file="../output/stephen-curry-summary.txt")
summary(curry)
sink()

tables=rbind(iguodala,green,thompson,durant,curry)

write.csv(
  x=tables,
  file="../data/shots-data.csv"
)

sink(file="../output/shots-data-summary.txt")
summary(tables)
sink()
