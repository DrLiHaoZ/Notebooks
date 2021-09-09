from PIL import Image
import os
import matplotlib.pyplot as plt
from numpy.lib.type_check import imag

path = "c:/Users/PC/Desktop/MindmapDXY/ReadMe/blenderPy/Image/kkx.jpg"
image = Image.open(path)

# show and save the image
"""
image.show()
image.save("otherFormat.png")
plt.imshow(image)
plt.show()
"""

# display property of image
"""
print(image.size)
print(image.format)
print(image.mode)
"""

# if I want to change all iamges in a file to an another format
"""
path = "c:/Users/PC/Desktop/MindmapDXY/ReadMe/blenderPy/Image/"
for f in os.listdir(path + "."):
    if f.endswith('.jpg'):
        image = Image.open(path + f)
        fn, fext = os.path.splitext(f)
        #print(fn + ',' + fext)
        image.save(path + '{}.png'.format(fn))
"""

# get pixel
"""
coordinate = x, y = 0, 0
print(image.getpixel(coordinate))
"""

# crop the image
# for example to crop the upper left 1/4 of the image
"""
size = image.size
leftUpper = (0, 0)
rightButtom = (int(size[0]/2), int(size[1]/2))
image_crop = image.crop(leftUpper + rightButtom)
plt.imshow(image_crop)
plt.show()
"""

# transpose the image
"""
image1 = image.transpose(Image.FLIP_TOP_BOTTOM)
image2 = image.transpose(Image.FLIP_LEFT_RIGHT)
image3 = image.transpose(Image.ROTATE_180)
image4 = image.transpose(Image.ROTATE_90)
image5 = image.transpose(Image.TRANSPOSE)

plt.figure(figsize=(10, 10))

plt.subplot(3, 2, 1)
plt.imshow(image1)
plt.title("FLIP_TOP_BOTTOM")

plt.subplot(3, 2, 2)
plt.imshow(image2)
plt.title("FLIP_LEFT_RIGHT")

plt.subplot(3, 2, 3)
plt.imshow(image3)
plt.title("ROTATE_180")

plt.subplot(3, 2, 4)
plt.imshow(image4)
plt.title("ROTATE_90")

plt.subplot(3, 2, 5)
plt.imshow(image5)
plt.title("TRANSPOSE")


plt.subplot(3, 2, 6)
plt.imshow(image)
plt.title("Original")

plt.show()
"""
im =  Image.new('L',(100,100))
im.show()