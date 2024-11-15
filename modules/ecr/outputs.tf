output "ecr_arn" {
  value = aws_ecr_repository.repo.arn
}


output "ecr_registory_id" {
  value = aws_ecr_repository.repo.registry_id
}

output "ecr_registory_url" {
  value = aws_ecr_repository.repo.repository_url
}
