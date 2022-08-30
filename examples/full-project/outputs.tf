output "project_id" {
  description = "ID of the created project"
  value       = module.full_project.project_id
}

output "project_path" {
  description = "Path of the repository with namespace"
  value       = module.full_project.project_path
}

output "ssh_url_to_repo" {
  description = "URL that can be provided to `git clone` to clone the repository via SSH"
  value       = module.full_project.ssh_url_to_repo
}

output "http_url_to_repo" {
  description = "URL that can be provided to `git clone` to clone the repository via HTTP"
  value       = module.full_project.http_url_to_repo
}

output "web_url" {
  description = "URL that can be used to open the project in a browser"
  value       = module.full_project.web_url
}
