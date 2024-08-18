terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 4.0.0"
      configuration_aliases = [aws.us-east-1, aws.lightsail]
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = ">= 1.11.0"
    }
  }
}
