/**
  * # Terraform module for GitLab project creation
  *
  * This module allows for creating a GitLab project via Terraform.
  *
  * Additionally, various project settings can be defined such as user membership, merge method, container registry, squash options etc.
  */

data "gitlab_group" "parent_group" {
  count     = var.parent_group != null ? 1 : 0
  full_path = var.parent_group
}

data "gitlab_user" "parent_user" {
  count    = var.parent_user != null ? 1 : 0
  username = var.parent_user
}

data "gitlab_user" "member_users" {
  for_each = var.project_membership
  username = each.key
}

resource "gitlab_project" "project" {
  name                                             = var.name
  description                                      = var.description
  namespace_id                                     = var.parent_group != null ? data.gitlab_group.parent_group[0].id : (var.parent_user != null ? data.gitlab_user.parent_user[0].id : null)
  visibility_level                                 = var.visibility_level
  topics                                           = var.topics
  default_branch                                   = var.default_branch
  container_registry_enabled                       = var.container_registry_enabled
  merge_method                                     = var.merge_method
  only_allow_merge_if_pipeline_succeeds            = var.only_allow_merge_if_pipeline_succeeds
  only_allow_merge_if_all_discussions_are_resolved = var.only_allow_merge_if_all_discussions_are_resolved
  initialize_with_readme                           = var.initialize_with_readme
  squash_option                                    = var.squash_option
}

resource "gitlab_project_membership" "project_membership" {
  for_each = var.project_membership

  project_id   = gitlab_project.project.id
  user_id      = data.gitlab_user.member_users[each.key].id
  access_level = each.value
}

resource "gitlab_project_custom_attribute" "custom_attributes" {
  for_each = var.custom_attributes

  project = gitlab_project.project.id
  key     = each.key
  value   = each.value
}
