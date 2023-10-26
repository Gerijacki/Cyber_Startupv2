from PIL import Image
width, height = 15000, 15000

img = Image.new('RGB', (width, height), color='white')

img.save('huge_image.png')