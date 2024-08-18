# terraform-demo

Simple Terraform modules to create & manage all the resources for [cloud-build-demo](https://github.com/rebeid/cloud-build-demo) to work

```
🪴 tree | egrep -v 'tfplan|tfstate|tfvars|json|txt|files'
.
├── README.md
├── main.tf
├── modules
│   ├── cloudbuild
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── firewall
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── github_repo
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
├── variables.tf
└── versions.tf
```
