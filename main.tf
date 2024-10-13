resource "google_storage_bucket" "my-bucket" {
  name                     = "sona-demo-gcpdemo13"
  project                  = "test-terraform-438504"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}
