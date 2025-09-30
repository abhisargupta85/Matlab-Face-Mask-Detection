# MATLAB Face Mask Detection using CNN

This project implements a Convolutional Neural Network (CNN) in MATLAB to detect whether a person in an image or video is wearing a face mask.

## Project Structure

* `Train.m`: Script to train the CNN model using the images in the `dataset` folder.
* `CNN.mat`: The trained model weights (saved after running `Train.m`).
* `MaskDetection.m`: Script for face mask detection on a **single image**.
* `MaskDetectionVideo.m`: Script for face mask detection on a **video** file.
* `dataset/`: Contains 60 images split into subfolders (`with_mask` and `no_mask`) for training.
* `Input/`: Contains sample images and the `video.mp4` file used for testing.

## Prerequisites

* **MATLAB** (R2018b or newer recommended)
* **Deep Learning Toolbox**
* **Computer Vision Toolbox**

## How to Run

1.  **Training (Optional):** To retrain the network, run `Train.m`. This will generate or overwrite `CNN.mat`.
2.  **Image Detection:** Ensure `CNN.mat` exists and run `MaskDetection.m`. It uses the image specified inside the script (`Input/test-3.jpg`).
3.  **Video Detection:** Ensure the `Input/video.mp4` file is present and run `MaskDetectionVideo.m`.

---
*Created by [Your Name]*
