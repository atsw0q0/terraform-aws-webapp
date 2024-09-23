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

variable "rds" {
  type = object({
    prefix                = string
    subnet_group_ids      = list(string)
    security_group_ids    = list(string)
    rds_instance_class    = string
    rds_allocated_storage = optional(number, 20)
    db_engine             = string
    db_engine_version     = string
    db_name               = optional(string, "db")
    db_username           = optional(string, "admin")
    db_password           = string
    az                    = optional(string, "a")
    is_multi_az           = optional(bool, false)
    is_ops                = optional(bool, false)
  })
  default = {
    prefix                = "app"
    subnet_group_ids      = ["subnet-xxx", "subnet-yyy"]
    security_group_ids    = ["sg-xxx", "sg-yyy"]
    rds_instance_class    = "db.t4g.micro"
    rds_allocated_storage = 20
    db_engine             = "mysql"
    db_engine_version     = "8.0"
    db_name               = "fuga"
    db_username           = "admin"
    db_password           = "password"
    az                    = "a"
    is_multi_az           = false
    is_ops                = false
  }
}

