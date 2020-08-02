
machine_hostname=$(hostname)
cloud=ip-172-31-39-53
mymachine=ubuntu18

if [ $machine_hostname = $cloud ]
then
    echo "cloud"
    openvino_dir=/opt/intel/openvino
    downloader_dir=$openvino_dir/deployment_tools/open_model_zoo/tools/downloader
else
    echo "mymachine"
    openvino_dir=$HOME/agile/workspace/openvino
fi

cd $downloader_dir

sudo ./downloader.py --name mobilenet-ssd
