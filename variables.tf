variable "firewall_name" {}
variable "firewall_port" {}
variable "firewall_target_tag" {}

variable "github_access_token_data" {}
variable "github_app_installation_id" {}

variable "gcp_project_id" {}
variable "gcp_project_number" {}
variable "gcp_svc_acct_key_file" {}

variable "gcp_region" {
  type    = string
  default = "us-central1"
}