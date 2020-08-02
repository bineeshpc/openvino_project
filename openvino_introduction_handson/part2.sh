# Part 2: Use the mobilenet-ssd* model and Inference Engine in an object detection application
# 1. Open the sample app (main.cpp) in the editor of your choice to view the lines that call the Inference Engine.
# cd /opt/intel/openvino/deployment_tools/open_model_zoo/demos/python_demos/object_detection_demo_ssd_async
# gedit object_detection_demo_ssd_async.py
# Line 107 — Creating Inference Engine
# Line 111 — Loading network
# Line 126 $ 80 — Prepare the input and output blob
# Line 140 — Read and pre-process input image
# Line 138 — Loading IR to the plugin
# Line 173 — Inference Loop and Process the output
# 2. Close the source file


machine_hostname=$(hostname)
cloud=ip-172-31-39-53
mymachine=ubuntu18

if [ $machine_hostname = $cloud ]
then
    echo "cloud"
    openvino_dir=/opt/intel/openvino
else
    echo "mymachine"
    openvino_dir=$HOME/agile/workspace/openvino
fi


workspace=$HOME/agile/workspace

workshop_directory=$workspace/smart_video_workshop
export SV=$workshop_directory/smart-video-workshop/

# 3. Source your environmental variables
# Already done on bashrc
# 4. Download the test video file to the object-detection folder.
# Put the below link in your favorite browser.

# https://pixabay.com/en/videos/download/video-1900_source.mp4?attachment
# Cars - 1900.mp4 file will get downloaded. Put that file in the $SV/object-detection folder.

# mv ~/Downloads/Cars\ -\ 1900.mp4 .
# 5. Run the sample application to use the Inference Engine on the test video
# The below command runs the application
# cd $workspace/open_model_zoo/demos/python_demos/object_detection_demo_ssd_async

echo "here"
echo $SV
ls $SV
ls $SV/object-detection
# cp $HOME/Downloads/Cars-1900.mp4 $SV/object-detection/Cars-1900.mp4
ls $SV/object-detection/Cars-1900.mp4
ls $SV/object-detection/mobilenet-ssd/FP32/mobilenet-ssd.xml
 
python3 $openvino_dir/deployment_tools/open_model_zoo/demos/python_demos/object_detection_demo_ssd_async/object_detection_demo_ssd_async.py \
-i $SV/object-detection/Cars-1900.mp4 \
-m $SV/object-detection/mobilenet-ssd/FP32/mobilenet-ssd.xml 
# Note: If you get an error related to "undefined reference to 'google::FlagRegisterer...", try uninstalling libgflags-dev: sudo apt-get remove libgflags-dev

# Here are the parameters used in the above command to run the application:
# usage: object_detection_demo_ssd_async.py [-h] -m MODEL -i INPUT
# 					  [-l CPU_EXTENSION] [-d DEVICE]
# 					  [--labels LABELS]
# 					  [-pt PROB_THRESHOLD] [--no_show]
# 					  [-u UTILIZATION_MONITORS]

# Options:
#   -h, --help            Show this help message and exit.
#   -m MODEL, --model MODEL
# 			Required. Path to an .xml file with a trained model.
#   -i INPUT, --input INPUT
# 			Required. Path to video file or image. 'cam' for
# 			capturing video stream from camera
#   -l CPU_EXTENSION, --cpu_extension CPU_EXTENSION
# 			Optional. Required for CPU custom layers. Absolute
# 			path to a shared library with the kernels
# 			implementations.
#   -d DEVICE, --device DEVICE
# 			Optional. Specify the target device to infer on; CPU,
# 			GPU, FPGA, HDDL or MYRIAD is acceptable. The demo will
# 			look for a suitable plugin for device specified.
# 			Default value is CPU
#   --labels LABELS       Optional. Path to labels mapping file
#   -pt PROB_THRESHOLD, --prob_threshold PROB_THRESHOLD
# 			Optional. Probability threshold for detections
# 			filtering
#   --no_show             Optional. Don't show output
#   -u UTILIZATION_MONITORS, --utilization_monitors UTILIZATION_MONITORS
# 			Optional. List of monitors to show initially.
