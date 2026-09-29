provider "aws" {
  alias  = "dev"
  region = "us-east-1"

}

provider "aws" {
  alias  = "prod"
  region = "us-weast-1"

}

resource "aws_s3_bucket" "dev_bucket" {
  provider = aws.dev
  bucket   = "my-dev-bucket"

}

resource "aws_s3_bucket" "prod_bucket" {
  provider = aws.prod
  bucket   = "my-prod-bucket"

}
