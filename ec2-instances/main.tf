
provider "aws" {
  region  = "us-east-2"
}

resource "aws_security_group" "teste_lambda_instances" {
  name    = "teste_lambda_instances"
}

############ Inbound Rules ############
resource "aws_security_group_rule" "app_server_sg_inbound_80" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.teste_lambda_instances.id
}

############ Outbound Rules ############
resource "aws_security_group_rule" "app_server_sg_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.teste_lambda_instances.id
}

resource "aws_instance" "teste_lambda_01" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "${aws_security_group.teste_lambda_instances.id}" ]
  tags = {
    Name = "Teste Lambda 01",
    Desliga = "True"
  }
}

resource "aws_instance" "teste_lambda_02" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "${aws_security_group.teste_lambda_instances.id}" ]
  tags = {
    Name = "Teste Lambda 02",
    Desliga = "True"
  }
}
