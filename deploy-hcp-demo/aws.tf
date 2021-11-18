provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Terraform          = true
      Owner              = "jmartinson@hashicorp.com"
      se-region          = "south"
      purpose            = "demo"
      hc-internet-facing = true
      TTL                = 768
    }
  }
}