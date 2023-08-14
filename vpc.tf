provider "aws" {

	access_key = "put access key"
	secret_key = "put secreat access key"
	region = "ap-south-1"
}

######Creating VPC#####

resource "aws_vpc" "test" {

	cidr_block = "10.10.0.0/16"
	tags =  {
	     Name = "test-vpc"
	}
}

#####Creating SUBNETS ####

resource "aws_subnet" "subnet-1" {

	vpc_id = "${aws_vpc.test.id}"
	cidr_block = "10.10.1.0/24"
	availability_zone = "ap-south-1a"
	tags =  {
		Name = "subnet-1"
	}
}

resource "aws_subnet" "subnet-2" {

        vpc_id = "${aws_vpc.test.id}"
        cidr_block = "10.10.2.0/24"
        availability_zone = "ap-south-1b"
        tags = {
                Name = "subnet-2"
        }
}

####### Creating Internet gateway ######

resource "aws_internet_gateway" "igw" {

	vpc_id = "${aws_vpc.test.id}"
	

}

######### Route table#########

resource "aws_route_table" "public-rt" {

	vpc_id = "${aws_vpc.test.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.igw.id}"

	}
}

resource "aws_route_table_association" "public-routing" {

	subnet_id = "${aws_subnet.subnet-1.id}"
	route_table_id = "${aws_route_table.public-rt.id}"
}



############ luanch instance in subnet 1########

resource "aws_instance" "test-1" {

	ami = "ami-098dd3a86ea110896"
	instance_type = "t2.micro"
	subnet_id = "${aws_subnet.subnet-1.id}"

}

