# https://medium.com/swlh/3d-surface-plots-in-blender-54b349e2398d
# tutorial from this website

from PIL import Image
import random
import numpy


width = 1000
height = 1000

# generate the random black and white dots
# Image.new("1") means for 1 bit (0,1)
"""
# Create a new image. L for grayscale
im = Image.new('1', (width, height))
for x in range(width):
    for y in range(height):
        im.putpixel((x, y), random.choice((0, 1)))
im.show()
"""

# now we generate the image with grey scale
# Image.new("L") means for 8 bit 256
"""
im = Image.new('L', (width, height))
for x in range(width):
    for y in range(height):
        im.putpixel((x, y), random.randint(0, 256))
im.show()
"""

# now we generate the image with rgb color
# Image.new("RGB") means for 3 * 8 bit 256
"""
im = Image.new('RGB', (width, height))
def randColor():
    x = random.randint(0, 256)
    y = random.randint(0, 256)
    z = random.randint(0, 256)
    return x, y, z


for x in range(width):
    for y in range(height):
        im.putpixel((x, y), (219, 134, 55))
im.show()
"""

# now I want to generate the grey scale image with normal distribution

"""
im = Image.new('L', (width, height))
grey_scale = numpy.random.normal(0, 300, width)
grey_scale = sorted(grey_scale)
for i in range(width):
    grey_scale[i] = (grey_scale[i] / numpy.max(grey_scale)) * 256
    grey_scale[i] = int(abs(grey_scale[i]))
print(grey_scale)
for x in range(width):
    for y in range(height):
        im.putpixel((x, y), int(grey_scale[y] + grey_scale[x]))
im.show()
"""
