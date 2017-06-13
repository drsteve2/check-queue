#!/bin/bash
#This script is created to read through all of the jobs that you have running in the queue and check to see if a particular job is still running. When the job is no longer present in the queueing system, you will receive a SMS message/email.
#Things to change in this script:  userID and cell phone number (to find out your sms address, google "email sms")
#Authors: David R. Stevens and Shannon Houck
#Date:  June 13, 2017
#How to run:  ./check_jobs.sh or sh check_jobs.sh
#Where to run this script:  Run this script on the cluster with the queueing system


echo -n "Please enter a job ID: (Example: 9690233)    "
read job

userID=drsteve2 #Update this with your User ID
finished=false

while finished=false
do
#echo $finished
squeue -u $userID -o %A  > jobs_running.txt #Squeue is for the Slurm queueing system, you can use 'qstat'

sed -i '1d' jobs_running.txt

declare -i PID


result=$(grep "$job" "jobs_running.txt")
#echo $result

        if [[ -z $result ]]
        then
                finished=true
                echo "PID is not found"
                break
        else
                finished=false
                echo "PID is found"
        fi


#echo $finished
echo "Your job is still running"
sleep 20m   #Check your jobs every 20 minutes
done

echo "Your job has completed" | mailx -s "Your job is completed" '1234567890@vtext.com'  #Update this with your cell number
