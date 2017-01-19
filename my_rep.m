%to call function:
% a = prnist([0:9],[1:50:1000]);
% my_rep(a);

function [ dataset ] = my_rep(m)
data = seldat(m);
%resizing images so every image is same size
resized = im_resize(data,[128,128]);
dataset = im_features(resized);

%scatter matrix
m = mean(dataset);
sigma = meancov(dataset);
for i = 1:9
    mi(i) = mean(dataset(i,:));
    sigmai(i) = cov(dataset(i,:));
end;



%PCA
%[x z] = gendat(dataset);
%u = scalem([],'variance')*pcam([],0.9)*parzenc;
%w = x*u;
%scatterd(z*w);

%feature combining for feature 1+2, just example 
%(labels of figure are incorrect though)
%feature1 = dataset(:,1);
%feature2 = dataset(:,7);
%features = [feature1 feature2];

%scaling features
%features = features*scalem(features,'domain');
%[U G] = meancov(features)
%U(1,:)
%scatterd(features,'legend');
%classifing, knnc as example
%w = knnc(features,4);
%plotc(W);
%hold on;
%scatterd(features,'legend');
%hold off;
end

