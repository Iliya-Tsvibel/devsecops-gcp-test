variable "project_id" { type = string }
variable "region" { type = string }
variable "tf_state_bucket" { type = string }

variable "network_name" { type = string }
variable "subnet_name" { type = string }
variable "ip_cidr_range" { type = string }

variable "service_name" { type = string }
variable "image" { type = string }
variable "runtime_sa" { type = string }

variable "app_bucket_name" { type = string }

variable "app_secret_id" { type = string }
variable "app_secret_value" { type = string }
