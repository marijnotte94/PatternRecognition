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
%%
m = prnist(0:9,1:400:1000);

data = seldat(m);
resized = im_resize(data,[128,128],'bicubic');

features = im_profile(resized);
A = prdataset(profile);
W = A * pcam;
B = A*W;
V = B*featsel;
E = clevalf(A*W,{nmc,ldc,knnc,parzenc,fisherc,loglc,neurc,treec});
figure;
plote(E,'noapperror');
axis([1 23 0 1])


%}
