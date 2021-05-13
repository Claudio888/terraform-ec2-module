variable "instance_type"{
  type    = string
  default = "t2.micro"
}

variable "env_prefix"{
  type    = string
  }

variable "name"{
  type    = string
  }

variable "ingress_ports"{
  type    = list(number)
  default = [22]
  }

variable "enable_sg" {
  type        = bool
  default     = false
  description = "Habilitar funcionalidade de criação do SG"
}