variable "gcp_project_id" {
  description = "Enter the project id of the gcp project where the cluster will be registered."
  type        = string
}

variable "name_prefix" {
  description = "Prefix to apply to all artifacts created."
  type        = string
}

variable "gcp_ip_cidr_range" {
  default = "192.168.1.0/24"
}

variable "gcp_location" {
  description = "GCP location to deploy to"
  type        = string
}