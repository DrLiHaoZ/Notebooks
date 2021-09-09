from PIL import Image
from noise import pnoise2

width = 800
height = 600
scale = 200


def getpixel(x, y):
    n = pnoise2(x/scale, y/scale) + 0.5
    return (
        int(255*n),
        80,
        int(255*(1-n))
    )


def generate():
    im = Image.new('RGB', (width, height))

    for x in range(width):
        for y in range(height):
            im.putpixel((x, y), getpixel(x, y))

    im.save('diffuse_map.png')
