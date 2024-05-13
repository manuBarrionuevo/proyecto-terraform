output "vpc_id" {
  value = aws_vpc.VPC-principal.id
}

output "subnet_private_ids" {
  value = aws_subnet.private_subnet[*].id
}

output "subnet_public_ids" {
  value = aws_subnet.public_subnet[*].id
}