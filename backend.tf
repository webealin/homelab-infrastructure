# backend.tf

terraform {
  backend "http" {
    address        = "https://gitlab.internal.webernet-online.de/api/v4/projects/1/terraform/state/production"
    lock_address   = "https://gitlab.internal.webernet-online.de/api/v4/projects/1/terraform/state/production/lock"
    unlock_address = "https://gitlab.internal.webernet-online.de/api/v4/projects/1/terraform/state/production/lock"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_min = 5
  }
}
