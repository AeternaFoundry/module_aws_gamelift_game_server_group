variable "gamelift_game_server_groups" {
  description = <<EOT
Map of gamelift_game_server_groups, attributes below
Required:
    - game_server_group_name
    - max_size
    - min_size
    - role_arn
    - instance_definition (block):
        - instance_type (required)
        - weighted_capacity (optional)
    - launch_template (block):
        - id (optional)
        - name (optional)
        - version (optional)
Optional:
    - balancing_strategy
    - game_server_protection_policy
    - region
    - tags
    - tags_all
    - vpc_subnets
    - auto_scaling_policy (block):
        - estimated_instance_warmup (optional)
        - target_tracking_configuration (required, block):
            - target_value (required)
EOT

  type = map(object({
    game_server_group_name        = string
    max_size                      = number
    min_size                      = number
    role_arn                      = string
    balancing_strategy            = optional(string)
    game_server_protection_policy = optional(string)
    region                        = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    vpc_subnets                   = optional(set(string))
    instance_definition = list(object({
      instance_type     = string
      weighted_capacity = optional(string)
    }))
    launch_template = object({
      id      = optional(string)
      name    = optional(string)
      version = optional(string)
    })
    auto_scaling_policy = optional(object({
      estimated_instance_warmup = optional(number)
      target_tracking_configuration = object({
        target_value = number
      })
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.gamelift_game_server_groups : (
        length(v.instance_definition) >= 2 && length(v.instance_definition) <= 20
      )
    ])
    error_message = "Each instance_definition list must contain between 2 and 20 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.gamelift_game_server_groups : (
        v.auto_scaling_policy == null || (v.auto_scaling_policy.estimated_instance_warmup == null || (v.auto_scaling_policy.estimated_instance_warmup >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.gamelift_game_server_groups : (
        v.auto_scaling_policy == null || (v.auto_scaling_policy.target_tracking_configuration.target_value >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.gamelift_game_server_groups : (
        length(v.game_server_group_name) >= 1 && length(v.game_server_group_name) <= 128
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.gamelift_game_server_groups : (
        alltrue([for item in v.instance_definition : (item.weighted_capacity == null || (length(item.weighted_capacity) >= 1 && length(item.weighted_capacity) <= 3))])
      )
    ])
    error_message = "must be between 1 and 3 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.gamelift_game_server_groups : (
        v.max_size >= 1
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.gamelift_game_server_groups : (
        v.min_size >= 0
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.gamelift_game_server_groups : (
        v.vpc_subnets == null || (alltrue([for x in v.vpc_subnets : length(x) >= 15 && length(x) <= 24]))
      )
    ])
    error_message = "must be between 15 and 24 characters"
  }
  # Note: 12 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

