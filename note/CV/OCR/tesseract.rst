.. include:: ../../../links.rst

tesseractの使い方
====================

0. Setup（Windows版）
----------------------------

# get source
git clone https://github.com/tesseract-ocr/tesseract tesseract
cd tesseract
    
# checkout stable 3.05
git checkout 3.05

# independence
cppan

# build
mkdir build && cd build
cmake ..
cmake --build . --config Release

# set TESSDATA_PREFIX environment variable
# Or inside build\bin\Release\tessdata
#   save trained data. We can get it from https://github.com/tesseract-ocr/tessdata

Run the following commands to test setup

.. code-block:: html

     tesseract.exe .\eurotext.tif stdout

See https://github.com/tesseract-ocr/tesseract/wiki for more example

Install pytesseract to use python-binding

1. example
-------------------------

Sample program

.. code-block:: html

    import numpy
    import PIL
    import cv2
    import pytesseract
    
    img = cv2.imread("eng.png", 0)

    # read image as numpy array
    img_np = cv2.imread("eng.png", 0)

    # convert to PIL image from numpy array
    img_pil = PIL.Image.fromarray(img_np)

    text = pytesseract.image_to_string(img_pil)
    text.encode("utf-8")

How to convert between PIL image and numpy array

.. code-block:: html

    # Convert Pil Image to array
    img_pil = PIL.Image.open("foo.jpg").convert("L")
    img_arr = numpy.array(img_pil)
    
    # Convert array to Image
    img_arr = cv2.imread("foo.jpg", 0)
    img_pil = PIL.Image.fromarray(arr)
