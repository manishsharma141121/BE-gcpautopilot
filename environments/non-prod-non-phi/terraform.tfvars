# GCP Project and Region
project_id = "Poject-ID"
region     = "us-central1"

# GKE Cluster
cluster_name           = "nonprod-nonphi"
network                = "default"
subnetwork             = "default"
authorized_network     = "0.0.0.0/0"
master_ipv4_cidr_block = "10.0.0.0/28"  # Adjust this as necessary

# Kubernetes Namespaces and Ingress Configuration
namespaces           = ["dev", "alpha","master"]  # Replace with your namespaces
ingress_service_name = "dev"  # Replace with your service name
ingress_service_port = 80  # Replace with your service port

# Network Policies
internal_cidrs = ["10.0.0.0/24", "10.1.0.0/24"]  # Replace with your internal CIDRs
#ensure no white spaces
allowed_cidrs   = ["0.0.0.0/0", "103.22.140.161/32"]  # Replace with your allowed CIDR

#Registry 
repository_name = "nonprod-nonphi"
artifact_viewer_member = "project@gserviceaccount.com"

#MySQL

  db_version               = "MYSQL_8_0"
  db_tier                  = "db-f1-micro"
  database_name            = "my_database"
  db_username              = "admin"
  allowed_consumer_projects = ["inspired-goal-432411-p0"]

#Instance
  instance_name = "dev"


# HA
read_replica_regions    = ["us-east1","us-west1"]

# Backup configuration
backup_configuration = {
  enabled                         = true
  start_time                      = "03:00"
  binary_log_enabled              = true
  point_in_time_recovery_enabled  = true
}

# Edition
edition = "ENTERPRISE_PLUS"

# Data Cache