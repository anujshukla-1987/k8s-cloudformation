# Cludformation Deployment of K8S cluster


## Prerequisites
* AWS CLI installed on the local system.
* Docker
* Kubeernetes CLI



## Installing Application

* ### Deploying Cloudformation

 Checkout the root directory and make changes in below files
 * In File cloudformation_deploy.sh give the S3 bucketname where cloudformation needs to be stored.
 * In File deployment-params.json fill in the params for cloudformation.  Make sure bucket name is same as the bucketname in above file.
 * Execute cloudformation_deploy.sh from the root to start infra deployment.
   ```bash
   sh cloudformation_deploy.sh
   ```
 * Once EKS Cluster is created manually create the managed nodegroup in created cluster. Currently it is not working via cloudformation and needs to be looked at.

* ### Verifying Kubernetes cluster
 * Change the kubernetes context to point to newly created Cluster
  ```bash
  aws --region <region> eks update-kubeconfig --name <cluster-name>
  ```
* Check the nodegroups
 ```bash
 kubectl get nodes
 ```
 If we see the nodes in ready state we are good to deploy application on kubernetes.

