locals{
  dev   = var.env == "dev" ? "10" : ""
  stage = var.env == "stage" ? "20" : ""
  prod  = var.env == "prod" ? "30" : ""
  octet = coalesce(local.dev, local.stage, local.prod)
  subnet_ip = "10.0.${local.octet}.0/24"
}