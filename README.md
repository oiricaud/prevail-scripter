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
Go ahead and provision an [Openshift Cluster 3.11](https://www.ibm.com/cloud/garage/dte/tutorial/multi-cluster-application-management),
use the dropdown and select 4 hours or 1 day as the duration of the demo.

Run through steps until you reach "Add a Managed Cluster"

0. Clone this repository on your cluster
    ```bash
   git clone https://username@github.com/Oscar-Ricaud/prevail-scripter 
   ```
1. Install the necessary resources i.e Kabanero, Tekton Triggers etc.

    ```bash
    ./scripts/installer_helper
    ```
2. Generate your base64 encoding.
    1. Obtain your github token
    2. Obtain your public/private image registry token
    3. Update the `scripts/generate_base64_encoding.py` with your credentials
        ```bash
        python ./scripts/generate_base64_encoding.py
        ```
   4. Create your secrets
       ```bash
       oc project kabanero
       oc apply --recursive --filename ./yaml/secrets
       ```
   
3. Fork this [repository](https://github.com/ibm-cloud-architecture/devops-demo-bluecompute-web) and update key URL for the `./yaml/pipeline-resources/pipeline-git-resource.yaml` 
    ```bash
    cd ./yaml/pipeline-resources
    vim pipeline-git-resource.yaml
    ```
4. Update the `./yaml/pipeline-resources-pipeline-image-resource.yaml` and include your image registry url 
    ```bash
    cd ./yaml/pipeline-resources
    vim pipeline-image-resource.yaml
    ```

5. Create your pipeline resources and persistent volume 
   ```bash
    cd ./yaml/pipeline-resources
    oc project kabanero
    oc apply -f pipeline-image-resource.yaml
    oc apply -f pipelien-git-resource.yaml
    cd ../persistent-volume
    oc apply --recursive --filename ./pipeline-resources/
    ```
6. Create a pipeline run
    ``` bash
   oc apply --recursive --filename ./yaml/pipeline-run/ 
   ```
7. Install bluecompute microservices 
    ```bash
    ./scripts/install_bluecompute_ms.sh
    ```
