    provider "aws" {
        access_key = "AKIAT"
        secret_key = "4JLRgmQQcKMjo98YehaPV5hjtO"
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
