setwd('Desktop/STA160/GeoSpatial-Classification/')
cropfields = read.csv('ColorbandsDF.csv')
tapply(cropfields$Band1mean,cropfields$crop_list, mean)
grepl(cropfields$crop_list[5],'UNCULTIVATED')
library(stringi)

fallows = sapply(X = cropfields$crop_list,FUN = function(x){
  bool = stri_detect_fixed(x,'UNCULTIVATED')
  return(bool)
})
fallows
sum(fallows)
fallowcrops = cropfields[fallows,]
nonfallow = cropfields[!fallows,]
activecrops = nonfallow[nonfallow$is_active == 1,]
dim(activecrops)
activecrops$crop_list
nonfallow[nonfallow$is_active == 1,]
listings =tapply(activecrops$crop_list,activecrops$crop_list,length)

library(stringi)


cropfields[fallows,]
library(ggplot2)
sum(fallows)
p8 <- ggplot(fallowcrops, aes(x=Band8third,color = as.factor(fallowcrops$is_active))) + 
  geom_density()
library(grid)
library(gridExtra)
install.packages("gridExtra")
grid.arrange(p8,p9,p10, ncol = 1,nrow = 3, top = "Main title")
p1
p2
cropfields$Band1first
par(mfrow = c(3, 2)) 
sort(table(nonfallow$crop_list))

table(fallowcrops$is_active)
plot1 <- qplot(1)
plot2 <- qplot(1)
grid.arrange(plot1, plot2, ncol=2)



p9
