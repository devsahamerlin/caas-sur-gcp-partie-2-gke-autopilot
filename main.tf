module "gcp-vpc" {
  source        = "./modules/gcp/vpc"
  ip_cidr_range = var.gcp_ip_cidr_range
  name          = var.name_prefix
  region        = var.gcp_location
}

resource "google_service_account" "terraform_sa" {
  project      = var.gcp_project_id
  for_each     = local.services_account
  account_id   = each.value["account_id"]
  display_name = each.value["display_name"]
}

resource "google_project_iam_member" "terraform_sa_roles" {
  depends_on = [google_service_account.terraform_sa]
  for_each   = { for idx, sa in local.sa_flattened : "${sa["account_id"]}_${sa["role"]}" => sa }
  project    = var.gcp_project_id
  role       = each.value["role"]
  member     = "serviceAccount:${each.value["account_id"]}@${var.gcp_project_id}.iam.gserviceaccount.com"
}

##### GCP #######

##### Public GKE autopilot ######

module "autopilot-gke" {
  source     = "./modules/gcp/gke-auto"
  name       = "${local.name_prefix}-gke"
  region     = var.gcp_location
  vpc_network = module.gcp-vpc.vpc_network_name
  vpc_subnetwork = module.gcp-vpc.vpc_subnetwork_name
  deletion_protection = false
}