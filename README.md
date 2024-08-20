# terraform-demo

Simple Terraform modules to create & manage the GCP resources needed for [cloud-build-demo](https://github.com/rebeid/cloud-build-demo)

```
🪴 tree . | egrep -v 'tfplan|tfstate|tfvars|json|txt|files'
.
├── README.md
├── environments
│   ├── dev
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   └── prod
│       ├── main.tf
│       ├── outputs.tf
│       ├── variables.tf
│       └── versions.tf
├── main.tf
├── modules
│   ├── cloud_deploy_target
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── cloudbuild
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── clouddeploy
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── docker_repo
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── firewall
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── github_repo
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── gke
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
├── variables.tf
└── versions.tf
```
