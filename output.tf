output "s3_bucket_name" {
  value = aws_s3_bucket.mybucket.id
}

output "s3_bucket_region" {
  value = aws_s3_bucket.mybucket.region
}

output "s3_bucket_name" {
  value = aws_s3_bucket.destination.id
}

output "s3_bucket_region" {
  value = aws_s3_bucket.destination.region
}
