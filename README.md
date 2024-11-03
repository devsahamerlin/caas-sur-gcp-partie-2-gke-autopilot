## CaaS On GCP with Cloud Run, GKE(Public and Private, Autopilot and Standard), Anthos Multi-cloud on GCP and AWS using Terraform
## Partie 2 - GKE Autopilot Video https://youtu.be/Ij-BywNnjV0
### Prerequisites
#### GCP

```shell
git clone https://github.com/devsahamerlin/caas-sur-gcp-partie-2-gke-autopilot.git
cd ~/caas-sur-gcp-partie-2-gke-autopilot

export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects list --filter="$(gcloud config get-value project)" --format="value(PROJECT_NUMBER)")
export GCP_LOCATION=us-east4
export GCP_CLUSTER_NAME=drag0524sm-gke

sudo chmod +x requirements.sh
./requirements.sh
```

## Public Auto-pilot GKE

![Public-GKE-Autopilot.svg](images%2FPublic-GKE-Autopilot.svg)

```shell

terraform init
terraform plan -var-file=terraform-demo.tfvars
terraform apply -var-file=terraform-demo.tfvars --auto-approve

gcloud container clusters get-credentials $GCP_CLUSTER_NAME --location $GCP_LOCATION --project $PROJECT_ID
kubectl get nodes

```

#### Deploy E-Commerce Microservices on Public GKE Auto-pilot

![microservices-architecture-diagram.png](images%2Fmicroservices-architecture-diagram.png)


```shell
kubectl apply -f ./microservices-demo/ecommerce/manifests/kubernetes-manifests.yaml

kubectl get pods

kubectl get services

kubectl get service frontend-external | awk '{print $4}'

# Delete resources add the end
kubectl delete -f ./microservices-demo/ecommerce/manifests/kubernetes-manifests.yaml
```