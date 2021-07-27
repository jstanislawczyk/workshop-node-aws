resource "aws_lambda_function" "generator" {
  filename      = "generator.zip"
  function_name = "${local.environment}-generator"
  role          = aws_iam_role.lambda_generator_role.arn
  handler       = "src/index.handler"
  runtime       = "nodejs14.x"

  source_code_hash = filebase64sha256("generator.zip")

  environment {
    variables = {
      SNS_TOPIC = aws_sns_topic.new_event_topic.arn
    }
  }
}

resource "aws_lambda_function" "processor" {
  filename      = "processor.zip"
  function_name = "${local.environment}-processor"
  role          = aws_iam_role.lambda_processor_role.arn
  handler       = "src/index.handler"
  runtime       = "nodejs14.x"

  source_code_hash = filebase64sha256("processor.zip")

  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.data_lake.id
    }
  }
}

