# https://docs.aws.amazon.com/ja_jp/linux/al2023/ug/ec2.html
data "aws_ssm_parameter" "az2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-arm64"
}


resource "aws_instance" "main" {
  ami           = data.aws_ssm_parameter.az2023_ami.value
  instance_type = var.ec2.instance_type

  tags = {
    Name = format("%s-%s-ec2-%s-%02d", var.pj_tags.name, var.pj_tags.env, var.ec2.prefix, 1)
    PJ   = var.pj_tags.name
    Env  = var.pj_tags.env
  }

  subnet_id                   = var.ec2.subnet_id
  vpc_security_group_ids      = var.ec2.vpc_security_group_ids
  associate_public_ip_address = var.ec2.is_pubic_ip

  #   key_name = "example-key"
  lifecycle {
    ignore_changes = [ami]
  }
}
