resource "google_storage_bucket" "my-bucket" {
  name                     = "sona-demogcp789"
  project                  = "test-terraform-438504"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
  depends_on = [google_storage_bucket.my-demobucket]
}

resource "google_storage_bucket" "my-demobucket" {
  name                     = "sona-demogcp978"
  project                  = "test-terraform-438504"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}
