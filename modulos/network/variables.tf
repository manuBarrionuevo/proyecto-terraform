variable "tags" {
  description = "tags del proyecto"
  type        = map(string)
}

variable "cidr_block" {
     description = "CIDR VPC principal"
     type = string
}

variable "subnet_public" {
     description = "subnet public"
     type = list(string)
}

variable "subnet_private" {
     description = "subnet private"
     type = list(string)
}