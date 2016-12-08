function [ dataset ] = Assignment()
a = prnist([0:9],[1:40:1000]);
data = seldat(a);
resized = im_resize(data,[128,128]);
dataset = im_features(resized);
    
end

