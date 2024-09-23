output "rds_endpoint" {
  value = aws_db_instance.db.endpoint
}

output "rds_arn" {
  value = aws_db_instance.db.arn
}
