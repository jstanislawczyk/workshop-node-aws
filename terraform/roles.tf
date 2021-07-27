resource "aws_iam_role" "lambda_generator_role" {
  name = "jstanislawczyk-lambda-generator-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role" "lambda_processor_role" {
  name = "jstanislawczyk-lambda-processor-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    },
    {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.data_lake.arn}"
      ],
    }
  ]
}
EOF
}

