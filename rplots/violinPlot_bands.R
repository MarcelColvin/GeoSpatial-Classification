#Density plots / violin plots for the most commonly used crops all color bands

#violin plot for each color band , mean median sd
cropColor <- read.csv("updateddf.csv")
x = split.data.frame(cropColor,cropColor$crop_list)
nuts = rbind.data.frame(x$ALMOND,x$WALNUT)
getwd()
library(stringi)
library(ggplot2)
library(grid)
library(gridExtra)
#install.packages("gridExtra")


colnames(nuts(7)) = c('band1sd')
names(nuts)[names(nuts) == 'Band1std deviation'] = 'band1sd'


nutMean1 <- ggplot(nuts, aes(factor(nuts$crop_list), Band1mean))
nutMean1 + geom_violin(aes(fill = factor(nuts$crop_list)),draw_quantiles = c(0.25, 0.5, 0.75)) + guides(fill=guide_legend(title='Type of Nut'))+
  xlab('Crop') + ylab('Mean') + ggtitle('Violin Plot of Band 1 Means of Commonly Grown Nuts in Yolo County')

nutMean2 <- ggplot(nuts, aes(factor(nuts$crop_list), Band2mean))
nutMean2 + geom_violin(aes(fill = factor(nuts$crop_list)),draw_quantiles = c(0.25, 0.5, 0.75))  +
   xlab('Crop') + ylab('Mean') + ggtitle('Violin Plot of Band 2 Means of Commonly Grown Nuts in Yolo County') + guides(fill=guide_legend(title='Type of Nut'))

nutMean3 <- ggplot(nuts, aes(factor(nuts$crop_list), Band3mean))
nutMean3 + geom_violin(aes(fill = factor(nuts$crop_list)),draw_quantiles = c(0.25, 0.5, 0.75)) + geom_jitter(height = 0, width = 0.1) +
  xlab('Crop') + ylab('Mean') + ggtitle('Violin Plot of Band 1 Means of Commonly Grown Nuts in Yolo County')

nutMean4 <- ggplot(nuts, aes(factor(nuts$crop_list), Band4mean))
nutMean4 + geom_violin(aes(fill = factor(nuts$crop_list)),draw_quantiles = c(0.25, 0.5, 0.75)) + geom_jitter(height = 0, width = 0.1) +
  xlab('Crop') + ylab('Mean') + ggtitle('Violin Plot of Band 1 Means of Commonly Grown Nuts in Yolo County')

nutMean5 <- ggplot(nuts, aes(factor(nuts$crop_list), Band5mean))
nutMean5 + geom_violin(aes(fill = factor(nuts$crop_list)),draw_quantiles = c(0.25, 0.5, 0.75)) + geom_jitter(height = 0, width = 0.1) +

nutMean6 <- ggplot(nuts, aes(factor(nuts$crop_list), Band6mean))
nutMean6 + geom_violin(aes(fill = factor(nuts$crop_list)),draw_quantiles = c(0.25, 0.5, 0.75)) + geom_jitter(height = 0, width = 0.1) +

nutMean7 <- ggplot(nuts, aes(factor(nuts$crop_list), Band7mean))
nutMean7 + geom_violin(aes(fill = factor(nuts$crop_list)),draw_quantiles = c(0.25, 0.5, 0.75)) + geom_jitter(height = 0, width = 0.1) +

nutMean8 <- ggplot(nuts, aes(factor(nuts$crop_list), Band8mean))
nutMean8 + geom_violin(aes(fill = factor(nuts$crop_list)),draw_quantiles = c(0.25, 0.5, 0.75)) + geom_jitter(height = 0, width = 0.1) +

nutMean9 <- ggplot(nuts, aes(factor(nuts$crop_list), Band9mean))
nutMean9 + geom_violin(aes(fill = factor(nuts$crop_list)),draw_quantiles = c(0.25, 0.5, 0.75)) + geom_jitter(height = 0, width = 0.1) +

nutMean10 <- ggplot(nuts, aes(factor(nuts$crop_list), Band10mean))
nutMean10 + geom_violin(aes(fill = factor(nuts$crop_list)),draw_quantiles = c(0.25, 0.5, 0.75)) + geom_jitter(height = 0, width = 0.1) +

grid.arrange(nutMean1, nutMean2,nutMean3,nutMean4,nutMean5,
             nutMean6,nutMean7,nutMean8,nutMean9,nutMean10,ncol=2)
nutSD <- ggplot(nuts, aes(factor(nuts$crop_list), band1sd))
nutSD + geom_violin(aes(fill = factor(nuts$crop_list)),draw_quantiles = c(0.25, 0.5, 0.75)) + geom_jitter(height = 0, width = 0.1)


