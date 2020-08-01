#1. Create a directory to store IR files
workpace=$HOME/agile/workspace
workshop_directory=$workpace/smart_video_workshop
export SV=$workshop_directory/smart-video-workshop/
cd $SV/object-detection/
mkdir -p mobilenet-ssd/FP32 
#2. Navigate to the Intel® Distribution of OpenVINO™ toolkit install directory
openvino_dir=$HOME/agile/workspace/openvino
cd $openvino_dir/model-optimizer
pwd
ls $workpace/open_model_zoo/tools/downloader/public/mobilenet-ssd/mobilenet-ssd.caffemodel

python3 mo_caffe.py -h
#3. Run the Model Optimizer on the pretrained Caffe* model. This step generates one .xml file and one .bin file and place both files in the tutorial samples directory (located here: /object-detection/)
python3 mo_caffe.py \
--input_model $workpace/open_model_zoo/tools/downloader/public/mobilenet-ssd/mobilenet-ssd.caffemodel \
--output_dir $SV/object-detection/mobilenet-ssd/FP32 \
--scale 256 \
--mean_values [127,127,127]
# Note: Although this tutorial uses Single Shot MultiBox Detector (SSD) on a trained mobilenet-ssd* model, the Inference Engine is compatible with other neural network architectures, such as AlexNet*, GoogleNet*, MxNet* etc.


#The Model Optimizer converts a pretrained Caffe* model to make it compatible with the Intel Inference Engine and optimizes it for Intel® architecture. These are the files you would include with your C++ application to apply inference to visual data.

#Note: if you continue to train or make changes to the Caffe* model, you would then need to re-run the Model Optimizer on the updated model.

#4. Navigate to the tutorial sample model directory
cd $SV/object-detection/mobilenet-ssd/FP32
#5. Verify creation of the optimized model files (the IR files)
pwd
ls
#You should see the following two files listed in this directory: mobilenet-ssd.xml and mobilenet-ssd.bin