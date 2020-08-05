# Install Bluecompute microservices to the cluster
ssh ocp
oc login -u admin -p passw0rd https://ocp.ibm.demo:8443
oc new-project dev
git clone https://github.com/ibm-cloud-architecture/devops-demo-mcm-ops
cd devops-demo-mcm-ops
oc apply --recursive --filename ./DEV/
cd ../
