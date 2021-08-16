locals {
  profile  = var.aws_profile 
  region  = lookup(var.aws_region, terraform.workspace)
  exp_env = lookup(var.environment, terraform.workspace)
}
