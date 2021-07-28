resource "aws_cloudwatch_log_group" "lambda_generator_logging" {
  name              = "/aws/lambda/${aws_lambda_function.generator.function_name}"
  retention_in_days = 3
}

resource "aws_cloudwatch_log_group" "lambda_processor_logging" {
  name              = "/aws/lambda/${aws_lambda_function.processor.function_name}"
  retention_in_days = 3
}