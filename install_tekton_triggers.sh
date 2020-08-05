# Install Tekton Triggers - https://github.com/tektoncd/triggers/blob/master/docs/install.md
ssh ocp
oc login -u admin -p passw0rd https://ocp.ibm.demo:8443
oc create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=admin
oc new-project tekton-pipelines
oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.2.0/release.yaml

