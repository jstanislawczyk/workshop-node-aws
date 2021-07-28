resource "aws_iam_policy" "lambda_processor_policy" {
  name = "${local.environment}-lambda-processor-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.data_lake.arn}"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "sqs:ReceiveMessage",
        "sqs:DeleteMessage",
        "sqs:GetQueueAttributes"
      ],
      "Resource": [
        "${aws_sqs_queue.new_event_queue.arn}"
      ]
    }
  ]
}
EOF
}

resource "aws_sqs_queue_policy" "events_queue_policy" {
  queue_url = aws_sqs_queue.new_event_queue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.new_event_queue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.new_event_topic.arn}"
        }
      }
    }
  ]
}
POLICY
}
