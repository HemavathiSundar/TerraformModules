root@ip-172-31-23-65:/home/ubuntu/project# terraform plan
module.ecr.aws_ecr_repository.main: Refreshing state... [id=my-ecr-repo]
module.vpc.aws_vpc.vpc: Refreshing state... [id=vpc-0e63e592263f9018d]
module.vpc.aws_internet_gateway.internet_gateway: Refreshing state... [id=igw-09ec677960c9a6e82]
module.sg.aws_security_group.alb_security_group: Refreshing state... [id=sg-07f23f91c391be3fa]
module.vpc.aws_subnet.private_app_subnet_az1: Refreshing state... [id=subnet-0aaa8e6c5675d932a]
module.vpc.aws_subnet.public_subnet_az2: Refreshing state... [id=subnet-0d25f941876240693]
module.vpc.aws_subnet.private_data_subnet_az2: Refreshing state... [id=subnet-017ef76a55984ceb8]
module.vpc.aws_subnet.public_subnet_az1: Refreshing state... [id=subnet-014bde371b58bab36]
module.vpc.aws_subnet.private_data_subnet_az1: Refreshing state... [id=subnet-01184ed9c43c79d6f]
module.vpc.aws_subnet.private_app_subnet_az2: Refreshing state... [id=subnet-09a7619348f48c576]
module.vpc.aws_route_table.public_route_table: Refreshing state... [id=rtb-0dc46e9452b3eab99]
module.vpc.aws_route_table_association.public_subnet_az1_rt_association: Refreshing state... [id=rtbassoc-04a2ac7a8cbabcafe]
module.vpc.aws_route_table_association.public_subnet_2_rt_association: Refreshing state... [id=rtbassoc-003a33463287e8bbe]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # module.ecr.aws_ecr_repository.main has changed
  ~ resource "aws_ecr_repository" "main" {
        id                   = "my-ecr-repo"
        name                 = "my-ecr-repo"
      + tags                 = {}
        # (5 unchanged attributes hidden)


        # (2 unchanged blocks hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may
include actions to undo or respond to these changes.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.acm.aws_acm_certificate.acm_certificate will be created
  + resource "aws_acm_certificate" "acm_certificate" {
      + arn                       = (known after apply)
      + domain_name               = "ishahema.com"
      + domain_validation_options = [
          + {
              + domain_name           = "*ishahema.com"
              + resource_record_name  = (known after apply)
              + resource_record_type  = (known after apply)
              + resource_record_value = (known after apply)
            },
          + {
              + domain_name           = "ishahema.com"
              + resource_record_name  = (known after apply)
              + resource_record_type  = (known after apply)
              + resource_record_value = (known after apply)
            },
        ]
      + id                        = (known after apply)
      + key_algorithm             = (known after apply)
      + not_after                 = (known after apply)
      + not_before                = (known after apply)
      + pending_renewal           = (known after apply)
      + renewal_eligibility       = (known after apply)
      + renewal_summary           = (known after apply)
      + status                    = (known after apply)
      + subject_alternative_names = [
          + "*ishahema.com",
          + "ishahema.com",
        ]
      + tags_all                  = (known after apply)
      + type                      = (known after apply)
      + validation_emails         = (known after apply)
      + validation_method         = "DNS"

      + options {
          + certificate_transparency_logging_preference = (known after apply)
        }
    }

  # module.acm.aws_acm_certificate_validation.acm_certificate_validation will be created
  + resource "aws_acm_certificate_validation" "acm_certificate_validation" {
      + certificate_arn         = (known after apply)
      + id                      = (known after apply)
      + validation_record_fqdns = (known after apply)
    }

  # module.acm.aws_route53_record.route53_record["*ishahema.com"] will be created
  + resource "aws_route53_record" "route53_record" {
      + allow_overwrite = true
      + fqdn            = (known after apply)
      + id              = (known after apply)
      + name            = (known after apply)
      + records         = (known after apply)
      + ttl             = 60
      + type            = (known after apply)
      + zone_id         = "Z06945753DU52RRMD95XT"
    }

  # module.acm.aws_route53_record.route53_record["ishahema.com"] will be created
  + resource "aws_route53_record" "route53_record" {
      + allow_overwrite = true
      + fqdn            = (known after apply)
      + id              = (known after apply)
      + name            = (known after apply)
      + records         = (known after apply)
      + ttl             = 60
      + type            = (known after apply)
      + zone_id         = "Z06945753DU52RRMD95XT"
    }

  # module.application_load_balancer.aws_lb.application_load_balancer will be created
  + resource "aws_lb" "application_load_balancer" {
      + arn                                                          = (known after apply)
      + arn_suffix                                                   = (known after apply)
      + client_keep_alive                                            = 3600
      + desync_mitigation_mode                                       = "defensive"
      + dns_name                                                     = (known after apply)
      + drop_invalid_header_fields                                   = false
      + enable_deletion_protection                                   = false
      + enable_http2                                                 = true
      + enable_tls_version_and_cipher_suite_headers                  = false
      + enable_waf_fail_open                                         = false
      + enable_xff_client_port                                       = false
      + enforce_security_group_inbound_rules_on_private_link_traffic = (known after apply)
      + id                                                           = (known after apply)
      + idle_timeout                                                 = 60
      + internal                                                     = false
      + ip_address_type                                              = (known after apply)
      + load_balancer_type                                           = "application"
      + name                                                         = "aws-alb"
      + name_prefix                                                  = (known after apply)
      + preserve_host_header                                         = false
      + security_groups                                              = [
          + "sg-07f23f91c391be3fa",
        ]
      + subnets                                                      = [
          + "subnet-014bde371b58bab36",
          + "subnet-0d25f941876240693",
        ]
      + tags_all                                                     = (known after apply)
      + vpc_id                                                       = (known after apply)
      + xff_header_processing_mode                                   = "append"
      + zone_id                                                      = (known after apply)

      + subnet_mapping {
          + allocation_id        = (known after apply)
          + ipv6_address         = (known after apply)
          + outpost_id           = (known after apply)
          + private_ipv4_address = (known after apply)
          + subnet_id            = (known after apply)
        }
    }

  # module.application_load_balancer.aws_lb_listener.alb_http_listener will be created
  + resource "aws_lb_listener" "alb_http_listener" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + load_balancer_arn = (known after apply)
      + port              = 80
      + protocol          = "HTTP"
      + ssl_policy        = (known after apply)
      + tags_all          = (known after apply)

      + default_action {
          + order = (known after apply)
          + type  = "redirect"

          + redirect {
              + host        = "#{host}"
              + path        = "/#{path}"
              + port        = "443"
              + protocol    = "HTTPS"
              + query       = "#{query}"
              + status_code = "HTTP_301"
            }
        }

      + mutual_authentication {
          + ignore_client_certificate_expiry = (known after apply)
          + mode                             = (known after apply)
          + trust_store_arn                  = (known after apply)
        }
    }

  # module.application_load_balancer.aws_lb_listener.alb_https_listener will be created
  + resource "aws_lb_listener" "alb_https_listener" {
      + arn               = (known after apply)
      + certificate_arn   = (known after apply)
      + id                = (known after apply)
      + load_balancer_arn = (known after apply)
      + port              = 443
      + protocol          = "HTTPS"
      + ssl_policy        = "ELBSecurityPolicy-2016-08"
      + tags_all          = (known after apply)

      + default_action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }

      + mutual_authentication {
          + ignore_client_certificate_expiry = (known after apply)
          + mode                             = (known after apply)
          + trust_store_arn                  = (known after apply)
        }
    }

  # module.application_load_balancer.aws_lb_target_group.alb_target_group will be created
  + resource "aws_lb_target_group" "alb_target_group" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + connection_termination             = (known after apply)
      + deregistration_delay               = "300"
      + id                                 = (known after apply)
      + ip_address_type                    = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancer_arns                 = (known after apply)
      + load_balancing_algorithm_type      = (known after apply)
      + load_balancing_anomaly_mitigation  = (known after apply)
      + load_balancing_cross_zone_enabled  = (known after apply)
      + name                               = "alb-tg"
      + name_prefix                        = (known after apply)
      + port                               = 80
      + preserve_client_ip                 = (known after apply)
      + protocol                           = "HTTP"
      + protocol_version                   = (known after apply)
      + proxy_protocol_v2                  = false
      + slow_start                         = 0
      + tags_all                           = (known after apply)
      + target_type                        = "ip"
      + vpc_id                             = "vpc-0e63e592263f9018d"

      + health_check {
          + enabled             = true
          + healthy_threshold   = 5
          + interval            = 30
          + matcher             = "200,301,302"
          + path                = "/"
          + port                = "traffic-port"
          + protocol            = "HTTP"
          + timeout             = 5
          + unhealthy_threshold = 2
        }

      + stickiness {
          + cookie_duration = (known after apply)
          + cookie_name     = (known after apply)
          + enabled         = (known after apply)
          + type            = (known after apply)
        }

      + target_failover {
          + on_deregistration = (known after apply)
          + on_unhealthy      = (known after apply)
        }

      + target_health_state {
          + enable_unhealthy_connection_termination = (known after apply)
        }
    }

  # module.rds.aws_db_instance.database_instance will be created
  + resource "aws_db_instance" "database_instance" {
      + address                               = (known after apply)
      + allocated_storage                     = (known after apply)
      + apply_immediately                     = false
      + arn                                   = (known after apply)
      + auto_minor_version_upgrade            = true
      + availability_zone                     = "us-west-2a"
      + backup_retention_period               = (known after apply)
      + backup_target                         = (known after apply)
      + backup_window                         = (known after apply)
      + ca_cert_identifier                    = (known after apply)
      + character_set_name                    = (known after apply)
      + copy_tags_to_snapshot                 = false
      + db_name                               = (known after apply)
      + db_subnet_group_name                  = "my-db-subnet-group"
      + dedicated_log_volume                  = false
      + delete_automated_backups              = true
      + domain_fqdn                           = (known after apply)
      + endpoint                              = (known after apply)
      + engine                                = (known after apply)
      + engine_version                        = (known after apply)
      + engine_version_actual                 = (known after apply)
      + hosted_zone_id                        = (known after apply)
      + id                                    = (known after apply)
      + identifier                            = "my-rds-instance"
      + identifier_prefix                     = (known after apply)
      + instance_class                        = "db.t2.micro"
      + iops                                  = (known after apply)
      + kms_key_id                            = (known after apply)
      + latest_restorable_time                = (known after apply)
      + license_model                         = (known after apply)
      + listener_endpoint                     = (known after apply)
      + maintenance_window                    = (known after apply)
      + master_user_secret                    = (known after apply)
      + master_user_secret_kms_key_id         = (known after apply)
      + monitoring_interval                   = 0
      + monitoring_role_arn                   = (known after apply)
      + multi_az                              = false
      + nchar_character_set_name              = (known after apply)
      + network_type                          = (known after apply)
      + option_group_name                     = (known after apply)
      + parameter_group_name                  = (known after apply)
      + performance_insights_enabled          = false
      + performance_insights_kms_key_id       = (known after apply)
      + performance_insights_retention_period = (known after apply)
      + port                                  = (known after apply)
      + publicly_accessible                   = false
      + replica_mode                          = (known after apply)
      + replicas                              = (known after apply)
      + resource_id                           = (known after apply)
      + skip_final_snapshot                   = false
      + snapshot_identifier                   = "your-db-snapshot-id"
      + status                                = (known after apply)
      + storage_throughput                    = (known after apply)
      + storage_type                          = (known after apply)
      + tags_all                              = (known after apply)
      + timezone                              = (known after apply)
      + username                              = (known after apply)
      + vpc_security_group_ids                = [
          + "sg-0b7126b5957eb7e53",
        ]
    }

  # module.route53.aws_route53_zone.example_zone will be created
  + resource "aws_route53_zone" "example_zone" {
      + arn                 = (known after apply)
      + comment             = "Managed by Terraform"
      + force_destroy       = false
      + id                  = (known after apply)
      + name                = "ishahema.com"
      + name_servers        = (known after apply)
      + primary_name_server = (known after apply)
      + tags_all            = (known after apply)
      + zone_id             = (known after apply)
    }

  # module.s3_cloudfront.aws_cloudfront_distribution.example_distribution will be created
  + resource "aws_cloudfront_distribution" "example_distribution" {
      + arn                             = (known after apply)
      + caller_reference                = (known after apply)
      + continuous_deployment_policy_id = (known after apply)
      + default_root_object             = "index.html"
      + domain_name                     = (known after apply)
      + enabled                         = true
      + etag                            = (known after apply)
      + hosted_zone_id                  = (known after apply)
      + http_version                    = "http2"
      + id                              = (known after apply)
      + in_progress_validation_batches  = (known after apply)
      + is_ipv6_enabled                 = true
      + last_modified_time              = (known after apply)
      + price_class                     = "PriceClass_All"
      + retain_on_delete                = false
      + staging                         = false
      + status                          = (known after apply)
      + tags                            = {
          + "Environment" = "staging"
          + "Project"     = "example-project"
        }
      + tags_all                        = {
          + "Environment" = "staging"
          + "Project"     = "example-project"
        }
      + trusted_key_groups              = (known after apply)
      + trusted_signers                 = (known after apply)
      + wait_for_deployment             = true

      + default_cache_behavior {
          + allowed_methods        = [
              + "GET",
              + "HEAD",
            ]
          + cached_methods         = [
              + "GET",
              + "HEAD",
            ]
          + compress               = false
          + default_ttl            = 3600
          + max_ttl                = 86400
          + min_ttl                = 0
          + target_origin_id       = "S3BucketOrigin"
          + trusted_key_groups     = (known after apply)
          + trusted_signers        = (known after apply)
          + viewer_protocol_policy = "redirect-to-https"

          + forwarded_values {
              + headers                 = (known after apply)
              + query_string            = false
              + query_string_cache_keys = (known after apply)

              + cookies {
                  + forward           = "none"
                  + whitelisted_names = (known after apply)
                }
            }
        }

      + origin {
          + connection_attempts = 3
          + connection_timeout  = 10
          + domain_name         = (known after apply)
          + origin_id           = "S3BucketOrigin"
        }

      + restrictions {
          + geo_restriction {
              + locations        = (known after apply)
              + restriction_type = "none"
            }
        }

      + viewer_certificate {
          + cloudfront_default_certificate = true
          + minimum_protocol_version       = "TLSv1"
        }
    }

  # module.s3_cloudfront.aws_s3_bucket.example_bucket will be created
  + resource "aws_s3_bucket" "example_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "jeevihema13bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule {
          + allowed_headers = (known after apply)
          + allowed_methods = (known after apply)
          + allowed_origins = (known after apply)
          + expose_headers  = (known after apply)
          + max_age_seconds = (known after apply)
        }

      + grant {
          + id          = (known after apply)
          + permissions = (known after apply)
          + type        = (known after apply)
          + uri         = (known after apply)
        }

      + lifecycle_rule {
          + abort_incomplete_multipart_upload_days = (known after apply)
          + enabled                                = (known after apply)
          + id                                     = (known after apply)
          + prefix                                 = (known after apply)
          + tags                                   = (known after apply)

          + expiration {
              + date                         = (known after apply)
              + days                         = (known after apply)
              + expired_object_delete_marker = (known after apply)
            }

          + noncurrent_version_expiration {
              + days = (known after apply)
            }

          + noncurrent_version_transition {
              + days          = (known after apply)
              + storage_class = (known after apply)
            }

          + transition {
              + date          = (known after apply)
              + days          = (known after apply)
              + storage_class = (known after apply)
            }
        }

      + logging {
          + target_bucket = (known after apply)
          + target_prefix = (known after apply)
        }

      + object_lock_configuration {
          + object_lock_enabled = (known after apply)

          + rule {
              + default_retention {
                  + days  = (known after apply)
                  + mode  = (known after apply)
                  + years = (known after apply)
                }
            }
        }

      + replication_configuration {
          + role = (known after apply)

          + rules {
              + delete_marker_replication_status = (known after apply)
              + id                               = (known after apply)
              + prefix                           = (known after apply)
              + priority                         = (known after apply)
              + status                           = (known after apply)

              + destination {
                  + account_id         = (known after apply)
                  + bucket             = (known after apply)
                  + replica_kms_key_id = (known after apply)
                  + storage_class      = (known after apply)

                  + access_control_translation {
                      + owner = (known after apply)
                    }

                  + metrics {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }

                  + replication_time {
                      + minutes = (known after apply)
                      + status  = (known after apply)
                    }
                }

              + filter {
                  + prefix = (known after apply)
                  + tags   = (known after apply)
                }

              + source_selection_criteria {
                  + sse_kms_encrypted_objects {
                      + enabled = (known after apply)
                    }
                }
            }
        }

      + server_side_encryption_configuration {
          + rule {
              + bucket_key_enabled = (known after apply)

              + apply_server_side_encryption_by_default {
                  + kms_master_key_id = (known after apply)
                  + sse_algorithm     = (known after apply)
                }
            }
        }

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }

      + website {
          + error_document           = (known after apply)
          + index_document           = (known after apply)
          + redirect_all_requests_to = (known after apply)
          + routing_rules            = (known after apply)
        }
    }

  # module.s3_cloudfront.aws_s3_bucket_acl.example_bucket_acl will be created
  + resource "aws_s3_bucket_acl" "example_bucket_acl" {
      + acl    = "private"
      + bucket = "jeevihema13bucket"
      + id     = (known after apply)

      + access_control_policy {
          + grant {
              + permission = (known after apply)

              + grantee {
                  + display_name  = (known after apply)
                  + email_address = (known after apply)
                  + id            = (known after apply)
                  + type          = (known after apply)
                  + uri           = (known after apply)
                }
            }

          + owner {
              + display_name = (known after apply)
              + id           = (known after apply)
            }
        }
    }

Plan: 13 to add, 0 to change, 0 to destroy.