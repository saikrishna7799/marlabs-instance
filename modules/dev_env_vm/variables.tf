variable "dev_username" {}
variable "vm_size" {}
variable "ttl_hours" {}
variable "resource_group_name" {}
variable "location" {}
variable "subnet_id" {}
variable "tags" {
  type = map(string)
}