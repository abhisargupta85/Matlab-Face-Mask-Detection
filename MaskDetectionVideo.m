close all;
clc;


    % Loading the trained network
    load('CNN.mat');

    cr_label = ' Face Mask Detection ';
    img_size = [227,227];
    frameCount = 0;


    FDetect = vision.CascadeObjectDetector;

    vid = VideoReader('Input/video.mp4');
    numFrames = vid.NumFrames;
  
    for i = 1:1:numFrames

        picture = read(vid,i);

        orig_picture = picture;
        BB = step(FDetect, picture);
        frameCount=frameCount+1;
        
        if size(BB,1) >= 1 % if a face is found
            for faces_iter = 1:size(BB,1) % for total number of faces found in the camera
                picture_cropped = imcrop(orig_picture,BB(faces_iter,:));
                %imshow(picture_cropped)
                picture_resized = imresize(picture_cropped,img_size);
                %imshow(picture_cropped)
                label = classify(net, picture_resized); % find out if it has mask or not
                label_text = char(label);
    
                disp(label);
               
    
                text_color = 'green';
                line_color = 'g';
                if strcmp(label_text, 'no_mask')
                    text_color = 'red';
                    line_color = 'r';
                end
                picture = insertText(picture,BB(faces_iter,1:2),label_text,'FontSize',16,'BoxColor',...
                    'white','BoxOpacity',0,'TextColor',text_color); % text label around each face
                image(picture); % show the picture
                axis off;
            end
            for faces_iter = 1:size(BB,1)  % bounding boxes around each face
                rectangle('Position', BB(faces_iter,:), 'Linewidth',2,'LineStyle','-','EdgeColor',line_color);
            end
            label = strcat(cr_label,'| Detected face(s) = ',num2str(size(BB,1)));
        else % if no face found
            image(picture); % show the picture
            picture = imresize(picture,img_size);  
            axis off
            label = strcat(cr_label,'| Detected face(s) = 0');
        end
        label_cell{1} = label;
        title(label_cell, 'FontSize', 24); % show the label    
        drawnow;

    end

