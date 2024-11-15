variable "pj_tags" {
  type = object({
    name = string
    env  = string
  })
  default = {
    name = "hoge"
    env  = "test"
  }
}

variable "ecr" {
  type = object({
    prefix              = string
    is_enable_immutable = optional(bool, false)
  })
  default = {
    prefix              = "app"
    is_enable_immutable = false
  }
}

