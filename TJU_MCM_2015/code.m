%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       1.提取原始视频关键帧         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
obj = VideoReader('/home/shintaku/Documents/mcm/2/1.mpg');
numFrames = obj.NumberOfFrames;
M = read(obj, 6);
num=0;
for k = 12 : numFrames
      N = read(obj, k);
      I = rgb2gray(M);
      J = rgb2gray(N);
      a = imhist(J);
      [Count1,x] = imhist(I);
      [Count2,x] = imhist(J);
      Sum1 = sum(Count1);
      Sum2 = sum(Count2);
      Sumup = sqrt(Count1.*Count2);
      SumDown = sqrt(Sum1*Sum2);
      Sumup = sum(Sumup);
      figure(1);
      subplot(2,2,1); imshow(I);
      subplot(2,2,2); imshow(J);
      subplot(2,2,3); imhist(I);
      subplot(2,2,4); imhist(J);
      BC = 1-sqrt(1-Sumup/SumDown); %巴氏系数
      if BC < 0.98 %如果距离低于该值可视为下一关键帧
              num = num+1;
              imwrite(N, ['/home/shintaku/Documents/mcm/2/k1/frame' num2str(num) '.jpg']);
              M = N;
      end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        2.提取亮度变化视频对应关键帧         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
obj = VideoReader('/home/shintaku/Documents/mcm/2/2.mpg');
numFrames = obj.NumberOfFrames;
M = read(obj, 6);
num=0;
for k = 12 : numFrames
      N = read(obj, k);
      I = rgb2gray(M);
      J = rgb2gray(N);
      a = imhist(J);
      [Count1,x] = imhist(I);
      [Count2,x] = imhist(J);
      Sum1 = sum(Count1);
      Sum2 = sum(Count2);
      Sumup = sqrt(Count1.*Count2);
      SumDown = sqrt(Sum1*Sum2);
      Sumup = sum(Sumup);
      figure(1);
      subplot(2,2,1); imshow(I);
      subplot(2,2,2); imshow(J);
      subplot(2,2,3); imhist(I);
      subplot(2,2,4); imhist(J);
      BC = 1-sqrt(1-Sumup/SumDown); %巴氏系数
      if BC < 0.975 %如果距离低于该值可视为下一关键帧
              num = num+1;
              imwrite(N, ['/home/shintaku/Documents/mcm/2/k2/frame' num2str(num) '.jpg']);
              M = N;
      end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       3.亮度变化视频匹配         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sum = 0;
for k = 3 : 38
      image1 = strcat('/home/shintaku/Documents/mcm/2/k1/frame',num2str(k),'.jpg');
      image2 = strcat('/home/shintaku/Documents/mcm/2/k2/frame',num2str(k),'.jpg');
      num = surf_match(image1, image2);
      sum = sum + num;
end
sum = sum / 36;  %如果sum的平均值大于120即可认为雷同
fprintf('Sum = %.4f\n', sum);
if sum > 120 error('Match Successfully');
else error('Match Failed');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        4.提取添加字幕视频对应关键帧         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
obj = VideoReader('/home/shintaku/Documents/mcm/2/3.mpg');
numFrames = obj.NumberOfFrames;
M = read(obj, 6);
num = 0;
for k = 12 : numFrames
      N = read(obj, k);
      I = rgb2gray(M);
      J = rgb2gray(N);
      a = imhist(J);
      [Count1,x] = imhist(I);
      [Count2,x] = imhist(J);
      Sum1 = sum(Count1);
      Sum2 = sum(Count2);
      Sumup = sqrt(Count1.*Count2);
      SumDown = sqrt(Sum1*Sum2);
      Sumup = sum(Sumup);
      figure(1);
      subplot(2,2,1); imshow(I);
      subplot(2,2,2); imshow(J);
      subplot(2,2,3); imhist(I);
      subplot(2,2,4); imhist(J);
      BC = 1-sqrt(1-Sumup/SumDown); %巴氏系数
      if BC < 0.975 %如果距离低于该值可视为下一关键帧
              num = num+1;
              imwrite(N, ['/home/shintaku/Documents/mcm/2/k3/frame' num2str(num) '.jpg']);
              M = N;
      end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       5.添加字幕视频匹配         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sum = 0;
for k = 3 : 38
      image1 = strcat('/home/shintaku/Documents/mcm/2/k1/frame',num2str(k),'.jpg');
      image2 = strcat('/home/shintaku/Documents/mcm/2/k3/frame',num2str(k),'.jpg');
      num = surf_match(image1, image2);
      sum = sum + num;
end
sum = sum / 36;  %如果sum的平均值大于80即可认为雷同
fprintf('Sum = %.4f\n', sum);
if sum > 80 error('Match Successfully');
else error('Match Failed');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        6.提取增加噪声视频对应关键帧         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
obj1 = VideoReader('/home/shintaku/Documents/mcm/2/1.mpg');
obj4 = VideoReader('/home/shintaku/Documents/mcm/2/4.mpg');
numFrames = obj1.NumberOfFrames;
M = read(obj1, 6);
num = 0;
for k = 12 : numFrames
      N = read(obj1, k);
      P = read(obj4, k+20);
      I = rgb2gray(M);
      J = rgb2gray(N);
      Q = rgb2gray(P);
      [Count1,x] = imhist(I);
      [Count2,x] = imhist(J);
      a = imhist(Q);
      Sum1 = sum(Count1);
      Sum2 = sum(Count2);
      Sumup = sqrt(Count1.*Count2);
      SumDown = sqrt(Sum1*Sum2);
      Sumup = sum(Sumup);
      figure(1);
      subplot(2,2,1); imshow(Q);
      subplot(2,2,2); imshow(J);
      subplot(2,2,3); imhist(Q);
      subplot(2,2,4); imhist(J);
      BC = 1-sqrt(1-Sumup/SumDown);
      su = 0;
      for l = 1 : 20 %统计深色像素点个数
              su = su + a(l); %大于30000可视为黑屏
      end
      if su<30000 && BC < 0.98 %如果不是黑屏且距离低于该值可视为下一关键帧
              num = num+1;
              imwrite(P, ['/home/shintaku/Documents/mcm/2/k4/frame' num2str(num) '.jpg']);
              M = N;
      end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       7.增加噪声视频匹配         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%将k1中的关键帧生成pgm
for k = 1 : 41
      imgname=strcat('/home/shintaku/Documents/mcm/2/k1/frame',num2str(k),'.jpg');
      image = imread(imgname);
      image = rgb2gray(image);
      [rows, cols] = size(image); 

      imgname=strcat('/home/shintaku/Documents/mcm/2/k1/frame',num2str(k),'.pgm');
      f = fopen(imgname, 'w');
      fprintf(f, 'P5\n%d\n%d\n255\n', cols, rows);
      fwrite(f, image', 'uint8');
      fclose(f);

      if isunix
          command = '!./sift ';
      else
          command = '!siftWin32 ';
      end

      keyname=strcat('/home/shintaku/Documents/mcm/2/k1/frame',num2str(k),'.key');
      command = [command ' <' imgname ' >' keyname];
      eval(command);
end

%将k4中的关键帧生成pgm
for k = 1 : 41
      imgname=strcat('/home/shintaku/Documents/mcm/2/k4/frame',num2str(k),'.jpg');
      image = imread(imgname);
      image = rgb2gray(image);
      [rows, cols] = size(image); 

      imgname=strcat('/home/shintaku/Documents/mcm/2/k4/frame',num2str(k),'.pgm');
      f = fopen(imgname, 'w');
      fprintf(f, 'P5\n%d\n%d\n255\n', cols, rows);
      fwrite(f, image', 'uint8');
      fclose(f);

      if isunix
          command = '!./sift ';
      else
          command = '!siftWin32 ';
      end

      keyname=strcat('/home/shintaku/Documents/mcm/2/k4/frame',num2str(k),'.key');
      command = [command ' <' imgname ' >' keyname];
      eval(command);
end

%将噪声关键帧与原始关键帧匹配
sum=0;
for k = 3 : 38
      image1 = strcat('/home/shintaku/Documents/mcm/2/k1/frame',num2str(k),'.pgm');
      image2 = strcat('/home/shintaku/Documents/mcm/2/k4/frame',num2str(k),'.pgm');
      num=match(image1, image2);
      sum=sum+num;
end
sum=sum/36;  %如果sum的平均值大于10即可认为雷同
fprintf('Sum = %.4f\n', sum);
if sum > 10 error('Match Successfully');
else error('Match Failed');
end
