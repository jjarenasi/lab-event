resource "aws_ecr_repository" "default" {
  name = "ecr-lab-event"
  image_scanning_configuration {
    scan_on_push = true
  }
}

