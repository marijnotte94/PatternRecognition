m = prnist(0:9,1:1:1000);

data = seldat(m);
%resizing images so every image is same size
data = im_resize(data,[15,15],'bicubic');
data = im_norm(data);
dataset = prdataset(data);

%%
[trainset,testset] = gendat(dataset,0.5);
repset = trainset; %gendat(trainset, [5,5,5,5,5,5,5,5,5,5]);

%
%classifiers = append([], knnc(repset,2), knnc(repset,3), knnc(repset,4), nmc(repset), ldc(repset), loglc(repset), parzenc(repset, 0.25), parzenc(repset, 0.5), parzenc(repset, 0.75), treec(repset), neurc(repset));
classf = knnc(repset, 3);
e = testset*classf*testc;   
%scatterd(trainset);
disp(num2str(e,'%5.3f'))
disp('Calculating using nist_eval')
e = nist_eval('my_rep',classf);
disp(num2str(e,'%5.3f'))