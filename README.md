# This script is created to read through all of the jobs that you have running in the queue and check to see if a particular job is still running. When the job is no longer present in the queueing system, you will receive a SMS message/email.
#Things to change in this script:  userID and cell phone number (to find out your sms address, google "email sms")
#Authors: David R. Stevens and Shannon Houck
#Date:  June 13, 2017
#How to run:  ./check_jobs.sh or sh check_jobs.sh
#Where to run this script:  Run this script on the cluster with the queueing system
