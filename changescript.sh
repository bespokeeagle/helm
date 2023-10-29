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
        TOBEPACKAGED=(`git diff --name-only origin/develop..origin/main | grep $directory/Chart.yaml |  cut -f 1 -d '/'`)
        echo "Packaging $TOBEPACKAGED"
        helm package $TOBEPACKAGED
        rm -r demo
        rm README.md
        # helm repo index --merge "index.yaml" .
       
    fi
    
    
done
# helm repo index .

