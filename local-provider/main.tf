terraform {                                                                
  required_version = ">= 0.15"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}
 
resource "local_file" "literature" {
    filename = "testfile.txt"
    content = <<-EOT
  Hello from Terraform!
  This is a multi-line string.
  This is for a demo session
  EOT
}