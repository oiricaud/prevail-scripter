# Install Storefront Pipelines for kabanero < v0.6.0
ssh ocp
oc login -u admin -p passw0rd https://ocp.ibm.demo:8443
oc project kabanero
git clone https://github.com/ibm-garage-ref-storefront/devops-pipelines
cd devops-pipelines
oc apply --recursive --filename ./devops-pipelines/pipelines/stable/storefront-springboot
