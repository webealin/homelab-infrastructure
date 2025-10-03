# modules/terraform-access-token/variables.tf

variable "terraform_role_id" {
  description = "Terraform Role ID"
  type        = string
  default     = "Terraform"
}

variable "terraform_username" {
  description = "Name of Terraform User"
  type        = string
  default     = "svcterraform"
}

variable "terraform_user_comment" {
  description = "Comment for Terraform User"
  type        = string
  default     = "Terraform Service Account"
}

variable "terraform_token_name" {
  description = "Name of Terraform Token"
  type        = string
  default     = "terraform"
}

variable "terraform_token_comment" {
  description = "Comment for Terraform Token"
  type        = string
  default     = "Terraform Access Token"
}

variable "terraform_token_expiration" {
  description = "Terraform Token Expiration Date"
  type        = string
  default     = "2035-01-01T00:00:00Z"
}
