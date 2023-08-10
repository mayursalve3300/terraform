provider "aws" {

        access_key = "AKIAWHBQ7AZN5UYBNLOZ"
        secret_key = "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"
        region = "ap-south-1"
        }

resource "aws_s3_bucket" "test" {

        bucket = "shivansh-mayur123"
        tags = {

                Name = "my-bucket"
                Environment = "dev"
        }

}
