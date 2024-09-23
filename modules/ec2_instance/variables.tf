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

variable "ec2" {
  type = object({
    prefix                 = string
    instance_type          = string
    subnet_id              = string
    vpc_security_group_ids = list(string)
    is_pubic               = optional(bool, false)
  })
  default = {
    prefix                 = "app"
    instance_type          = "t4g.micro"
    subnet_id              = "subnet-xxx"
    vpc_security_group_ids = ["sg-xxx", "sg-yyy"]
    is_pubic               = true
  }
}
