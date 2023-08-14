provider "aws" {

        access_key = "put access key"
        secret_key = "put secrt access key"
        region = "ap-south-1"
        }

resource "aws_s3_bucket" "test" {

        bucket = "shivansh-mayur123"
        tags = {

                Name = "my-bucket"
                Environment = "dev"
        }

}
