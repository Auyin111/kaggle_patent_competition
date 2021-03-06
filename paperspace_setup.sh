#!/bin/bash

echo "start to set up paperspace env"

# Update and upgrade your Ubuntu instance
yes | sudo apt update
yes | sudo apt upgrade

# Download and install NVIDIA driver
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/465.27/NVIDIA-Linux-x86_64-465.27.run
yes | sudo bash NVIDIA-Linux-x86_64-465.27.run

# install cuda
yes | sudo apt install nvidia-cuda-toolkit

# Download and install anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
yes | bash Anaconda3-2022.05-Linux-x86_64.sh -b

# create env by txt file
source anaconda3/bin/activate
yes | conda create -n patent_comp --file competition_patent_upload/linux_pantent_requirement.txt -c pytorch -c conda-forge

echo "you are ready to bash run_main.sh"