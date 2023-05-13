#!/usr/bin/env python
import sys
import argparse

from PIL import Image, ImageDraw
from typing import Sequence

from matrix_generator import draw_rectangles

def min_val(n) -> None:
    try:
        n = int(n)
    except Exception as ex:
        raise argparse.ArgumentTypeError(ex)
    if n < 1:
        raise argparse.ArgumentTypeError(f"The minimum value of the argument must be 1")
    return n

def parse_args(args: Sequence[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument('-o', '--output', required=True, type=str, \
                        dest='output', help='Path of the image to generate')
    parser.add_argument('-s', '--size', default=500, type=min_val, \
                        dest='size')
    return parser.parse_args(args=args)

def main() -> None:
    args = parse_args(sys.argv[1:])
    img = Image.new('RGB', (args.size, args.size), color=(0, 0, 0))
    drw = ImageDraw.Draw(img)
    draw_rectangles(drw=drw, rectangles_number=5, size=args.size)
    img.save(args.output)

if __name__ == "__main__":
    if sys.version_info[0] < 3:
        raise Exception("Must be using Python 3")
    main()