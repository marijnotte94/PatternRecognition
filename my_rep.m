%to call function:
% a = prnist([0:9],[1:50:1000]) (selects numbers 0-9);
% my_rep(a);

function [ dataset ] = my_rep(m)
data = seldat(m);
%resizing images so every image is same size
resized = im_resize(data,[128,128]);
dataset = im_features(resized);
%feature combining for feature 1+2, just example 
%(labels of figure are incorrect though)
feature1 = dataset(:,1) + dataset(:,7);
feature2 = dataset(:,8);
features = [feature1 feature2]
%scaling features
features= features*scalem(features,'variance');
scatterd(features,'legend');
%classifing, knnc as example
w = knnc(features,4);
plotc(w);
hold on;
scatterd(features,'legend');
hold off;
end

