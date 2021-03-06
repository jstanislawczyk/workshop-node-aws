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
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_generator_policy_attachment" {
  role       = aws_iam_role.lambda_generator_role.name
  policy_arn = aws_iam_policy.lambda_generator_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_processor_policy_attachment" {
  role       = aws_iam_role.lambda_processor_role.name
  policy_arn = aws_iam_policy.lambda_processor_policy.arn
}
