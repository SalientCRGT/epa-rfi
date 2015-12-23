#!/bin/bash
#***********************************************************************
# File:    frs_file_process.sh                                         *
#                                                                      *
# This script unzips the file and moves the National Facility CSV file *
# to the data directory.                                               *
#                                                                      *
#                                                                      *
# History:                                                             *
#                                                                      *
#   Ver Name/SBC ID               Date             Description         *
#   --- ------------------------- -----------      ------------------- *
#    1  SalietCRGT Agile Team     Dec-2015         Initial Creation    *
#***********************************************************************

#***********************************************************************
# set up variables
#***********************************************************************

LOG_HOME=server/sql/data        #/logs
LOG_FILE="epa_frs_load.log"     #$LOG_HOME/
EMAIL=cwoldorf@crgt.com

vError="N"
YYYY=`date '+%Y'`
SOURCE_DATA_HOME=server/sql/data    #/src
APP_DATA_HOME=server/sql/data
ARCH_DATA_HOME=server/sql/data      #/archive
SCRIPT_HOME=server/sql
SCRIPT_NAME=dev_load_frs_state_facility.sql    #<-- change this to load_frs_national_facility.sql for Production -- dev_load_frs_national_facility.sql
ZIP_NAME=state_combined_va.zip                                      #national_combined.zip
CSV_NAME=VA_FACILITY_FILE                                           #NATIONAL_FACILITY_FILE

DONE=`date "+DATE: %m/%d/%Y% TIME: %r"`
cd $LOG_HOME
# create procedure to set up email message
EMAIL_LOG()
{
	
	DONE=`date "+DATE: %m/%d/%Y% TIME: %r"`
	echo "\nFile Process for $ZIP_NAME data file completed at $DONE" >> $LOG_FILE
	 if [ vError="Y" ]; then
	  subj="Process Failed"
	 else
	  subj="Process Successful"
	 fi
	cat $LOG_FILE | mailx -s "$subj" $EMAIL
}

DONE=`date "+DATE: %m/%d/%Y% TIME: %r"`
echo "EPA File Process Started at: $DONE" > $LOG_FILE
# Check if the zip file exists
vError="N"

if [ ! -f $ZIP_NAME ];             #$SOURCE_DATA_HOME/
 then
 	#cd $LOG_HOME
 	vError="Y"
 	echo "FRS .zip file not found in the $SOURCE_DATA_HOME, Can not start FRS File Process." >> $LOG_FILE
	echo "\nFile Process for $ZIP_NAME data file completed at $DONE" >> $LOG_FILE
	mailx -s "FRS File Process Failed !!" $EMAIL < $LOG_FILE
 	#email_log
 	exit 0
fi


echo "\nFRS .zip file found in the $SOURCE_DATA_HOME" >> $LOG_FILE
 vError="N"

 latest_zip_file=`ls -tr $ZIP_NAME | tail -1`      #$SOURCE_DATA_HOME/

echo "\nLatest FRS File is $latest_zip_file" >> $LOG_FILE

# unzipping file in source dir
unzip $ZIP_NAME $CSV_NAME.CSV

# check for the target CSV file (several are included in the zip file)
if [ ! -f $CSV_NAME.CSV ]; then    #$SOURCE_DATA_HOME/
	vError="Y"
	#cd $LOG_HOME
	echo "$CSV_NAME.CSV File missing." >> $LOG_FILE
	echo "\nFile Process for $ZIP_NAME data file completed at $DONE" >> $LOG_FILE
	mailx -s "FRS File Process Failed! Moving .zip file to $ARCH_DATA_HOME." $EMAIL < $LOG_FILE
	#mv $ZIP_NAME 	               #ARCH_DATA_HOME
	rm *.CSV                       #$SOURCE_DATA_HOME/
	exit 0
fi

echo "\n$CSV_NAME.CSV found in the $SOURCE_DATA_HOME" >> $LOG_FILE

# move the target CSV file to the data directory with lowercase extension
mv $CSV_NAME.CSV $CSV_NAME.csv                       #$APP_DATA_HOME/

echo "\n$CSV_NAME.CSV moved to $CSV_NAME.csv" >> $LOG_FILE  #$APP_DATA_HOME

latest_csv_file=`ls -tr $CSV_NAME.csv | tail -1`      #$APP_DATA_HOME/

#make sure it got moved okay
if [ ! -f $CSV_NAME.csv ];                            #$APP_DATA_HOME/
 then
	vError="Y"
	#cd $LOG_HOME
	echo "$CSV_NAME.csv not found in the $APP_DATA_HOME, Can not start FRS LOAD Process." >> $LOG_FILE
	echo "\nFile Process for $CSV_NAME.csv data file completed at $DONE" >> $LOG_FILE
	mailx -s "FRS Load Failed! Moving .zip file to $ARCH_DATA_HOME." $EMAIL < $LOG_FILE
	#mv $ZIP_NAME ../archive	       #ARCH_DATA_HOME
	rm *.CSV                       #$SOURCE_DATA_HOME/
	exit 0
fi
vError="N"

 	echo "\nStart of ARCHIVE and CLEAN UP Process" >> $LOG_FILE
 	latest_zip_file=`ls -tr $ZIP_NAME | tail -1`                 #$SOURCE_DATA_HOME/
	#mv $latest_zip_file ../archive 

	#latest_csv_file=`ls -tr $CSV_NAME.csv | tail -1`             #$APP_DATA_HOME/
	#rm $latest_csv_file                                          #$ARCH_DATA_HOME
	
	NUM=$(find $ARCH_DATA_HOME -name $ZIP_NAME -mtime +60 | wc -l)         #national_combined.zip
	echo "\nNUM : $NUM\n" >> $LOG_FILE
	if [ $NUM -gt 0 ]
		then
		echo "\nApplying 60 day - file retention policy in $ARCH_DATA_HOME :\n" >> $LOG_FILE
		echo "Following FSR CSV file(s) deleted from $ARCH_DATA_HOME\n" >> $LOG_FILE
		find $ARCH_DATA_HOME -name $ZIP_NAME -mtime +60 >> $LOG_FILE
		find $ARCH_DATA_HOME -name $ZIP_NAME -mtime +60 -exec rm -rf {} \;
	fi
 
	echo "\nEnd of ARCHIVE and CLEAN UP Process" >> $LOG_FILE
 	vError="N"
	DONE=`date "+DATE: %m/%d/%Y% TIME: %r"`
	echo "\nProcess for FSR COMPLETED AT $DONE" >> $LOG_FILE
	mailx -s "FSR Load Successful !!" $EMAIL < $LOG_FILE
 	exit 0
