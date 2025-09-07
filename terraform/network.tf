resource "aws_vpc" "fullstack_app" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "fullstack_app"
  }
}

resource "aws_subnet" "fullstack_app1" {
  vpc_id                  = aws_vpc.fullstack_app.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "fullstack_app1"
  }
}

resource "aws_subnet" "fullstack_app2" {
  vpc_id                  = aws_vpc.fullstack_app.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "fullstack_app2"
  }
}

resource "aws_subnet" "fullstack_app3" {
  vpc_id                  = aws_vpc.fullstack_app.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-northeast-1d"
  map_public_ip_on_launch = true

  tags = {
    Name = "fullstack_app3"
  }
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.fullstack_app.id
}

resource "aws_route" "public" {
  route_table_id         = aws_vpc.fullstack_app.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.public.id
}

