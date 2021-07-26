resource "aws_sqs_queue" "new_event_queue" {
  name = "${local.environment}-new-event-queue"
}
