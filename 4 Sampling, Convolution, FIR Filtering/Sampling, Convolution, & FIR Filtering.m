clear;
clc;
xx=256*(rem(0:100,50)<10);
bb=[1,-0.9];
ff=firfilt(bb,xx);

b1=ones(1,23);
for i=1:23
    b1(i)=b1(i)*0.9^(i-1);
end
f1=firfilt(b1,ff);

figure,subplot(1,2,1);stem(bb,'filled');axis([0 5 -1 1]);grid on;
subplot(1,2,2);stem(b1,'filled');axis([0 10 0 1]);grid on;

figure,subplot(4,1,1);stem(xx);grid on;axis([0 75 -300 300]);title('£ø[£î]');
subplot(4,1,2);stem(ff);grid on;axis([0 75 -300 300]);title('¦Ø [£î]');
subplot(4,1,3);stem(f1);grid on;axis([0 75 -300 300]);title('£ù[£î]');

error=ones(0,50);
for j=1:50
    error(j)=xx(j)-f1(j);
end
subplot(4,1,4);stem(error);grid on;axis([0 75 -50 50]);title('error');

max_err=max(error);

load('C:\Users\Administrator\Desktop\Lab_Materials\labdat.mat');
b2=zeros(1,1600);
b2(1)=1;b2(1600)=-0.1;
yecho=firfilt(b2,x2);
figure,subplot(2,1,1);plot(x2);axis([0 25000 -40000 40000]);title('the original siganl');grid on
subplot(2,1,2);plot(yecho);axis([0 25000 -40000 40000]);title('the echo signal');grid on;
soundsc(yecho,8000);

h=firfilt(b1,bb);
mag=abs(h);
pha=angle(h); 
figure,subplot(3,1,1);stem(h);title('Cascade impluse response')
subplot(3,1,2);stem(mag);title('Magnitude');
subplot(3,1,3);stem(pha);title('Phase')

load('C:\Users\Administrator\Desktop\Lab_Materials\labdat.mat');
bbh=[1,-0.9];
bbv=bbh';
e=conv2(echart,bbh);
ech90=conv2(e,bbv);
figure,subplot(1,2,1);imshow(echart);title('the original Image')
subplot(1,2,2);imshow(ech90);title('the distoring Image')

rb=ones(1,12);
for i=1:12
    rb(i)=rb(i)*0.9^(i-1);
end
back=firfilt(rb,ech90);
figure,subplot(1,2,1);imshow(back);title('the restoring Image, M=11')

for m=1:256
    for n=1:1:256
        img_err(m,n) =echart(m,n)-back(m,n);
    end
end
subplot(1,2,2);imshow(img_err);title('worst error')









