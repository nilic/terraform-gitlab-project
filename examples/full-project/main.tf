variable "gitlab_token" {}

provider "gitlab" {
  token = var.gitlab_token
}

module "full_project" {
  source = "../.."

  name                                             = "my-full-project"
  description                                      = "My GitLab project created by Terraform"
  parent_group                                     = "foobarbaz"
  visibility_level                                 = "private"
  topics                                           = ["terraform", "gitlab"]
  default_branch                                   = "main"
  container_registry_enabled                       = false
  merge_method                                     = "ff"
  only_allow_merge_if_pipeline_succeeds            = false
  only_allow_merge_if_all_discussions_are_resolved = false
  initialize_with_readme                           = false
  squash_option                                    = "default_off"
  project_membership = {
    harry123 = "developer"
    ron456   = "maintainer"
  }
}
