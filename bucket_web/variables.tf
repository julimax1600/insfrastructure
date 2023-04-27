variable "usern" {
  default = "pepe"
}
/*
variable "number" {
  type = number
}
*/
variable "nombres_usuarios" {
  type = list(string)
  default = ["usuario1", "usuario2", "usuario3"]
}