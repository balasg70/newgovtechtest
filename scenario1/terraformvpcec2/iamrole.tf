resource "aws_iam_role" "countapphost" {
  name        = "s3ec2test"
  description = "privileges for the test instance"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "s3access" {
  name        = "s3ec2test"
  description = "allow read access to specific bucket"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:List*",
        "s3:Get*"
      ],
      "Resource": [
        "${aws_s3_bucket.s3_open.arn}",
        "${aws_s3_bucket.s3_open.arn}/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3access" {
  role       = "${aws_iam_role.countapphost.name}"
  policy_arn = "${aws_iam_policy.s3access.arn}"
}

resource "aws_iam_instance_profile" "countapphost" {
  name = "${aws_iam_role.countapphost.name}"
  role = "${aws_iam_role.countapphost.id}"
}