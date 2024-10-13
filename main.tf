resource "google_storage_bucket" "my-bucket" {
  name                     = "demo-sona"
  project                  = "test-terraform-438504"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}


resource "google_storage_bucket" "my-bucket2" {
  name                     = "import-test-bucket-terarform"
  project                  = "test-terraform-438504"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}
