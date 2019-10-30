clc
clear all
%加载原始数据
% load('boost1.mat');
load('buckboost10.mat');
% boost1
i=1:1000;
j=1:1000;
k=1:1000;
m=1:1000;
n=1:1000;


y =buckboost10(i,1);
y1=buckboost10(j,2);
y2=buckboost10(k,3);
y3=buckboost10(m,4);
y4=buckboost10(n,5);
cspca=[];

w=45;               %信噪比
r=0.5;
pca=[];
pca1=[];
pca2=[];
pca3=[];
smooth=[];
%%
% for r=0.3:0.1:0.8
% for w=30:5:65
yw=awgn(y, w,'measured', 2);
yw1=awgn(y1,w,'measured',2);
yw2=awgn(y2,w,'measured',2);
yw3=awgn(y3,w,'measured',2);
yw4=awgn(y4,w,'measured',2);
% for K=2:2:169
K=100;                    %70;124
% yw5=y5+w;
sig=compressed(yw,r,K);
sig1=compressed(yw1,r,K);
sig2=compressed(yw2,r,K);
sig3=compressed(yw3,r,K);
sig4=compressed(yw4,r,K);
% sig5=compressed(y5,w,r,K);
%% 特征提取
% PCA
[pcaout]=feaext(sig);
[pcaout1]=feaext(sig1);
[pcaout2]=feaext(sig2);
[pcaout3]=feaext(sig3);
[pcaout4]=feaext(sig4);
% [pcaout4]=feaext(yw1);
% [pcaout5]=feaext(yw2);

%% 评价指标
D=evalution(pcaout,pcaout1);
D1=evalution(pcaout,pcaout2);
D2=evalution(pcaout,pcaout3);
D3=evalution(pcaout,pcaout4);
pca=[pca,D(2,:)];
pca1=[pca1,D1(2,:)];
pca2=[pca2,D2(2,:)];
pca3=[pca3,D3(2,:)];
d1=mean(pcaout4)-mean(pcaout);
d2=mean(pcaout4)-mean(pcaout);
dd=[d1,d2];
smooth1=sqrt(sum(diff(pcaout4).^2)./(9*(min(dd).^2)));
smooth=[smooth,smooth1];
% end
%%
% sigpower=sum(abs(y).^2)/length(y);
% noisepower=sum(abs(sig-y).^2)/length(sig-y);
% SNR=10*log10(sigpower/noisepower);
% S=[S,SNR];
% % disp(['信噪比',num2str(SNR)])
% PRD=sqrt(sum((y-sig).^2)./sum(y.^2));
% P=[P,PRD];
% % disp(['失真率',num2str(PRD)]);
% RMSE=sqrt(sum((y-sig).^2)./1024);
% R=[R,RMSE]
% % disp(['均方根误差',num2str(RMSE)]);