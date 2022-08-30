variable "gitlab_token" {}

provider "gitlab" {
  token = var.gitlab_token
}

module "simple_project" {
  source = "../.."

  name = "my-simple-project"
}
