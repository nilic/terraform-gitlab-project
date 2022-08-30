terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 3.16.0"
    }
  }
  required_version = ">= 1.0.0"
}
