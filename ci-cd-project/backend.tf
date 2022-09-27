# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket  = "project2-ci-cd-terraform-state"
    key     = "ci-cd-project.tfstate"
    region  = "eu-west-2"
  }
}
