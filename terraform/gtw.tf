resource "aws_api_gateway_rest_api" "ZeBurguerAPIGTWPayment" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "ZeBurguerAPIGTWPayment"
      version = "1.0"
    }
    # paths = {
    #   "/path1" = {
    #     get = {
    #       x-amazon-apigateway-integration = {
    #         httpMethod           = "GET"
    #         payloadFormatVersion = "1.0"
    #         type                 = "HTTP_PROXY"
    #         uri                  = "https://ip-ranges.amazonaws.com/ip-ranges.json"
    #       }
    #     }
    #   }
    # }
  })

  name = "ZeBurguerAPIGTWPayment"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "ZeBurguerAPIGTWPayment" {
  rest_api_id = aws_api_gateway_rest_api.ZeBurguerAPIGTWPayment.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.ZeBurguerAPIGTWPayment.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "ZeBurguerAPIGTWPayment" {
  deployment_id = aws_api_gateway_deployment.ZeBurguerAPIGTWPayment.id
  rest_api_id   = aws_api_gateway_rest_api.ZeBurguerAPIGTWPayment.id
  stage_name    = "ZeBurguerAPIGTWPayment"
}