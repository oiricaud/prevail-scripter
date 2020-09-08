# Hands on Workshop Cloud Native Pipelines with Tekton
This repository contains all the necessary scripts and yaml files to complete the workshop. In this documentation you 
will find instructions you need to take to complete this lab. The lab entails of provisioning a Redhat Openshift v3.11 
Cluster with CloudPak for MultilCloud Manager v1.3, installing Kabanero 0.2 and using the custom pipelines from the
bluecompute project to deploy a microservice to Redhat Openshift.  
 

## Table of Contents
  * [Hands on Workshop Cloud Native Pipelines with Tekton](#hands-on-workshop-cloud-native-pipelines-with-tekton)
  * [Overview](#overview)
  * [Pre-requisites](#pre-requisites)
  * [Getting started](#getting-started)
  
  
# Overview

# Pre-requisites
- Redhat Openshift Cluster v3.11
- Kabanero v0.2 
- Tekton Triggers v0.2

# Getting Started
Go ahead an provision an Openshift Cluster, use the dropdown and select 4 hours as the duration of the demo.
https://www.ibm.com/cloud/garage/dte/tutorial/multi-cluster-application-management

Run these two steps first: 
```bash
ssh ocp

oc login -u admin -p passw0rd https://ocp.ibm.demo:8443
```

Run through steps until you reach "Add a Managed Cluster"

1. Install Kabanero by running the following script

    ```bash
    ./scripts/install_kabanero.sh
    ```
2. Install Tekton Triggers by running the following script
    ```bash
    ./scripts/install_tekton_triggers.sh
    ```
3. Install custom pipelines by running the following script
    ```bash
    ./scripts/install_storefront_pipelines.sh
    ```
4. Install bluecompute microservices 
    ```bash
    ./scripts/install_bluecompute_ms.sh
    ```
5. Edit your git resource and update the URL 
    ```bash
    cd ./yaml
    vim pipeline-git-resource.yaml
    ```
6. Create your pipeline resources and persistent volume 
   ```bash
    cd ./yaml
    oc project kabanero
    oc apply -f pv.yaml
    oc apply -f pipeline-image-resource.yaml
    oc apply -f pipelien-git-resource.yaml
    ```
