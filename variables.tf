variable "client_id" {
  type      = string
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "org_id" {
  type      = string
}

variable "project_id" {
  type      = string
}