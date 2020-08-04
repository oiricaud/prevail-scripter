# Install Bluecompute microservices to the cluster
git clone https://github.com/ibm-cloud-architecture/devops-demo-mcm-ops
oc new-project dev
cd devops-demo-mcm-ops
oc apply --recursive --filename ./DEV/

# Install Kabanero 0.2
ssh ocp
oc login -u admin -p passw0rd https://ocp.ibm.demo:8443
git clone https://github.com/kabanero-io/kabanero-foundation.git
cd kabanero-foundation
git fetch --all
git checkout 0.2.0
cd scripts/
openshift_master_default_subdomain=ibm.demo ./install-kabanero-foundation.sh
oc apply -n kabanero -f https://raw.githubusercontent.com/kabanero-io/kabanero-operator/0.2.0/config/samples/default.yaml

# Install Tekton Triggers - https://github.com/tektoncd/triggers/blob/master/docs/install.md
oc create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=admin
oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.2.0/release.yaml

# Install Storefront Pipelines for kabanero < v0.6.0
git clone https://github.com/ibm-garage-ref-storefront/devops-pipelines
cd devops-pipelines
oc apply --recursive --filename ./devops-pipelines/pipelines/stable/storefront-springboot

## now validate the pipeline
