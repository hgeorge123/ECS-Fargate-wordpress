resource "aws_lb" "aws-lb-1" {
  name               = "${var.pj_name["name"]}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-alb.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
  tags = {
    Name = "${var.pj_name["name"]}-alb"
  }
}

resource "aws_lb_target_group" "lb-target-group-1" {
  name     = "${var.pj_name["name"]}-tg"
  target_type = "ip"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-01.id
  health_check {
    path    = "/"
    timeout = 5
    matcher = "200,302,301"
  }
}

output "alb-dns-name" {
  value = aws_lb.aws-lb-1.dns_name
}
