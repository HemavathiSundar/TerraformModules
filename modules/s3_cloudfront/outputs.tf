output "s3_bucket_id" {
  value = aws_s3_bucket.example_bucket.id
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.example_distribution.id
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.example_distribution.domain_name
}