#! /bin/bash
### This script lists the directories where the chart.yaml has changed. These are the only charts that will be packaged.
dir=(`ls`)
filecheck=(`git diff --name-only`)
echo "${dir[*]}"
for directory in "${dir[@]}"
do
    if [ -d $directory ]
    then
        echo "i am a $directory directory"
        echo "1 $GITHUB_REF_NAME 2 $GITHUB_HEAD_REF 3 $GITHUB_BASE_REF	"
        TOBEPACKAGED=(`git diff --name-only origin/$GITHUB_HEAD_REF..origin/$GITHUB_BASE_REF| grep $directory/Chart.yaml |  cut -f 1 -d '/'`)
        echo "Packaging $TOBEPACKAGED"
        helm package $TOBEPACKAGED
        rm -r demo
        # helm repo index --merge "index.yaml" .
       
    fi
    
    
done
# helm repo index .

