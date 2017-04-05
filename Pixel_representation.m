m = prnist(0:9,1:5:1000);

data = seldat(m);
%resizing images so every image is same size
resized = im_resize(data,[5,5],'bicubic');

dataset = prdataset(resized);
W = {parzenc([],0.5),knnc([],6)};

[Train,Test]=gendat(dataset(:,:),.7);
E = testc(Test,Train*W)