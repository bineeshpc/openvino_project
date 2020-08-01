workshop_directory=$HOME/agile/workspace/smart_video_workshop
mkdir -p $workshop_directory
# sudo chown username.username -R /opt/intel/workshop/
cd $workshop_directory
git clone https://github.com/intel-iot-devkit/smart-video-workshop.git
export SV=$workshop_directory/smart-video-workshop/