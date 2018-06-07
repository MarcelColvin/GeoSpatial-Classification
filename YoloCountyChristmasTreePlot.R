###Plot Crop Correct vs Incorrect
library(maptools)
library(rgdal)

library(raster)

dfhold = read.csv('Desktop/STA160/GeoSpatial-Classification/Data/classless.csv')

Cropshape = readOGR('Desktop/STA160/GeoSpatial-Classification/Crops_2016/Crops_2016_26910.shp')


cropcombine = merge(Cropshape,dfhold[,c('OBJECTID','correct')],by ='OBJECTID') 

classified_df = newdata[!is.na(cropcombine$correct),]
classified_df@data$id = hopeandpray$OBJECTID

plot(classified_df,col = as.character(hopeandpray$correct),main = 'Correct Vs Incorrect Predictions')

legend(557143.9, 4256037, legend=c("Correct", "Incorrect"),
       col=c("green", "red"), lty=1, cex=0.8)

#####Plot Actual Crops vs Predicted

cropdata = read.csv('Desktop/STA160/GeoSpatial-Classification/Data/predcitspluscrops.csv')
cropdata
cropdata$crcop

cropinfo= merge(Cropshape,cropdata[,c('OBJECTID','correct','predictions')],by ='OBJECTID') 
realcrops = cropinfo[!is.na(cropinfo$correct),]
realcrops$predictions
plot(realcrops,col = realcrops$correct,main = 'Actual Crops in Yolo County')
legend(555143.9, 4283037,c('OAT','ALFALFA','SAFFLOWER',
                                  'WALNUT','TOMATO','ALMOND','WHEAT','SUNFLOWER','GRAPE','RICE',
                                  'CORN'),col=1:length(realcrops$correct),pch=8)

plot(realcrops,col = realcrops$predictions,main = 'Predicted Crops in Yolo County')
legend(555143.9, 4283037,c('OAT','ALFALFA','SAFFLOWER',
                           'WALNUT','TOMATO','ALMOND','WHEAT','SUNFLOWER','GRAPE','RICE',
                           'CORN'),col=1:length(realcrops$predictions),pch=8)







       