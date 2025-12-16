resource "aws_secretsmanager_secret" "redis" {
  name                    = "${var.waypoint_application}-redis"
  recovery_window_in_days = 0
}

resource "aws_iam_policy" "redis_read_ssm" {
  name = "${var.waypoint_application}-redis-read"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["secretsmanager:GetSecretValue"]
        Resource = aws_secretsmanager_secret.redis.arn
      }
    ]
  })
}

resource "aws_iam_role" "redis_read_ssm" {
  name = "${var.waypoint_application}-redis-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = { Service = "ec2.amazonaws.com" },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "redis_read_ssm" {
  role       = aws_iam_role.redis_read_ssm.name
  policy_arn = aws_iam_policy.redis_read_ssm.arn
}

resource "aws_iam_instance_profile" "redis_read_ssm" {
  name = "${var.waypoint_application}-redis-read-ssm"
  role = aws_iam_role.redis_read_ssm.name
}
