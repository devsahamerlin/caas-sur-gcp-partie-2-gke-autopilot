export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects list --filter="$(gcloud config get-value project)" --format="value(PROJECT_NUMBER)")
export GCP_LOCATION=us-east4
export GCP_CLUSTER_NAME=drag0524sm-gke

export GOOGLE_OAUTH_ACCESS_TOKEN=$(gcloud auth print-access-token)

gcloud config set project "${PROJECT_ID}"

gcloud --project="${PROJECT_ID}" services enable \
    iamcredentials.googleapis.com \
    container.googleapis.com \
    artifactregistry.googleapis.com \
    compute.googleapis.com \
    logging.googleapis.com \
    monitoring.googleapis.com \
    stackdriver.googleapis.com

gcloud --project="${PROJECT_ID}" services enable \
    autoscaling.googleapis.com \
    cloudbuild.googleapis.com