output "project_id" {
  description = "ID of the created project"
  value       = gitlab_project.project.id
}

output "project_path" {
  description = "Path of the repository with namespace"
  value       = gitlab_project.project.path_with_namespace
}

output "ssh_url_to_repo" {
  description = "URL that can be provided to `git clone` to clone the repository via SSH"
  value       = gitlab_project.project.ssh_url_to_repo
}

output "http_url_to_repo" {
  description = "URL that can be provided to `git clone` to clone the repository via HTTP"
  value       = gitlab_project.project.http_url_to_repo
}

output "web_url" {
  description = "URL that can be used to open the project in a browser"
  value       = gitlab_project.project.web_url
}
