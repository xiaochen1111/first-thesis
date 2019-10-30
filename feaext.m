function [pcaout]=feaext(yin)
y=yin;
% PCA
% k=3:1:902;
k=1:1:930;
pcain=y(k);
x=reshape(pcain,93,10);   % 将10组值写为矩阵，每一列代表一个周期
N=1;
p=gen_pca(x, N, 'svd');
pcaout=p*x;
% %% 滑动平滑滤波
% L = length(pcaout);
% n=5;  % 窗口大下
% k = 0;
% m =0 ;
% for i = 1:L
%     m = m+1;
%     if i+n-1 > L
%         break
%     else
%         for j = i:n+i-1
%             k = k+1;
%             W(k) = pcaout(j) ;
%         end
%        pcaout(m) = mean(W);
%         k = 0;
%     end
% end

% pcaout=sum(pcaout)./N;