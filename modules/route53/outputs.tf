output "zone_id" {
  description = "The zone ID of the Route53 DNS zone"
  value       = aws_route53_zone.example_zone.zone_id
}