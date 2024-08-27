# Define the GKE module

module "gke" {
  source                 = "../modules/BE_gke"
  project_id             = var.project_id
  region                 = var.region
  cluster_name           = var.cluster_name
  network                = var.network
  subnetwork             = var.subnetwork
  authorized_network     = var.authorized_network
  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  namespace              = var.namespace 
  pd_name                = var.pd_name # or leave it empty to use the default naming convention
  storage_class_name     = var.storage_class_name

}


# Define the Kubernetes provider using outputs from the GKE module
provider "kubernetes" {
  host                   = "https://${module.gke.cluster_endpoint}"
  token                  = module.gke.access_token
  cluster_ca_certificate = base64decode(module.gke.cluster_ca_certificate)
}

# Outputs
output "cluster_location" {
  value = module.gke.cluster_location
}

module "namespace" {
  source                 = "../modules/namespaces"
  namespaces             = var.namespaces
  ingress_service_name   = var.ingress_service_name
  ingress_service_port   = var.ingress_service_port
  internal_cidrs         = var.internal_cidrs
  allowed_cidrs           = var.allowed_cidrs
}

# Call the HA Cloud SQL instance module

module "ha_cloud_sql_instance" {
  source = "../../modules/cloudsql_ha"

  project_id                = var.project_id
  region                    = var.region
  db_version                = var.db_version
  db_tier                   = var.db_tier
  instance_name             = var.instance_name
  allowed_consumer_projects = var.allowed_consumer_projects
  read_replica_regions      = var.read_replica_regions

  # Backup configuration
  backup_configuration = var.backup_configuration

  # Edition (set to "ENTERPRISE_PLUS" in your variables.tf)
  edition = var.edition
}