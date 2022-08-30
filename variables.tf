variable "name" {
  description = "Name of the new project"
  type        = string
}

variable "description" {
  description = "Description of the new project"
  type        = string
  default     = null
}

variable "parent_group" {
  description = <<-EOT
  Path to the group under which the project will be created (if the project should be in a group namespace), eg `foo/bar`.
  If both `parent_group` and `parent_user` are unset, project will be created in the namespace of the user running the module.
  If both `parent_group` and `parent_user` are set, project will be created in `parent_group` namespace
  EOT
  type        = string
  default     = null
}

variable "parent_user" {
  description = <<-EOT
  Username of the user under which the project will be created (if the project should be in a user namespace). 
  If both `parent_group` and `parent_user` are unset, project will be created in the namespace of the user running the module.
  If both `parent_group` and `parent_user` are set, project will be created in `parent_group` namespace
  EOT
  type        = string
  default     = null
}

variable "visibility_level" {
  description = <<-EOT
  Visibility of the new project.
  One of: 
  * `private` - can only be cloned and viewed by project members (except for guests)
  * `internal` - can be cloned by any signed-in user except external users
  * `public` - can be cloned without any authentication over HTTPS.
  EOT
  type        = string
  default     = "private"
  validation {
    condition     = can(regex("private|internal|public", var.visibility_level))
    error_message = "The visibility_level value must be one of: private, internal or public."
  }
}

variable "topics" {
  description = "List of topics for the new project"
  type        = list(string)
  default     = null
}

variable "default_branch" {
  description = "The default branch for the new project"
  type        = string
  default     = "main"
}

variable "container_registry_enabled" {
  description = "Whether to enable container registry for the new project"
  type        = bool
  default     = true
}

variable "merge_method" {
  description = <<-EOT
  Merge method for the new project. 
  One of:
  * `merge` - Every merge creates a merge commit;
  * `rebase_merge` - Every merge creates a merge commit, Fast-forward merges only, when there is a merge conflict, the user is given the option to rebase;
  * `ff` - No merge commits are created, fast-forward merges only, when there is a merge conflict, the user is given the option to rebase.
  EOT
  type        = string
  default     = "ff"
  validation {
    condition     = can(regex("merge|rebase_merge|ff", var.merge_method))
    error_message = "The merge_method value must be one of: merge, rebase_merge or ff."
  }
}

variable "only_allow_merge_if_pipeline_succeeds" {
  description = "Whether to only allow merge if a pipeline succeeds"
  type        = bool
  default     = false
}

variable "only_allow_merge_if_all_discussions_are_resolved" {
  description = "Whether to only allow merge if all discussions are resolved"
  type        = bool
  default     = false
}

variable "initialize_with_readme" {
  description = "Whether to initialize the new project with a README file"
  type        = bool
  default     = false
}

variable "project_membership" {
  description = <<-EOT
  Map of existing users for which to give access to the new project in format `username = access_level`, eg. `john = "guest"`
  Valid access levels are: `guest`, `reporter`, `developer`, `maintainer`
  EOT
  type        = map(string)
  default     = {}
  validation {
    condition = alltrue([
      for u, m in var.project_membership : contains(["guest", "reporter", "developer", "maintainer"], m)
    ])
    error_message = "Valid access levels are: guest, reporter, developer and maintainer."
  }
}

variable "squash_option" {
  description = <<-EOT
  Squash commits when merge request. 
  One of:
  * `never` - Squashing is never performed, and the option is not displayed.;
  * `always` - Squashing is always performed. While merge requests display the option to squash, users cannot change it;
  * `default_on` - Squashing is allowed and selected by default, but can be disabled;
  * `default_off` - Squashing is allowed, but cleared by default.
  EOT
  type        = string
  default     = "default_off"
  validation {
    condition     = can(regex("never|always|default_on|default_off", var.squash_option))
    error_message = "The merge_method value must be one of: never, always, default_on or default_off."
  }
}

variable "custom_attributes" {
  description = <<-EOT
  Map of custom attributes for the project in format `key = value`, eg. `cloud = \"aws\"`.
  Available only for administrator users in self-managed installations.
  EOT
  type        = map(string)
  default     = {}
}
