resource "aws_alb" "alb-prod" {
    name            = "alb-prod"
    internal        = false
    security_groups = [aws_security_group.sg-alb]
    subnets         = module.vpc.public_subnets
    
    tags = {
        Name = "alb-prod"
    }
  
}

resource "aws_alb_target_group" "alb-tg-prod" {
    name     = "alb-tg-prod"
    port     = 8080
    protocol = "HTTP"
    vpc_id   = module.vpc.vpc_id

    health_check {
        path                = "/"
        protocol            = "HTTP"
        matcher             = "200-399"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 3
        unhealthy_threshold = 3
    }

    tags = {
        Name = "alb-tg-prod"
    }
}

resource "aws_alb_listener" "alb-listener-prod" {
    load_balancer_arn = aws_alb.alb-prod.arn                        #permet de faire le lien entre le listener et l'alb
    port              = 80                                          #port d'écoute du listener vers l"extérieur
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_alb_target_group.alb-tg-prod.arn     #permet de faire le lien entre le listener et le target group
    }
}