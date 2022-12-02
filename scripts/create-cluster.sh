#!/bin/bash

resourceGroup="acdnd-c4-project"
clusterName="udacity-cluster-meme"
region="westeurope"
myAcrName="myacr20221203"

# Install aks cli
echo "Installing AKS CLI"

az aks install-cli

echo "AKS CLI installed"

# Create AKS cluster
echo "Step 1 - Creating AKS cluster $clusterName"

az aks create \
    --resource-group $resourceGroup \
    --name $clusterName \
    --node-count 1 \
    --enable-addons monitoring \
    --generate-ssh-keys \
    --location $region \
    --attach-acr $myAcrName

echo "AKS cluster created: $clusterName"

# Connect to AKS cluster

echo "Step 2 - Getting AKS credentials"

az aks get-credentials \
    --resource-group $resourceGroup \
    --name $clusterName \
    --verbose

echo "Verifying connection to $clusterName"

kubectl get nodes

echo "Deploying to AKS cluster"
The command below will deploy a standard application to your AKS cluster.
kubectl apply -f ../azure-vote-all-in-one-redis.yaml

