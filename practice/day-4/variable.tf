variable "ami" {
  default     = ""
  description = "ami-value"
  type        = string

}
variable "instance_type" {
  description = "defining instance type"
  default     = ""
  type        = string

}
variable "key_name" {
  type        = string
  default     = ""
  description = "defining kry name"

}