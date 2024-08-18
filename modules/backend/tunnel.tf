resource "aws_instance" "tunnel" {
  count         = var.create_ec2_tunnel ? 1 : 0
  ami           = var.tunnel_ami
  instance_type = var.tunnel_type
  key_name      = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [
    aws_security_group.tunnel[0].id
  ]
  subnet_id = var.tunnel_subnet_id
  tags = merge(var.tunnel_instance_tags, {
    Name = "AWS Tunnel"
  })
}


resource "aws_security_group" "tunnel" {
  count  = var.create_ec2_tunnel ? 1 : 0
  name   = length(split("staging", var.domain)) > 1 ? "staging-launch-wizard-1" : "launch-wizard-1"
  vpc_id = var.vpc_id
  tags = {
    Name = "AWS Tunnel"
  }

  lifecycle {
    ignore_changes = [
      description
    ]
  }
}

resource "aws_security_group_rule" "ssh_tunnel" {
  count             = var.create_ec2_tunnel ? 1 : 0
  from_port         = 22
  protocol          = "TCP"
  security_group_id = aws_security_group.tunnel[0].id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_all_egress" {
  count       = var.create_ec2_tunnel ? 1 : 0
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1" # "-1" stands for all protocols
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.tunnel[0].id
}
