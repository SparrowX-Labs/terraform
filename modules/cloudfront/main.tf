# CloudFront only accepts ACM certificates from us-east-1. The certificate is
# still publicly validated through the public child zone, not the private zone.
# resource "aws_acm_certificate" "cloudfront" {
#   provider = aws.us_east_1

#   domain_name       = var.cloudfront_certificate_domain_name
#   validation_method = "DNS"

#   lifecycle {
#     create_before_destroy = true
#   }

#   tags = merge(var.tags, {
#     Name = var.cloudfront_certificate_domain_name
#   })
# }

# resource "aws_acm_certificate_validation" "cloudfront" {
#   provider = aws.us_east_1

#   certificate_arn = aws_acm_certificate.cloudfront.arn

#   validation_record_fqdns = [
#     for record in aws_route53_record.certificate_validation : record.fqdn
#   ]

#   # ACM DNS validation tokens can be reused across AWS Regions for the same
#   # domain, so the public validation records are managed only once above.
#   depends_on = [aws_route53_record.certificate_validation]
# }
