variable "app_port" {
  type = number
  default = 8090
}

variable "github_app_installation_id" {}
variable "project" {}
variable "project_number" {}
variable "svc_acct_key_file" {}

variable "region" {
  type    = string
  default = "us-central1"
}