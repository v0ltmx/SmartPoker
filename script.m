pkg load image

imagem = strcat('C:\Users\lucas\Desktop\SmartPoker\banco\', 'K_paus.jpg');

img = imread(imagem);

img_gray = rgb2gray(img);

LIMIAR = 220;

B = img_gray;
B(B<=LIMIAR) = 0;
B(B>LIMIAR) = 255;


figure, imshow(B);