#historgram of band 7
#band 7 dist organic nonorganic tomato and alfalfa
library(stringi)
library(ggplot2)
crops = read.csv('updateddf.csv')
grepl(crops$crop_list[4],'OAT')
ALFS = sapply(X = crops$crop_list,FUN = function(x){
  bool = stri_detect_fixed(x,'Alfalfa')
  return(bool)
})
tomat = sapply(X = crops$crop_list,FUN = function(x){
  bool = stri_detect_fixed(x,'TOMATO')
  return(bool)
})

orgalf = crops[crops$crop_list == 'ORG ALFALFA',]
regalf = crops[crops$crop_list == 'ALFALFA',]
alfalfa = rbind(orgalf,regalf)
factor(alfalfa$crop_list)
regtomat = crops[crops$crop_list == 'TOMATO PROCESS, UNCULTIVATED AG',]
orgtomat = crops[crops$crop_list == 'ORG TOMATO PROCESSING' | crops$crop_list ==  "ORG TOMATO PROCESSING, ORG UNCULTIVATED AG",]
tomato = rbind(regtomat,orgtomat)
levels(factor(tomato$crop_list))

tomato$crop_list <- gsub('ORG TOMATO PROCESSING', 'ORG', tomato$crop_list)
tomato$crop_list <- gsub('TOMATO PROCESS, UNCULTIVATED AG', 'NONORG', tomato$crop_list)
#Comparison of medians across org / nonorg ALF
alfalfa7 <- ggplot(alfalfa, aes(factor(alfalfa$crop_list), Band7median)) 
alfalfa7 + geom_violin(aes(fill = factor(alfalfa$crop_list))) + guides(fill=guide_legend(title='Type of Alfalfa')) +
  xlab('Crop') + ylab('Median') + ggtitle('Violin Plot of Band 7 Median of Organic vs Non-Organic Alfalfa')
#Staggered Histogram
alfalfaHist  <- ggplot(alfalfa, aes(x=Band7median,color = as.factor(alfalfa$crop_list))) 
alfalfaHist + geom_density() + guides(guide_legend(fill = FALSE,title='Type of Alfalfa')) + ggtitle('Distribution of Band 7 Median of Organic vs Non-Organic Alfalfa') +
xlab('Band 7 Median') + labs(colour= "Type of Alfalfa")
#Comparison of medians across org/non TOMATO
tomato7 = alfalfa7 <- ggplot(tomato, aes(factor(tomato$crop_list), Band7median)) 
alfalfa7 + geom_violin(aes(fill = factor(tomato$crop_list))) + guides(fill=guide_legend(title='Type of Tomato')) +
  xlab('Crop') + ylab('Median') + ggtitle('Violin Plot of Band 7 Median of Organic vs Non-Organic Tomato')

