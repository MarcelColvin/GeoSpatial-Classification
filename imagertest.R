install.packages('imager')
library(imager)


?imager
install.packages('magrittr')
install.packages('XQuartz')
library(XQuartz)

setwd('Desktop/')
list.files()


plot('monkeystuff.png')
plot(boats)
class(boats)
grayscale(boats)
fpath = 'monkeystuff.jpg'
monkey = load.image(fpath)
fpath

#Gradient Tests
plot(monkey)
monkey.g = grayscale(monkey)
gr = imgradient(monkey.g,'xy')
gr
plot(gr,layout = 'row')
dx = imgradient(monkey.g,'x')
dy = imgradient(monkey.g,'y')
grad.mag = sqrt(dx^2 + dy^2)
plot(grad.mag,main =  'Gradient Magnitude')

install.packages('magick')
library(magick)
fpath2 = 'croppedclass.jp2'
spain = load.image(fpath2)

cropsespagna = image_read(fpath2)
print(cropsespagna)
crop_png = image_convert(cropsespagna,'jpg')
image_info(crop_png)
grayscale(crop_png)
image_write(crop_png, path = "crops.jpg", format = "jpg")
fpath3 = 'crops.jpg'
cropies = load.image(fpath3)
plot(cropies)
crops.g = grayscale(cropies)
plot(crops.g)
#plotting crops

dx = imgradient(crops.g,'x')
dy = imgradient(crops.g,'y')
grad.mag = sqrt(dx^2 + dy^2)
plot(grad.mag,main =  'Gradient Magnitude')
Davis = load.image('davis.jpeg')

plot(Davis)
davis.g = grayscale(Davis)


dx = imgradient(davis.g,'x')
dy = imgradient(davis.g,'y')
grad.mag = sqrt(dx^2 + dy^2)
plot(grad.mag,main =  'Gradient Magnitude')
?permute_axes

?crop.borders
plot(crop.borders(grad.mag,nx = 0,ny = 5000,nPix = 0))
plot(grad.mag)
