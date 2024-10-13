resource "google_storage_bucket" "my-bucket" {
  name                     = "demo-sona"
  project                  = "test-terraform-438504"
  location                 = "US"

}


resource "google_storage_bucket" "my-bucket25" {
  name                     = "import-test-bucket-terarform"
  project                  = "test-terraform-438504"
  location                 = "US"
}
