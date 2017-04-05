m = prnist(0:9,1:1:1000);

data = seldat(m);
%resizing images so every image is same size
resized = im_resize(data,[128,128],'bicubic');
dataset = prdataset(resized);
%%
[trainset,testset] = gendat(dataset,.5);
repset = gendat(trainset,0.25); 
disspace = proxm(repset,'d',1);
trainrep = trainset*disspace; 
%%
classf = trainrep*rnnc;
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')


    

