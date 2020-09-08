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
