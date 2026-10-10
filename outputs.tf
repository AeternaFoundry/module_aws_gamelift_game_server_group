output "gamelift_game_server_groups_id" {
  description = "Map of id values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.id if v.id != null && length(v.id) > 0 }
}
output "gamelift_game_server_groups_arn" {
  description = "Map of arn values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "gamelift_game_server_groups_auto_scaling_group_arn" {
  description = "Map of auto_scaling_group_arn values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.auto_scaling_group_arn if v.auto_scaling_group_arn != null && length(v.auto_scaling_group_arn) > 0 }
}
output "gamelift_game_server_groups_auto_scaling_policy" {
  description = "Map of auto_scaling_policy values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => one(v.auto_scaling_policy) if v.auto_scaling_policy != null && length(v.auto_scaling_policy) > 0 }
}
output "gamelift_game_server_groups_balancing_strategy" {
  description = "Map of balancing_strategy values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.balancing_strategy if v.balancing_strategy != null && length(v.balancing_strategy) > 0 }
}
output "gamelift_game_server_groups_game_server_group_name" {
  description = "Map of game_server_group_name values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.game_server_group_name if v.game_server_group_name != null && length(v.game_server_group_name) > 0 }
}
output "gamelift_game_server_groups_game_server_protection_policy" {
  description = "Map of game_server_protection_policy values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.game_server_protection_policy if v.game_server_protection_policy != null && length(v.game_server_protection_policy) > 0 }
}
output "gamelift_game_server_groups_instance_definition" {
  description = "Map of instance_definition values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.instance_definition if v.instance_definition != null && length(v.instance_definition) > 0 }
}
output "gamelift_game_server_groups_launch_template" {
  description = "Map of launch_template values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => one(v.launch_template) if v.launch_template != null && length(v.launch_template) > 0 }
}
output "gamelift_game_server_groups_max_size" {
  description = "Map of max_size values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.max_size if v.max_size != null }
}
output "gamelift_game_server_groups_min_size" {
  description = "Map of min_size values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.min_size if v.min_size != null }
}
output "gamelift_game_server_groups_region" {
  description = "Map of region values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.region if v.region != null && length(v.region) > 0 }
}
output "gamelift_game_server_groups_role_arn" {
  description = "Map of role_arn values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.role_arn if v.role_arn != null && length(v.role_arn) > 0 }
}
output "gamelift_game_server_groups_tags" {
  description = "Map of tags values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "gamelift_game_server_groups_tags_all" {
  description = "Map of tags_all values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "gamelift_game_server_groups_vpc_subnets" {
  description = "Map of vpc_subnets values across all gamelift_game_server_groups, keyed the same as var.gamelift_game_server_groups"
  value       = { for k, v in aws_gamelift_game_server_group.gamelift_game_server_groups : k => v.vpc_subnets if v.vpc_subnets != null && length(v.vpc_subnets) > 0 }
}

