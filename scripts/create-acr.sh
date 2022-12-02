resourceGroup="acdnd-c4-project"
region="southeastasia"
myAcrName="myacr20221203"
clusterName="udacity-cluster-meme"

az acr create --resource-group $resourceGroup --name $myAcrName --sku Basic

az acr login --name $myAcrName

az acr show --name $myAcrName --query loginServer --output table

docker tag azure-vote-front:v1 myacr20221203.azurecr.io/azure-vote-front:v1

docker push myacr20221203.azurecr.io/azure-vote-front:v1

az acr repository list --name myacr20221203 --output table

