terraform {
  backend "s3" {
    bucket = "s3-terraform-statefile-zaktest"
    key    = "s3/dev"
    region = "af-south-1"
  }
}
