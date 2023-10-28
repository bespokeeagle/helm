#! /bin/bash
### This script lists the directories where the chart.yaml has changed. These are the only charts that will be packaged.
dir=(`git diff --name-only)
echo $dir