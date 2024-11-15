# ECR
locals {
  repository_name       = format("%s-%s-ecr-%s-%02d", var.pj_tags.name, var.pj_tags.env, var.ecr.prefix, 1)
}

resource "aws_ecr_repository" "repo" {
  name                 = local.repository_name
  image_tag_mutability = var.ecr.is_enable_immutable ? "IMMUTABLE" : "MUTABLE"
  encryption_configuration {
    encryption_type = "AES256"
  }
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = local.repository_name
    PJ   = var.pj_tags.name
    Env  = var.pj_tags.env
  }
}