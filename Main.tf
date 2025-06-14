    provider "aws" {
        access_key = "AKIATE3764"
        secret_key = "4JLRgmLcKMjo98YehaPV5hjtO"
        region = "us-east-1"
    }

    resource "aws_instance" "example" {
        ami = "ami-020cba7c55df1f615"
        instance_type = "t2.micro"
        vpc_security_group_ids = [ "sg-053923828a319c180" ]
        user_data = <<-EOF
                    #!/bin/bash
                    echo "This is a webserver deployed using Terraform" > index.html
                    nohup busybox httpd -f -p 8080 &
                    EOF

        tags = {
            Name = "Terraform_WebServer"
        }
    }

    resource "aws_security_group" "test" {
        name = "b29demotest"
        ingress {
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = [ "0.0.0.0/0" ]
        }
    } 
completed accessing webser how to post in linkedin
