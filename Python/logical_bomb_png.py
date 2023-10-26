from PIL import Image
width, height = 100000, 100000

img = Image.new('RGB', (width, height), color='white')

img.save('huge_image.png')