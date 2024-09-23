# RDS

locals {
  ogp_name       = format("%s-%s-ogp-%s-%s%s-%02d", var.pj_tags.name, var.pj_tags.env, var.rds.prefix, var.rds.db_engine, replace(var.rds.db_engine_version, ".", ""), 1)
  dsg_name       = format("%s-%s-dsg-%s-%02d", var.pj_tags.name, var.pj_tags.env, var.rds.prefix, 1)
  rds_identifier = format("%s-%s-rds-%s-%02d", var.pj_tags.name, var.pj_tags.env, var.rds.prefix, 1)
}

data "aws_availability_zones" "this" { state = "available" }

## RDS Subnet Group
resource "aws_db_subnet_group" "dsg" {
  name        = local.dsg_name
  description = local.dsg_name
  subnet_ids  = var.rds.subnet_group_ids
}

## RDS Option Group
resource "aws_db_option_group" "opg" {
  name                     = local.ogp_name
  engine_name              = var.rds.db_engine
  major_engine_version     = var.rds.db_engine_version
  option_group_description = local.ogp_name
}

resource "aws_db_instance" "db" {
  identifier = local.rds_identifier

  # instance class
  instance_class = var.rds.rds_instance_class

  # db engine 
  engine         = var.rds.db_engine
  engine_version = var.rds.db_engine_version

  # storage
  allocated_storage = var.rds.rds_allocated_storage
  storage_type      = "gp3"
  storage_encrypted = false


  # database
  db_name  = var.rds.db_name
  username = var.rds.db_username
  password = var.rds.db_password

  # maintenance window
  maintenance_window         = "sun:18:00-sun:19:00"
  auto_minor_version_upgrade = false

  # multiaz
  multi_az          = var.rds.is_multi_az ? true : false
  availability_zone = var.rds.is_multi_az ? null : format("%s%s", data.aws_availability_zones.this.id, var.rds.az)

  # network , parameter group
  vpc_security_group_ids = var.rds.security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.dsg.name
  #   parameter_group_name = aws_db_parameter_group.dbpg.name
  option_group_name = aws_db_option_group.opg.name

  # Auto Destroy
  backup_retention_period  = var.rds.is_ops ? 7 : 0
  deletion_protection      = var.rds.is_ops ? true : false
  delete_automated_backups = var.rds.is_ops ? true : false
  skip_final_snapshot      = var.rds.is_ops ? false : true

  # Performance Insights
  performance_insights_enabled          = var.rds.is_ops ? true : false
  performance_insights_retention_period = var.rds.is_ops ? 7 : null


  # logs
  #   enabled_cloudwatch_logs_exports = ["audit", "slowquery"]


  lifecycle {
    ignore_changes = [password]
  }

  tags = {
    Name = local.rds_identifier
    PJ   = var.pj_tags.name
    Env  = var.pj_tags.env
  }

  timeouts {
    create = "3h"
    delete = "3h"
    update = "3h"
  }

}
