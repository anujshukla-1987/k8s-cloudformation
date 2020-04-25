#!/bin/sh

BUCKET_NAME=anujekspocbuckettest

## Creates S3 bucket
aws s3 mb s3://$BUCKET_NAME

## S3 cloudformation deployments

### Base
aws s3 cp cloudformations/amazon-eks-cluster-service-role.yaml s3://$BUCKET_NAME/amazon-eks-cluster-service-role.yaml
aws s3 cp cloudformations/amazon-eks-cluster.yaml s3://$BUCKET_NAME/amazon-eks-cluster.yaml
aws s3 cp cloudformations/amazon-eks-master-template.yaml s3://$BUCKET_NAME/amazon-eks-master-template.yaml
aws s3 cp cloudformations/amazon-eks-nodegroup.yaml s3://$BUCKET_NAME/amazon-eks-nodegroup.yaml
aws s3 cp cloudformations/amazon-eks-vpc.yaml s3://$BUCKET_NAME/amazon-eks-vpc.yaml

### Run nested cloudformation stack
aws cloudformation create-stack \
    --stack-name "stack-eks-poc" \
    --template-body file://cloudformations/amazon-eks-master-template.yaml \
    --parameters file://deployment-params.json \
    --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND

