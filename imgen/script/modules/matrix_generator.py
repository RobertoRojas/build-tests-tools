from PIL import ImageDraw
from random import randint

def draw_rectangles(drw: ImageDraw, rectangles_number: int=1, size: int=500):
    if rectangles_number < 1:
        raise Exception("The min amount of rectangles is 1, please verify it")
    for _ in range(rectangles_number):
        x1, y1 = randint(0, size), randint(0, size)
        x2, y2 = randint(x1, size), randint(y1, size)
        drw.rectangle([(x1, y1),(x2, y2)], fill=(randint(0, 255), randint(0, 255), \
                                                 randint(0, 255)))