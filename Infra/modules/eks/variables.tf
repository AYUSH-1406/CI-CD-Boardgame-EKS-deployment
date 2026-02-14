variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "eks_sg_id" {
  type = string
}

variable "cluster_name" {
  type = string
}
