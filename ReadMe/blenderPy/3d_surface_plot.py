# https://medium.com/swlh/3d-surface-plots-in-blender-54b349e2398d
# tutorial from this website

from PIL import Image

width = 800
height = 600

def getpixel(x, y):
  n = 0.5  # Get value here
  return int(255*n)

# Create a new image. L for grayscale
im = Image.new('L', (width, height))

for x in range(width):
  for y in range(height):
    im.putpixel((x, y), getpixel(x, y))
im.show()