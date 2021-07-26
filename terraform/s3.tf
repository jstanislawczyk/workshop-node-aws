resource "aws_s3_bucket" "data_lake" {
  bucket = "${local.environment}-bucket"
}
