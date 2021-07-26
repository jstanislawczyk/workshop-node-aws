resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  endpoint  = aws_sqs_queue.new_event_queue.arn
  topic_arn = aws_sns_topic.new_event_topic.arn
  protocol  = "sqs"
}
