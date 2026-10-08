variable "buckets_east" {
  type = map(string)
  default = {
    "backup-bucket"    = "kfieffe-backup-bucket-east"
    "terraform-bucket" = "kfieffe-terraform-bucket-east"
  }
}

variable "buckets_west" {
  type = map(string)
  default = {
    "backup-bucket"    = "kfieffe-backup-bucket-west"
    "terraform-bucket" = "kfieffe-terraform-bucket-west"
  }
}