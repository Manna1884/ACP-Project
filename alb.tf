#Creating Application Load Balancer
resource "aws_lb" "external_alb" {
  internal           = false #Internet-facing-routes requests from client to target
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id ]
#internet-facing alb requires a public subnet
  tags = {
    name = var.alb_name
  }
}


#Creating Application Load Balancer Target Group
resource "aws_lb_target_group" "alb-target-group" {
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc-project.id

health_check {
    path = "/"
    port = 80
  }
  tags = {
    name = var.alb_sec_group
  }
}


#Creating Load Balancer Listener
resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = aws_lb.external_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-target-group.arn
  }
}

#Target Group Attachment to Server1
resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = aws_instance.server1.id
  port             = "80"
}

#Target Group Attachment to Server2
resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn
  target_id        = aws_instance.server2.id
  port             = "80"
}