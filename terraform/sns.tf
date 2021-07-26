resource "aws_sns_topic" "new_event_topic" {
  name = "${local.environment}-new-event-topic"
}
