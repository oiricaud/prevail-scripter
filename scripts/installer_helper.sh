# Install Kabanero 0.2
ssh ocp
oc login -u admin -p passw0rd https://ocp.ibm.demo:8443
curl -s -O -L https://github.com/kabanero-io/kabanero-operator/releases/download/0.6.0/install.sh
chmod +xr ./install.sh
./install.sh

echo "please wait 3 minutes..."
sleep 3m # Waits 3 minutes.
echo "success installing kabanero"
oc get pods

# Install Tekton Triggers - https://github.com/tektoncd/triggers/blob/master/docs/install.md
oc create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=admin
oc new-project tekton-pipelines
oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.6.0/release.yaml

echo "please wait 1 minutes..."
sleep 1m # Waits 1 minutes.
oc get pods
echo "success installing tekton triggers"
