
library(maptools)
library(rgdal)

library(raster)

dfhold = read.csv('Desktop/STA160/GeoSpatial-Classification/classless.csv')

Cropshape = readOGR('Desktop/STA160/GeoSpatial-Classification/Crops_2016/Crops_2016_26910.shp')


cropcombine = merge(Cropshape,dfhold[,c('OBJECTID','correct')],by ='OBJECTID') 

classified_df = newdata[!is.na(cropcombine$correct),]
classified_df@data$id = hopeandpray$OBJECTID

plot(classified_df,col = as.character(hopeandpray$correct),main = 'Correct Vs Incorrect Predictions')

legend(557143.9, 4256037, legend=c("Correct", "Incorrect"),
       col=c("green", "red"), lty=1, cex=0.8)
