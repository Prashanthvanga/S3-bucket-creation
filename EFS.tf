resource "aws_efs_access_point" "test" {
  file_system_id = aws_efs_file_system.fs.id
}

resource "aws_efs_file_system" "fs" {

  creation_token = "my-product"

   tags = {
    Name = "MyProduct"
  }

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }


}


resource "aws_efs_backup_policy" "policy" {
  file_system_id = aws_efs_file_system.fs.id

  backup_policy {
    status = "ENABLED"
  }
}

resource "aws_efs_file_system_policy" "policy" {
  file_system_id = aws_efs_file_system.fs.id

  bypass_policy_lockout_safety_check = true

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "ExamplePolicy01",
    "Statement": [
        {
            "Sid": "ExampleStatement01",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Resource": "${aws_efs_file_system.fs.arn}",
            "Action": [
                "elasticfilesystem:ClientMount",
                "elasticfilesystem:ClientWrite"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "true"
                }
            }
        }
    ]
}
POLICY
}

resource "aws_efs_mount_target" "alpha" {
  file_system_id = aws_efs_file_system.fs.id
  subnet_id      = aws_subnet.alpha.id
}

resource "aws_vpc" "fs" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "alpha" {
  vpc_id            = aws_vpc.fs.id
  availability_zone = "eu-west-2a"
  cidr_block        = "10.0.1.0/24"
}
