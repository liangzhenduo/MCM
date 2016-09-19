obj = VideoReader('~/Documents/Appendix4.avi');
numFrames = obj.NumberOfFrames;
for k = 1600 : numFrames
if mod(k,1500) == 101
    N = read(obj, k);
    imwrite(N, ['~/Documents/mcm/frame' num2str((k-101)/1500) '.jpg']);
end
end