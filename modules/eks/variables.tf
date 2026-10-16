variable "name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the EKS cluster. Null lets EKS select its default."
  type        = string
  default     = null
  nullable    = true
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster."
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs used by the EKS control plane and managed node group."
  type        = list(string)
}

variable "cli_access_role_name" {
  description = "Name of the IAM role used for local CLI access to the EKS cluster."
  type        = string
}


# Managed Node Group variables
variable "system_ami_type" {
  description = "AMI Type for the Nodes in the Manged Node Group"
  type        = string
}

variable "workload_ami_type" {
  description = "AMI Type for the Nodes in the Manged Node Group"
  type        = string
}


variable "system_instance_types" {
  description = "List of Instance Types for the Nodes in the Manged Node Group"
  type        = list(string)
}

variable "workload_instance_types" {
  description = "List of Instance Types for the Nodes in the Manged Node Group"
  type        = list(string)
}


variable "system_min_size" {
  description = "Minimum Number of Nodes in the Manged Node Group"
  type        = number
}

variable "workload_min_size" {
  description = "Minimum Number of Nodes in the Manged Node Group"
  type        = number
}

variable "system_max_size" {
  description = "Maximum Number of Nodes in the Manged Node Group"
  type        = number
}

variable "workload_max_size" {
  description = "Maximum Number of Nodes in the Manged Node Group"
  type        = number
}


variable "system_desired_size" {
  description = "Desired Number of Nodes in the Manged Node Group"
  type        = number
}

variable "workload_desired_size" {
  description = "Desired Number of Nodes in the Manged Node Group"
  type        = number
}


variable "tags" {
  description = "Tags applied to EKS resources."
  type        = map(string)
  default     = {}
}
