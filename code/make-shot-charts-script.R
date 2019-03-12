# title: Shot Charts

# description: In this part, we create shot charts (with court backgrounds) for each player, and save the plots in PDFformat; Also, we create one graph using facetting, to show all the shot charts in one image. 

# inputs:
# shots-data.csv

# outputs:
# andre-iguodala-shot-chart.pdf
# draymond-green-shot-chart.pdf
# kevin-durant-shot-chart.pdf
# klay-thompson-shot-chart.pdf
# stephen-curry-shot-chart.pdf
# nba-court.jpg
# gsw-shot-charts.pdf
# gsw-shot-charts.png

library(jpeg)
library(grid)
library(ggplot2)

dat=read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)

andre=dat[dat$name=="Andre Iguodala",]
draymond=dat[dat$name=="Draymond Green",]
kevin=dat[dat$name=="Kevin Durant",]
klay=dat[dat$name=="Klay Thompson",]
stephen=dat[dat$name=="Stephen Curry",]

# court image (to be used as background of plot)
court_file="../images/nba-court.jpg"

# create raste object
court_image=rasterGrob(
  readJPEG(court_file),
  width=unit(1,"npc"),
  height=unit(1,"npc")
)

# 4.1) Shot charts of each player
## shot chart with court background
pdf(file="../images/andre-iguodala-shot-chart.pdf", width=6.5, height=5)
ggplot(data = andre) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
dev.off()

pdf(file="../images/draymond-green-shot-chart.pdf", width=6.5, height=5)
ggplot(data= draymond) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
dev.off()

pdf(file="../images/kevin-durant-shot-chart.pdf", width=6.5, height=5)
ggplot(data = kevin) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
dev.off()

pdf(file="../images/klay-thompson-shot-chart.pdf", width=6.5, height=5)
ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
dev.off()

pdf(file="../images/stephen-curry-shot-chart.pdf", width=6.5, height=5)
ggplot(data = stephen) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
dev.off()

# 4.2) Facetted Shot Chart
#PDF format
pdf(file="../images/gsw-shot-charts.pdf",width=8,height=7)
ggplot(data= dat) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal()+
  facet_wrap(~name)
dev.off()

#PNG format
png(filename ="../images/gsw-shot-charts.png",width=8,height=7,units = "in",res = 200)
ggplot(data = dat) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal()+
  facet_wrap(~name)
dev.off()