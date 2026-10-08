resource "aws_s3_bucket" "east" {
  for_each = var.buckets_east
  bucket   = each.value

  tags = {
    Name        = "${each.key}-prod-buckets"
    Environment = "prod"
  }
}

resource "aws_s3_bucket" "west" {
  provider = aws.west
  for_each = var.buckets_west
  bucket   = each.value

  tags = {
    Name        = "${each.key}-prod-bucket"
    Environment = "prod"
  }
}