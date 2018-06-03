install.packages("Hotelling")
library(Hotelling)
library(ICSNP)

crops = read.csv('updateddf.csv')
grepl(crops$crop_list[4],'OAT')
ALFS = sapply(X = cropfields$crop_list,FUN = function(x){
  bool = stri_detect_fixed(x,'Alfalfa')
  return(bool)
})
tomat = sapply(X = cropfields$crop_list,FUN = function(x){
  bool = stri_detect_fixed(x,'TOMATO')
  return(bool)
})
alfalfa = crops[ALFS,]
alfalfa$crop_list =  factor(alfalfa$crop_list)

orgALF = alfalfa[alfalfa$crop_list == 'ORG ALFALFA',]
regalf = alfalfa[alfalfa$crop_list == 'ALFALFA',]

cbandorg = orgALF[,c('Band1median','Band2median','Band3median','Band4median','Band5median','Band6median','Band7median','Band8median')]

cbandreg = regalf[,c('Band1median','Band2median','Band3median','Band4median','Band5median','Band6median','Band8median')]

cbandorg = orgALF[,c('Band7median','Band8median')]
cbandreg = regalf[,c('Band7median','Band8median')]


regtomat = tomatoes[tomatoes$crop_list == 'TOMATO PROCESS, UNCULTIVATED AG',]
orgtomat = tomatoes[tomatoes$crop_list == 'ORG TOMATO PROCESSING' | tomatoes$crop_list ==  "ORG TOMATO PROCESSING, ORG UNCULTIVATED AG",]
tbandorg = orgtomat[,c('Band1median','Band2median','Band3median','Band4median','Band5median','Band6median','Band7median','Band8median')]

tbandreg = regtomat[,c('Band1median','Band2median','Band3median','Band4median','Band5median','Band6median','Band7median','Band8median')]


#########

eat = hotelling.test(cbandorg,cbandreg,TRUE)
eat
t.test(tbandreg$Band5median,tbandorg$Band5median)
par(mfrow = c(1,2))
cbandorg$Band7median
hist(tbandreg$Band7median)
hist(tbandreg$Band7median)

tomatoes = crops[tomat,]

regtomat = tomatoes[tomatoes$crop_list == 'TOMATO PROCESS, UNCULTIVATED AG',]
orgtomat = tomatoes[tomatoes$crop_list == 'ORG TOMATO PROCESSING' | tomatoes$crop_list ==  "ORG TOMATO PROCESSING, ORG UNCULTIVATED AG",]
levels(factor(tomatoes$crop_list))

tbandorg = orgtomat[,c('Band1median','Band2median','Band3median','Band4median','Band5median','Band6median','Band7median','Band8median')]

tbandreg = regtomat[,c('Band1median','Band2median','Band3median','Band4median','Band5median','Band6median','Band7median','Band8median')]
tbandorg[!is.na(),]

testorg  = na.omit(tbandorg)
testreg = na.omit(tbandreg)
hist()



testreg
