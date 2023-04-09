%随机产生一种选点情况/基因链，计算这种方案下、对500个样本的标定误差
tic
%minput=dlmread('dataform_train.csv');
minput=readmatrix('dataform_train.csv');
Nsample=size(minput,1)/2;Npoint=size(minput,2);
voltage=zeros(Nsample,Npoint);
temprature=zeros(Nsample,Npoint);
voltage=minput([2:2:size(minput,1)],:);
temprature=minput([1:2:size(minput,1)],:);
% hold on
% for i=1:Nsample
%  plot(temprature(i,:),voltage(i,:));
% end
% hold off
A=rand(1,90);
targetgene=(A>0.5);%随机产生一个基因链，用0/1表示，以下就可以逻辑值作为矩阵索引
for j=1:Nsample
    premea_volt=voltage(j,targetgene);%针对一组样本点集，取出某条基因链的volt
    premea_tempr=temprature(j,targetgene);%针对一组样本点集，取出某条基因链的temp
    est_tempr(j,:)=interp1(premea_volt,premea_tempr,voltage(j,:),'spline');
end
errabs=abs(temprature-est_tempr);
toc
