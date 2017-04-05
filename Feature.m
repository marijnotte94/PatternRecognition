m = prnist(0:9,1:5:1000);

data = seldat(m);
%resizing images so every image is same size
resized = im_resize(data,[128,128],'bicubic');
datafeatures = im_features(resized);
dataprofile = im_profile(resized);
datamoments = im_moments(resized);

dataset = [datafeatures prdataset(dataprofile) prdataset(datamoments)];

datascaled = dataset*scalem(dataset,'variance');

datapca = datascaled*pcam(datascaled,20);

W = {ldc,knnc([],5)};

[Train,Test]=gendat(datapca(:,:),.7);
E = testc(Test,Train*W)

