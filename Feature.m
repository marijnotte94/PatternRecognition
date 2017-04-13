%{
m = prnist(0:9,1:200:1000);

%%
data = seldat(m);
resized = im_resize(data,[128,128],'bicubic');

%datafeatures = im_features(resized);
profile = im_features(resized);
dataset_profile = prdataset(profile);
%datamoments = im_moments(resized);
plote(clevalf(dataset_profile,pcam))

%%
%dataset = [datafeatures prdataset(dataprofile) prdataset(datamoments)];
clf = {nmc,ldc,knnc,parzenc,fisherc,loglc,neurc,treec}*pcam;
mf = 23;
featnum = [1:1:23]
datascaled = dataset_profile*scalem(dataset_profile,'variance');
[Test,Train]=gendat(datascaled,.5);
[w,r] = featselb(Train, 'eucl-m',mf)
e1 = clevalf(Train*w,clf,featnum,[],1,Test*w);
figure;
plote(e1,'noapperror')
%}
%%
m = prnist(0:9,1:1:1000);
repset = gendat(m, [5,5,5,5,5,5,5,5,5,5]);
data = seldat(repset);
resized = im_resize(data,[128,128],'bicubic');
dataset = pr_dataset(resized);


features = im_profile(dataset);
mapping = fisherm;
classifier = ldc;

A = prdataset(features);
W = A * mapping;
B = A*W;

[Train,Test] = gendat(B,0.5);
Train*(Test*(mapping*classifier))*testc













