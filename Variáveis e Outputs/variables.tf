variable "location" {
  description = "Variável que indica a região onde os recursos serão criados"
  type = string
  default = "sa-east-1"
}

variable "account_tier" {
  description = "Tier do storage account na azure"
  type = string
  default = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicação de dados da Storage Account"
  type = string
  default = "LRS"
  sensitive = true
}