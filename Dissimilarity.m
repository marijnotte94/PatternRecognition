m = prnist(0:9,1:125:1000);

data = seldat(m);
%resizing images so every image is same size
resized = im_resize(data,[128,128],'bicubic');
dataset = prdataset(resized);
%%
[trainset,testset] = gendat(dataset,.5);
repset = gendat(trainset,0.25); 
disspace = proxm(repset,'c',1);
trainrep = trainset*disspace; 
%%


classf = trainrep*fisherc;
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*nmc;
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*qdc;
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*ldc;
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*loglc;
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*knnc;
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*parzenc;
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*treec;
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*neurc;
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*svc;
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

%%
%{
classf = trainrep*[fisherc,nmc];
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*[fisherc,ldc];
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*[fisherc,knnc];
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*[fisherc,parzenc];
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*[nmc, ldc];
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*[nmc, knnc];
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*[nmc, parzenc];
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*[ldc, knnc];
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*[ldc, parzenc];
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')

classf = trainrep*[knnc, parzenc];
e = testset*disspace*classf*testc;   
%scatterd(trainset);               
num2str(e,'%5.3f')
%}


    

