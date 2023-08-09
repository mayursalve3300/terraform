provider "aws" {

	access_key = "AKIAUHIRTM33MIXTXTJ3"
	secret_key = "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"
	region = "ap-south-1"
}

resource "aws_instance" "server" {

	ami = "ami-021f7978361c18b01"
	instance_type = "t2.micro"
	key_name = "WinTest1"
	tags = {

		Name = "my-server"
		domain = "prod"
	}
}

resource "aws_eip" "test" {

	instance = "${aws_instance.server.id}"
}
