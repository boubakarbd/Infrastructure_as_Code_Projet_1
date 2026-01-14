output "instance_public_ip" {
  description = "L'adresse IP publique de l'instance EC2"
  value       = aws_instance.web_app.public_ip
}

output "jenkins_url" {
    description = "Lien pour accéder à l'interface Jenkins"
    value       = "http://${aws_instance.web_app.public_ip}:8080"
}

output "tomcat_url" {
    description = "Lien pour accéder à l'application Tomcat"
    value       = "http://${aws_instance.web_app.public_ip}:8081"
}