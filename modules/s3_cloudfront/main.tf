# Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name
}

# Create an S3 bucket ACL
resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example_bucket.bucket
  acl    = "private"
}

# Create a CloudFront distribution
resource "aws_cloudfront_distribution" "example_distribution" {
  origin {
    domain_name = aws_s3_bucket.example_bucket.bucket_regional_domain_name
    origin_id   = "S3BucketOrigin"
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = "S3BucketOrigin"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

    cached_methods  = ["GET", "HEAD"]   # Add cached_methods argument
    allowed_methods = ["GET", "HEAD"]   # Add allowed_methods argument
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # Specify a default CloudFront certificate for HTTP connections
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = var.tags
}