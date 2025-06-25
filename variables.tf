variable "resource_group_name" {}
variable "location" {}
variable "dev_username" {}
variable "vm_size" {
  default = "Standard_B2s"
}
variable "ttl_hours" {
  default = 4
}
variable "tags" {
  type = map(string)
  default = {}
}