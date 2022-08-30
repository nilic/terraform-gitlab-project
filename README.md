## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | ~> 3.16.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | ~> 3.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_project.project](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project) | resource |
| [gitlab_project_custom_attribute.custom_attributes](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_custom_attribute) | resource |
| [gitlab_project_membership.project_membership](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_membership) | resource |
| [gitlab_group.parent_group](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/data-sources/group) | data source |
| [gitlab_user.member_users](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/data-sources/user) | data source |
| [gitlab_user.parent_user](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_registry_enabled"></a> [container\_registry\_enabled](#input\_container\_registry\_enabled) | Whether to enable container registry for the new project | `bool` | `true` | no |
| <a name="input_custom_attributes"></a> [custom\_attributes](#input\_custom\_attributes) | Map of custom attributes for the project in format `key = value`, eg. `cloud = \"aws\"`.<br>Available only for administrator users in self-managed installations. | `map(string)` | `{}` | no |
| <a name="input_default_branch"></a> [default\_branch](#input\_default\_branch) | The default branch for the new project | `string` | `"main"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the new project | `string` | `null` | no |
| <a name="input_initialize_with_readme"></a> [initialize\_with\_readme](#input\_initialize\_with\_readme) | Whether to initialize the new project with a README file | `bool` | `false` | no |
| <a name="input_merge_method"></a> [merge\_method](#input\_merge\_method) | Merge method for the new project. <br>One of:<br>* `merge` - Every merge creates a merge commit;<br>* `rebase_merge` - Every merge creates a merge commit, Fast-forward merges only, when there is a merge conflict, the user is given the option to rebase;<br>* `ff` - No merge commits are created, fast-forward merges only, when there is a merge conflict, the user is given the option to rebase. | `string` | `"ff"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the new project | `string` | n/a | yes |
| <a name="input_only_allow_merge_if_all_discussions_are_resolved"></a> [only\_allow\_merge\_if\_all\_discussions\_are\_resolved](#input\_only\_allow\_merge\_if\_all\_discussions\_are\_resolved) | Whether to only allow merge if all discussions are resolved | `bool` | `false` | no |
| <a name="input_only_allow_merge_if_pipeline_succeeds"></a> [only\_allow\_merge\_if\_pipeline\_succeeds](#input\_only\_allow\_merge\_if\_pipeline\_succeeds) | Whether to only allow merge if a pipeline succeeds | `bool` | `false` | no |
| <a name="input_parent_group"></a> [parent\_group](#input\_parent\_group) | Path to the group under which the project will be created (if the project should be in a group namespace), eg `foo/bar`.<br>If both `parent_group` and `parent_user` are unset, project will be created in the namespace of the user running the module.<br>If both `parent_group` and `parent_user` are set, project will be created in `parent_group` namespace | `string` | `null` | no |
| <a name="input_parent_user"></a> [parent\_user](#input\_parent\_user) | Username of the user under which the project will be created (if the project should be in a user namespace). <br>If both `parent_group` and `parent_user` are unset, project will be created in the namespace of the user running the module.<br>If both `parent_group` and `parent_user` are set, project will be created in `parent_group` namespace | `string` | `null` | no |
| <a name="input_project_membership"></a> [project\_membership](#input\_project\_membership) | Map of existing users for which to give access to the new project in format `username = access_level`, eg. `john = "guest"`<br>Valid access levels are: `guest`, `reporter`, `developer`, `maintainer` | `map(string)` | `{}` | no |
| <a name="input_squash_option"></a> [squash\_option](#input\_squash\_option) | Squash commits when merge request. <br>One of:<br>* `never` - Squashing is never performed, and the option is not displayed.;<br>* `always` - Squashing is always performed. While merge requests display the option to squash, users cannot change it;<br>* `default_on` - Squashing is allowed and selected by default, but can be disabled;<br>* `default_off` - Squashing is allowed, but cleared by default. | `string` | `"default_off"` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | List of topics for the new project | `list(string)` | `null` | no |
| <a name="input_visibility_level"></a> [visibility\_level](#input\_visibility\_level) | Visibility of the new project.<br>One of: <br>* `private` - can only be cloned and viewed by project members (except for guests)<br>* `internal` - can be cloned by any signed-in user except external users<br>* `public` - can be cloned without any authentication over HTTPS. | `string` | `"private"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_http_url_to_repo"></a> [http\_url\_to\_repo](#output\_http\_url\_to\_repo) | URL that can be provided to `git clone` to clone the repository via HTTP |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | ID of the created project |
| <a name="output_project_path"></a> [project\_path](#output\_project\_path) | Path of the repository with namespace |
| <a name="output_ssh_url_to_repo"></a> [ssh\_url\_to\_repo](#output\_ssh\_url\_to\_repo) | URL that can be provided to `git clone` to clone the repository via SSH |
| <a name="output_web_url"></a> [web\_url](#output\_web\_url) | URL that can be used to open the project in a browser |
