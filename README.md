# UCI AZURE TERRAFORM BASE

## USAGE

***THE CLONED REPO FOLDER IS THE PROJECT ROOT. TO BUILD AND DEPLOY THIS PROJECT DO THE FOLLOWING**:

***CLONE REPO***
```
    git clone https://github.com/omhmichaels/uci-cybersec-azure-tf.git
```

***IMPORTANT: CD TO REPO***
```
    cd uci-cybersec-azure-tf
```

***CHANGE PERMS FOR SCRIPTS***
```
    chmod 755 bin/build.sh
    chmod 755 bin/destroy.sh
``` 

***BUILD***
```
    # Try to run macos style if not use foolproof method :p
    bin/build.sh || sudo -H -u ${USER} bash bin/build.sh
```

***DESTROY**
```
    # Run Destroyer script to clean up generated ssh_keys and tear down terraform
    bin/destroy.sh || sudo -H -u ${USER} bash bin/destroy.sh
```

## CONFIGURABLE VARIABLES
* **You may change any variables in terraform.tfvars marked *Configurable*.**
* **DO NOT CHANGE ANY OTHERS WITHOUT KNOWING EXACTLY WHAT YOUR DOING**
    - *ANY CHANGES MAY BREAK YOUR CONFIGURATION IN UNEXPECTED WAYS.*
* **DO NOT CHANGE ANY CODE AFTER DEPLOYING  WITHOUT KNOWING EXACTLY WHAT YOUR DOING**
    - Terraform tracks state and by changing the state of the local files while its deployed your ferk up terras ability to manage the cloud resources. I.E: Youll prolly ferk it up.
