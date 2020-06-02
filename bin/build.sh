#!/bin/bash
# Author: Michael Martin mmartin@omhm.org
#!/bin/bash
# Author: Michael Martin mmartin@omhm.org
PLAN_NAME=${1:- "tf_plan"}
OUTPUT_PATH="plans/${PLAN_NAME}"
PREBUILD_PLANOUT="${OUTPUT_PATH}-PREBUILD"
LIVE_PLANOUT="${OUTPUT_PATH}-LIVE"

### PREBUILD ###
function prebuild(){
    # Test for ssh directory and create if needed
    ls ~/.ssh/ 2> /dev/null  || mkdir ~/.ssh/ 

    # If the ~/.ssh/id_rsa file doesnt exist create it
    cat /dev/zero | ssh-keygen -q -N "" ;

    # Create key for jumpbox
    cat /dev/zero | ssh-keygen -t rsa -b 4096 -f ~/.ssh/azure-jumpbox -q -N "";

    # Add Key to Agent
    ssh-add -K ~/.ssh/azure-jumpbox

    # Create key for DVWA
    cat /dev/zero | ssh-keygen -t rsa -b 4096 -f ~/.ssh/azure-dvwa  -q -N "";

    # Add Key to Agent 
    ssh-add -K ~/.ssh/azure-dvwa  

    ### Terraform Prebuild ###
    # Initialize Terraform
    terraform init;

    # Validate Terraform
    terraform validate;

    # Test for plans dir
    ls plans/ 2> /dev/null  || mkdir plans/ ;

    # Generate Terraform Plan &  Generate Plan Diagram 
    terraform plan -out="${PREBUILD_PLANOUT}"; 


    # Test for plans directory and create if needed
    ls plans/ 2> /dev/null  || mkdir plans/ ;

    # Create dot file 
    terraform graph > "${PREBUILD_PLANOUT}.dot";

    # Create Diagram
    #dot -Tpng temp.dot -o "${PREBUILD_PLANOUT}.png";

}

#### BUILD #####
function build(){
    # Apply terraform plan
    terraform apply "${PREBUILD_PLANOUT}";
}

### EPILOGUE ###
function epilogue(){
    # Get Current TF State
    terraform show > "${LIVE_PLANOUT}"
    
    # Create dot file 
    terraform graph > "${LIVE_PLANOUT}.dot";

    # Create Diagram
    #dot -Tpng temp.dot -o "${LIVE_PLANOUT}.png";
}


prebuild && build && epilogue;
