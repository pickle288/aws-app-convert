provider "aws" {
  alias  = "eu_west_3"
  region = "eu-west-3"
}

resource "aws_ecrpublic_repository" "foo" {
  provider = aws.eu_west_3

  repository_name = "app-convert"

  catalog_data {
    about_text        = "About Text"
    architectures     = ["ARM"]
    description       = "Description"
    logo_image_blob   = filebase64(image.png)
    operating_systems = ["Linux"]
    usage_text        = "Usage Text"
  }

  tags = {
    env = "production"
  }
}