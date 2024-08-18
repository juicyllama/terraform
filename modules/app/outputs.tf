output "eb_cnames" {
  value = length(module.backend) > 0 ? module.backend[*].eb_cname : []
}

output "web_hooks" {
  value = length(module.frontend) > 0 ? module.frontend[*].web_hook : []
}

output "MYSQL_HOSTNAME" {
  value = length(module.backend) > 0 ? module.backend[*].MYSQL_HOSTNAME : [""]
}

output "MYSQL_PORT" {
  value = length(module.backend) > 0 ? module.backend[*].MYSQL_PORT : [3306]
}

output "MYSQL_USERNAME" {
  value = length(module.backend) > 0 ? module.backend[*].MYSQL_USERNAME : [""]
}

output "REDIS_HOST" {
  value = length(module.backend) > 0 ? module.backend[*].REDIS_HOST : [""]
}

output "REDIS_PORT" {
  value = length(module.backend) > 0 ? module.backend[*].REDIS_PORT : [6379]
}

output "MONGODB_URL" {
  value = length(data.mongodbatlas_serverless_instances.mongodb) > 0 ? flatten(data.mongodbatlas_serverless_instances.mongodb[0].results[*].connection_strings_standard_srv) : [""]
}

output "TUNNEL_HOSTNAME" {
  value = length(module.backend) > 0 ? module.backend[0].tunnel_ip : ""
}
