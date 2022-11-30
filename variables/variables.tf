variable "number_example" {
  description = "An example of a number variable in Terraform"
  type        = number
  default     = 42
}

variable "list_example" {
  description = "An example of a list in Terraform"
  type        = list
  default     = ["a", "b", "c"]
}

variable "list_number_example" {
  description = "An example of a number list in Terraform"
  type        = list(number)
  default     = [1, 2, 3]
}

variable "map_example" {
  description = "An example of a map in Terraform"
  type        = map(string)
  default     = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}

variable "object_example" {
  description = "An example of a structural type in Terraform"
  type        = object ({
    name      = string
    age       = number
    tags      = list(string)
    enabled   = bool
  })
  default     = {
    name      = "kim"
    age       = 32
    tags      = ["a", "b", "c"]
    enabled   = true
  }
}

variable "server_port" {
  description = "The Port the server will use for HTTP requests"
  type        = number
  default     = 8080
}