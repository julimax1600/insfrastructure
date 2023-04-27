resource "aws_iam_user" "user1" {
    name = var.usern
}


resource "aws_iam_user" "usuarios" {
  count = length(var.nombres_usuarios)
  name = var.nombres_usuarios[count.index]
}