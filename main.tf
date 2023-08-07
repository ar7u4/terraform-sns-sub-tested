provider "aws" {
  region = var.aws_region
}

resource "aws_sns_topic" "pipeline_topic" {
  name = var.topic_name
}

# Conditionally create SNS email subscriptions based on enable_subscribers variable
resource "aws_sns_topic_subscription" "pipeline_email_subscribers" {
  count      = var.enable_subscribers ? length(var.subscriber_emails) : 0
  topic_arn  = aws_sns_topic.pipeline_topic.arn
  protocol   = "email"
  endpoint   = element(var.subscriber_emails, count.index)
}

# Conditionally create SNS SMS subscriptions based on enable_subscribers variable
resource "aws_sns_topic_subscription" "pipeline_sms_subscribers" {
  count      = var.enable_subscribers ? length(var.subscriber_phones) : 0
  topic_arn  = aws_sns_topic.pipeline_topic.arn
  protocol   = "sms"
  endpoint   = element(var.subscriber_phones, count.index)
}
