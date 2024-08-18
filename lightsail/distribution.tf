resource "aws_lightsail_distribution" "cdn" {
  provider         = aws.us-east-1
  count            = var.create_lightsail ? 1 : 0
  name             = "${var.prefix}-cache"
  bundle_id        = "small_1_0"
  certificate_name = aws_lightsail_certificate.cdn[0].name
  origin {
    name            = aws_lightsail_instance.www[0].name
    protocol_policy = "http-only"
    region_name     = "eu-west-2"
  }
  default_cache_behavior {
    behavior = "dont-cache"
  }

  cache_behavior {
    behavior = "cache"
    path     = "wp-content/*"
  }

  cache_behavior {
    behavior = "cache"
    path     = "wp-includes/*"
  }

  cache_behavior_settings {
    allowed_http_methods = "GET,HEAD,OPTIONS"
    cached_http_methods  = "GET,HEAD"
    default_ttl          = 86400
    maximum_ttl          = 31536000
    minimum_ttl          = 0
    forwarded_cookies {
      cookies_allow_list = []
      option             = "none"
    }

    forwarded_headers {
      headers_allow_list = ["Host"]
      option             = "allow-list"
    }
    forwarded_query_strings {
      option                     = true
      query_strings_allowed_list = []
    }
  }

}
