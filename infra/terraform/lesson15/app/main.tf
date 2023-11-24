module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "levelup-vpc"
  cidr = "10.10.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets  = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]

  tags = {
    Terraform = "true"
    Environment = "demo"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"
  ami = data.aws_ami.ubuntu.id

  instance_type          = "t2.micro"
  key_name               = var.key_name
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  subnet_id              = module.vpc.public_subnets[0]
  user_data = file("init.sh")
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}