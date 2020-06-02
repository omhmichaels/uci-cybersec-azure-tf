#!/bin/bash
# Author: Michael Martin mmartin@omhm.org
PLAN_NAME=$1;

function remove_hostkeys(){
    # Remove from agent 
    ssh-add -D ~/.ssh/azure-jumpbox*;
    ssh-add -D ~/.ssh/azure-dvwa*;

    # Remove ssh keys generated
    rm ~/.ssh/azure-jumpbox*;
    rm ~/.ssh/azure-dvwa*;
}

function destroy_deploy(){
    terraform destroy;
    mv "plans/${PLAN_NAME}-LIVE" "plans/${PLAN_NAME}-DESTROYED"
}

remove_hostkeys;
destroy_deploy;