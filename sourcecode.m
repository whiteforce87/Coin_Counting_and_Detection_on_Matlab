A1=im2gray(imread('1tl.png'));
A2=im2gray(imread('50krs.png'));
A3=im2gray(imread('25krs.png'));
A4=im2gray(imread('10krs.png'));
A5=im2gray(imread('5krs.png'));
A6=im2gray(imread('1tl.jpg'));
A7=im2gray(imread('50krs.jpg'));;
A8=im2gray(imread('25krs.jpg'));
A9=im2gray(imread('10krs.jpg'));
A10=im2gray(imread('5krs.jpg'));
A11 = im2gray(imread('input.png'));

[BW,threshOut,Gv,Gh]= edge(A1,'Sobel');
[Gmag1,Gdir1] = imgradient(Gv,Gh);
[BW,threshOut,Gv2,Gh2]= edge(A2,'Sobel');
[Gmag2,Gdir2] = imgradient(Gv2,Gh2);
[BW,threshOut,Gv3,Gh3]= edge(A3,'Sobel');
[Gmag3,Gdir3] = imgradient(Gv3,Gh3);
[BW,threshOut,Gv4,Gh4]= edge(A4,'Sobel');
[Gmag4,Gdir4] = imgradient(Gv4,Gh4);
[BW,threshOut,Gv5,Gh5]= edge(A5,'Prewitt');
[Gmag5,Gdir5] = imgradient(Gv5,Gh5);
[BW,threshOut,Gv6,Gh6]= edge(A6,'Sobel');
[Gmag6,Gdir6] = imgradient(Gv6,Gh6);
[BW,threshOut,Gv7,Gh7]= edge(A7,'Prewitt');
[Gmag7,Gdir7] = imgradient(Gv7,Gh7);
[BW,threshOut,Gv8,Gh8]= edge(A8,'Sobel');
[Gmag8,Gdir8] = imgradient(Gv8,Gh8);
[BW,threshOut,Gv9,Gh9]= edge(A9,'Sobel');
[Gmag9,Gdir9] = imgradient(Gv9,Gh9);
[BW,threshOut,Gv10,Gh10]= edge(A10,'Sobel');
[Gmag10,Gdir10] = imgradient(Gv10,Gh10);
[BW,threshOut,Gv11,Gh11]= edge(A11,'Prewitt');
[Gmag11,Gdir11] = imgradient(Gv11,Gh11);

tetha=atan2(Gv,Gh)*(180/pi);

I1=[Gmag1];
I2 = [Gmag2];
I3 = [Gmag3];
I4 = [Gmag4];
I5 = [Gmag5];
I6 = [Gmag6];
I7 = [Gmag7];
I8 = [Gmag8];
I9 = [Gmag9];
I10 = [Gmag10];
I11 = [Gmag11];

imshowpair(Gmag11, Gdir11, 'montage');
title('Findind cicles, Magnitude and Direction');

rmin = 30; rmax = 150; 
[centers, rad] = imfindcircles(Gmag11,[rmin rmax], 'Sensitivity', 0.962, 'EdgeThreshold', 0.21); 
viscircles(centers, rad,'EdgeColor','b');

figure;
imhist(Gmag11)
title('Histogram');

points1 = detectHarrisFeatures(I1);
points2 = detectHarrisFeatures(I2);
points3 = detectHarrisFeatures(I3);
points4 = detectHarrisFeatures(I4);
points5 = detectHarrisFeatures(I5);
points6 = detectHarrisFeatures(I6);
points7 = detectHarrisFeatures(I7);
points8 = detectHarrisFeatures(I8);
points9 = detectHarrisFeatures(I9);
points10 = detectHarrisFeatures(I10);
points11 = detectHarrisFeatures(I11);

[features1,valid_points1] = extractFeatures(I1,points1);
[features2,valid_points2] = extractFeatures(I2,points2);
[features3,valid_points3] = extractFeatures(I3,points3);
[features4,valid_points4] = extractFeatures(I4,points4);
[features5,valid_points5] = extractFeatures(I5,points5);
[features6,valid_points6] = extractFeatures(I6,points6);
[features7,valid_points7] = extractFeatures(I7,points7);
[features8,valid_points8] = extractFeatures(I8,points8);
[features9,valid_points9] = extractFeatures(I9,points9);
[features10,valid_points10] = extractFeatures(I10,points10);
[features11,valid_points11] = extractFeatures(I11,points11);
indexPair = matchFeatures(features1,features11);
indexPair2 = matchFeatures(features2,features11);
indexPair3 = matchFeatures(features3,features11);
indexPair4 = matchFeatures(features4,features11);
indexPair5 = matchFeatures(features5,features11);
indexPair6 = matchFeatures(features6,features11);
indexPair7 = matchFeatures(features7,features11);
indexPair8 = matchFeatures(features8,features11);
indexPair9 = matchFeatures(features9,features11);
indexPair10 = matchFeatures(features10,features11);

matchedPoints1 = valid_points1(indexPair(:,1),:);
matchedPoints11 = valid_points11(indexPair(:,2),:);
matchedPoints2 = valid_points2(indexPair2(:,1),:);
matchedPoints12 = valid_points11(indexPair2(:,2),:);
matchedPoints3 = valid_points3(indexPair3(:,1),:);
matchedPoints13 = valid_points11(indexPair3(:,2),:);
matchedPoints4 = valid_points4(indexPair4(:,1),:);
matchedPoints14 = valid_points11(indexPair4(:,2),:);
matchedPoints5 = valid_points5(indexPair5(:,1),:);
matchedPoints15 = valid_points11(indexPair5(:,2),:);
matchedPoints6 = valid_points6(indexPair6(:,1),:);
matchedPoints16 = valid_points11(indexPair6(:,2),:);
matchedPoints7 = valid_points7(indexPair7(:,1),:);
matchedPoints17 = valid_points11(indexPair7(:,2),:);
matchedPoints8 = valid_points8(indexPair8(:,1),:);
matchedPoints18 = valid_points11(indexPair8(:,2),:);
matchedPoints9 = valid_points9(indexPair9(:,1),:);
matchedPoints19 = valid_points11(indexPair9(:,2),:);
matchedPoints10 = valid_points10(indexPair10(:,1),:);
matchedPoints20 = valid_points11(indexPair10(:,2),:);

count1 = matchedPoints1.Count;
count2 = matchedPoints2.Count;
count3 = matchedPoints3.Count;
count4 = matchedPoints4.Count;
count5 = matchedPoints5.Count;
count6 = matchedPoints6.Count;
count7 = matchedPoints7.Count;
count8 = matchedPoints8.Count;
count9 = matchedPoints9.Count;
count10 = matchedPoints10.Count;


figure; 
showMatchedFeatures(I1,I11,matchedPoints1,matchedPoints11);
title('1 TL');
figure; 
showMatchedFeatures(I2,I11,matchedPoints2,matchedPoints12);
title('50 KRS');
figure; 
showMatchedFeatures(I3,I11,matchedPoints3,matchedPoints13);
title('25 KRS');
figure; 
showMatchedFeatures(I4,I11,matchedPoints4,matchedPoints14);
title('10 KRS');
figure; 
showMatchedFeatures(I5,I11,matchedPoints5,matchedPoints15);
title('5 KRS');
figure; 
showMatchedFeatures(I6,I11,matchedPoints6,matchedPoints16);
title('1 TL');
figure; 
showMatchedFeatures(I7,I11,matchedPoints7,matchedPoints17);
title('50 KRS');
figure; 
showMatchedFeatures(I8,I11,matchedPoints8,matchedPoints18);
title('25 KRS');
figure; 
showMatchedFeatures(I9,I11,matchedPoints9,matchedPoints19);
title('10 KRS');
figure; 
showMatchedFeatures(I10,I11,matchedPoints10,matchedPoints20);
title('5 KRS');

image_normalised =double(A11)/255;

threshold = graythresh(image_normalised);
image_BW =im2bw(image_normalised, threshold);

image_BW_invert= 1-image_BW;
image_fill = imfill(image_BW_invert,'holes');
image_BW=1-image_fill;

[image_result, area, perimeter ] = loop(image_BW,2,10,5,0.2,0);
[image_result, area, perimeter ] = loop(image_result,3,14,10,0.05,0);

circularity = (perimeter .^ 2) ./ (4 * pi * area);

image_cc = bwconncomp(1-image_result);
image_labeled = labelmatrix(image_cc);
image_RGB_label = label2rgb(image_labeled);

number_coins = length(area);
disp("The Total Number of Coins is ");
disp(number_coins);