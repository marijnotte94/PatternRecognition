m = prnist([0:9],[1:5:1000]);
data = seldat(m);
%resizing images so every image is same size
resized = im_resize(data,[128,128]);
dataset = im_features(resized);
%Leave out irrelevant features
%dataset = dataset(:,[1 3:14 18:23]);

%Outlier removal
dataset = remoutl(dataset);

%Scaling data
%Maybe using the softmax scaling can be a good idea.
%dataset = dataset*scalem(dataset,'variance');

%%
% Feature selection based on individual features
% Do values of the feature differ significantly for different classes?
% Following Paragraph 5.4 (with the modification of problem 5.4)
N = +classsizes(dataset);
[Mean Cov] = meancov(dataset);
Mean = +Mean;
Var = zeros(10,23);
for i = 1:10;
    Var(i,:) = diag(Cov(:,:,i));            %We scaled based on variance, total variance should be 1 right??
end

Sz = sqrt(sum(Var).^2./(sum(classsizes(dataset))-2));  


for j = 1:23
    for i = 1:10
        a = 1:10;
        a(a==i)=[];
        q(i,j) = Mean(i,j)-mean(Mean(a,j))/Sz(j);
    end
end

% q is the significance of mean value differences. Using max(abs(q)) the
% features with high discriminativity with respect to a certain class can
% be selected.

% Class 6,8,10,12,14 and 17 have high mean differences for some classes
%plotf(dataset(:,14));


S_W = bsxfun(@sum,bsxfun(@times,Cov,reshape(N/sum(N),1,1,10)),3);
S_B = Mean'*bsxfun(@times,Mean,N'/sum(N));
S_M = cov(+dataset);
S_M2 = S_B + S_W;           %S_M2 and S_M don't perfectly match...


% Select features based on Scatter Matrices (par 5.6.3). Using a forward
% selection method. The best features are stored in the vector 'select'. 
% The value of their selection criterion in the vector 'J1'.
select = [];
for i = 1:5
    clear Performance
    for j = 1:23
        featloop = [select j];
        if any(select==j)
        else
            Performance(j) = trace(S_B(featloop',featloop))/trace(S_W(featloop',featloop));
        end
    end
    [J1(i),I] = max(Performance);
    select = [select I];
end
%plotf(dataset(:,select));


%%
%comparing feature selection(featselb) with feature extraction (pcam)
%Actually only works for lower amount of features
%tried different methods (pcam,klm..) values but for large feature size
%error does not go below 1.6
%There is some effect, however extra things need to happen in order to get
%the acquired error rate
%feature extraction works better than selection
[trn,tst] = gendat(dataset,.5)
clsf = svc;
featnum = [1:1:23];
mf = 21;
[w,r] = featselb(trn,'eucl-m',mf);
w1 = pcam(trn,mf);
e = clevalf(trn,clsf,featnum,[],1,tst);
e1 = clevalf(trn*w,clsf,featnum,[],1,tst*w);
e2 = clevalf(trn*w1,clsf,featnum,[],1,tst*w1);


%%
figure
plote({e2},'noapperror')

%%
%trying first feature extraction, than selection
[trn,tst] = gendat(dataset,.5)
clsf = s;
featnum = [1:1:23];
w1 = pcam(trn,21);
w2 = trn*w1;
[w,r] = featselb(w2,'eucl-m',19);
e = clevalf(trn,clsf,featnum,[],1,tst);
e1 = clevalf(w2*w,clsf);
%%
figure;
plote(e2,'noapperror');



