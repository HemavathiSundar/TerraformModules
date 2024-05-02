# Create Route53 DNS Zone
resource "aws_route53_zone" "example_zone" {
  name = var.domain_name
}