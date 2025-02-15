#!/bin/bash

umask 002
# echo timestamp $(date +%s)

source $PIPELINE_HOME/tools/utils.sh

if [[ $QUEUE =~ bash ]]; then
   call_parameter $1
fi


#----------------------------------------------------------------#
#                                                     #
# INITIALIZE VARIABLES                                #
#                                                     #
#----------------------------------------------------------------#

echo "-------------------------------------------"
echo "* step8 rundge `date +%FT%H.%M.%S`"
echo "-------------------------------------------"
echo "* PIPELINE_HOME:        $PIPELINE_HOME"
echo "* DIR:                  $OUTPUT_DIR"
echo "* scRNA method:          $SCRNA_METHOD"
echo "-------------------------------------------"
echo "------Parameters used in this step---------"
cat  $OUTPUT_DIR/job_info/parameters/step8_par.txt
echo "-------------------------------------------"
echo -e "------Output of Run------------------------\n\n"
#----------------------------------------------------------------#
# START PIPELINE                                      #
#----------------------------------------------------------------#


if [[ $QUEUE =~ sbatch ]]; then
module load r/$R_VERSION 
fi


Rscript ${PIPELINE_HOME}/scrna/scripts/step8/scrna_step8_rundge.R $OUTPUT_DIR  $R_LIB_PATH $PIPELINE_HOME

