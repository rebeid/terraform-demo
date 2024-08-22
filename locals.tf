locals {
  target_environments = toset([
    "dev",
    "stage",
    "prod",
  ])
}