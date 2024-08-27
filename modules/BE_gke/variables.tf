variable "project_id" {
  description = "The project ID to deploy the GKE cluster"
  type        = string
}

variable "region" {
  description = "The region where the GKE cluster will be deployed"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "network" {
  description = "The network to which the GKE cluster will be connected"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to which the GKE cluster will be connected"
  type        = string
}

variable "authorized_network" {
  description = "The CIDR block authorized to access the cluster's control plane"
  type        = string
}

variable "master_ipv4_cidr_block" {
  description = "The CIDR block for the master network in the GKE cluster"
  type        = string
}

variable "namespace" {
  description = "The namespace identifier to prefix the PV name and disk name."
  type        = string
}

variable "pd_name" {
  description = "The name of the GCE Persistent Disk to be used for the Persistent Volume."
  type        = string
  default     = "" # Optional: Set a default if applicable, or require it explicitly.
}

variable "storage_class_name" {
  description = "The StorageClass to be used by the Persistent Volume."
  type        = string
  default     = "standard"  # You can change the default to your preferred StorageClass.
}

