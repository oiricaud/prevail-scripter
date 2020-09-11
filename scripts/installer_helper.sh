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

echo "please wait 3 minutes..."
sleep 3m # Waits 5 minutes.
echo "success installing kabanero"
oc get pods
oc adm policy add-scc-to-group privileged system:serviceaccounts:kabanero-operator
oc adm policy add-scc-to-group anyuid system:serviceaccounts:kabanero-operator

# Install Tekton Triggers - https://github.com/tektoncd/triggers/blob/master/docs/install.md
oc create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=admin
oc new-project tekton-pipelines
oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.2.0/release.yaml

echo "please wait another 3 minutes..."
sleep 3m # Waits 5 minutes.
oc get pods
echo "success installing tekton triggers"
