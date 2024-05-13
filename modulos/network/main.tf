resource "aws_vpc" "VPC-principal" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  
  tags = merge( #merge sirve para mezclar tags
    var.tags,
    { "Name" = "VPC-project-terraform" }
  )
}

resource "aws_subnet" "public_subnet" {
  count = length(var.subnet_public)
  vpc_id = aws_vpc.VPC-principal.id
  cidr_block = var.subnet_public[count.index]
  tags = merge(var.tags, {"Name" = "subnet-public-project-terraform"})
}

resource "aws_subnet" "private_subnet" {
  count = length(var.subnet_private)
  vpc_id = aws_vpc.VPC-principal.id
  cidr_block = var.subnet_private[count.index]
  tags = merge(var.tags, {"Name" = "subnet-private-project-terraform"})
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.VPC-principal.id

  tags =merge(var.tags, {Name = "IG-Principal"}) 
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.VPC-principal.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = merge(var.tags,{"Name"="CRT-public"})
}

resource "aws_route_table_association" "crta_public_subnet" {
  for_each = { for idx, subnet in aws_subnet.public_subnet : idx => subnet.id }
  subnet_id      = each.value
  route_table_id = aws_route_table.public_crt.id
}