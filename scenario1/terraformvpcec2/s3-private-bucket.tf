#
# Private Bucket
#

resource "aws_s3_bucket" "s3_private" {
  bucket_prefix = var.open_bucket_prefix
  acl           = "private"
  region        = var.aws_region
  }
}

resource "aws_s3_bucket_policy" "s3_private" {
  bucket = "${aws_s3_bucket.s3_private.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": "*",
      "Action":["s3:Get*"],
      "Resource": "${aws_s3_bucket.s3_open.arn}/*",
      "Condition" : {
        "StringNotEquals": {
          "aws:sourceVpce": "${aws_vpc_endpoint.s3endpoint.id}"
        }
      }
    }
  ]
}