output "web_hook" {
  value = length(aws_amplify_webhook.main_app) > 0 ? aws_amplify_webhook.main_app[0].url : ""
}