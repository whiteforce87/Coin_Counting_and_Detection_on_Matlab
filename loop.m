function [image_result, area,perimeter] = loop(image_result, erode1, dialate1,erode2,accuracy, pre_count)
loop_count =1;

if(pre_count == 0)
    
while true
[image_result, area, perimeter ] = erosion_dilation(image_result,erode1,dialate1,erode2);

circularity = (perimeter .^ 2) ./ (4 * pi * area);
circ_mean = mean(circularity);
if (loop_count==15) break;
end
if (( circ_mean> 1-accuracy) &(circ_mean<1+accuracy)) return;
end
loop_count = loop_count +1;
end

else 
while true
[image_result, area, perimeter ] = erosion_dilation(image_result,erode1,dialate1,erode2);

circularity = (perimeter .^ 2) ./ (4 * pi * area);
circ_mean = mean(circularity);
if (loop_count==pre_count) return;
end
loop_count = loop_count +1;
end
end
end

function [image_erode_dialate ,coins_area, coins_perimeter] = erosion_dilation(image_input, erode1, dialate1, erode2)
se1 = strel('disk',erode1,0);
se2 = strel('disk',dialate1,0);
se3 = strel('disk',erode2,0);

image_erode_1=imerode(image_input,se1);
image_dialate_1=imdilate(image_erode_1,se2);
image_erode_dialate =imerode(image_dialate_1,se3);

image_cc = bwconncomp(1-image_erode_dialate);
image_labeled = labelmatrix(image_cc);
coins_area = cell2mat(squeeze(struct2cell(regionprops(image_labeled,'Area'))));
coins_perimeter =cell2mat(squeeze(struct2cell(regionprops(image_labeled,'Perimeter'))));
end
