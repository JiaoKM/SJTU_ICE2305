%�������һ��ѡ�����/���������������ַ����¡���500�������ı궨���
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
targetgene=(A>0.5);%�������һ������������0/1��ʾ�����¾Ϳ����߼�ֵ��Ϊ��������
for j=1:Nsample
    premea_volt=voltage(j,targetgene);%���һ�������㼯��ȡ��ĳ����������volt
    premea_tempr=temprature(j,targetgene);%���һ�������㼯��ȡ��ĳ����������temp
    est_tempr(j,:)=interp1(premea_volt,premea_tempr,voltage(j,:),'spline');
end
errabs=abs(temprature-est_tempr);
toc
