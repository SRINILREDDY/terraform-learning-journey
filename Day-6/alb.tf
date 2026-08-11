
resource "aws_lb_target_group" "app" {
    name = "target-group"
    port =80
    protocol ="HTTP"
    vpc_id = aws_vpc.main.id

    health_check {
        path = "/"
    }

}
resource "aws_lb" "alb" {
    name = "alb"
    load_balancer_type = "application"

    subnets = [
        aws_subnet.public_1.id,
        aws_subnet.public_2.id
    ]

    security_groups = [aws_security_group.alb-sg.id]
}
 

resource "aws_lb_listener" "listener" {
    load_balancer_arn = aws_lb.alb.arn
    port =80
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.app.arn
    }
}