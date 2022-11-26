resource "aws_s3_bucket" "lifecycle" {
  bucket = "curso-terraform-carlossilva-bucket-lifecycle-2"

  lifecycle {
    #create_before_destroy = true
    #prevent_destroy = true
    ignore_changes = [tags]
  }

  tags = {
    aulas = "lifecycle"
  }
}