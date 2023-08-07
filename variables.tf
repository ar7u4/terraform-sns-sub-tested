variable "topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "enable_subscribers" {
  description = "Enable SNS subscribers?"
  type        = bool
  default     = false
}

variable "subscriber_emails" {
  description = "List of email addresses for SNS subscribers"
  type        = list(string)
  default     = []
}

variable "subscriber_phones" {
  description = "List of phone numbers for SMS subscribers"
  type        = list(string)
  default     = []
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}
