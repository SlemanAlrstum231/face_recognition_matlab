function preprocess(img)
FaceDetect = vision.CascadeObjectDetector;
FaceDetect.MergeThreshold = 7 ;
BB = step(FaceDetect, img);
if(size(BB,1)>0)
J = imcrop(img, BB(1, :));
else
    J=img;
end
save image.mat J;