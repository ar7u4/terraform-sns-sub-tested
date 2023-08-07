output "sns_topic_arn" {
  description = "ARN of the created SNS topic"
  value       = aws_sns_topic.pipeline_topic.arn
}

output "sns_email_subscribers" {
  description = "List of SNS email subscriber ARNs"
  value       = aws_sns_topic_subscription.pipeline_email_subscribers[*].arn
}

output "sns_sms_subscribers" {
  description = "List of SNS SMS subscriber ARNs"
  value       = aws_sns_topic_subscription.pipeline_sms_subscribers[*].arn
}
