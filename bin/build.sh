#!/bin/bash
# Author: Michael Martin mmartin@omhm.org
PLAN_NAME=${1:-"tf_plan"}
TF_OUTPUT_PATH="plans/${PLAN_NAME}"
TF_PREBUILD_PLANOUT="${TF_OUTPUT_PATH}-PREBUILD"
TF_LIVE_PLANOUT="${TF_OUTPUT_PATH}-LIVE" 

#### BUILD #####
function build(){
    # Apply terraform plan
    terraform apply "${TF_PREBUILD_PLANOUT}";
}

### EPILOGUE ###
function epilogue(){
    # Get Current TF State
    terraform show > "${TF_LIVE_PLANOUT}"
    
    # Create dot file 
    terraform graph > "${TF_LIVE_PLANOUT}.dot";

    # Create Diagram
    #dot -Tpng temp.dot -o "${TF_LIVE_PLANOUT}.png";
}


build && epilogue;
