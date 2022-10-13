output "myterraformSGoutput" {
  value = aws_security_group.myterraformSG.id
}
output "arnSG" {
  value = aws_security_group.myterraformSG.arn
}