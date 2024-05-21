# Security Group Variables
variable "vpc_id" {
  type        = string
  description = "provide vpc id"
  default = "vpc-0a3d6cb996a0e599b"
}

# EC2 Web Server Variables
variable "ami" {
  type        = string
  description = "provide an ubuntu or debian ami"
  default = "ami-0e001c9271cf7f3b9"
}

variable "instance_type" {
  type        = string
  description = "provide instance size"
  default = "t2.micro"
}

variable "subnet_id" {
  type        = string
  description = "provide subnet id from your Default VPC"
  default = "subnet-031db16660298d4c8"
}

variable "key_name" {
  type        = string
  description = "provide an existing keypair"
  default = "remote-kp"
}

variable "user_data" {
  type        = string
  description = "provide userdata"
  default     = <<-EOF
                         #! /bin/bash 
                         sudo apt update -y 
                         sudo apt -y install apache2 
                         sudo systemctl start apache2 
                         sudo systemctl enable apache2 
                         sudo apt install wget -y 
                         sudo wget https://github.com/awanmbandi/google-cloud-projects/raw/jjtech-flix-app/jjtech-streaming-application-v1.zip 
                         sudo apt install unzip -y 
                         sudo unzip jjtech-streaming-application-v1.zip 
                         sudo rm -f /var/www/html/index.html 
                         sudo cp -rf jjtech-streaming-application-v1/* /var/www/html/ 
                         EOF
}
