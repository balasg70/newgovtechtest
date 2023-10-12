resource "aws_subnet" "PublicAZA" {
  vpc_id = aws_vpc.terraformmain.id
  cidr_block = var.Subnet-Public-AzA-CIDR
  tags = {
        Name = "sub_public_devops"
  }
 availability_zone = data.aws_availability_zones.available.names[0]
}
resource "aws_route_table_association" "PublicAZA" {
    subnet_id = aws_subnet.PublicAZA.id
    route_table_id = aws_route_table.public.id
}
resource "aws_subnet" "PrivateAZA" {
  vpc_id = aws_vpc.terraformmain.id
  cidr_block = var.Subnet-Private-AzA-CIDR
  tags = {
        Name = "sub_private_devops"
  }
  availability_zone = data.aws_availability_zones.available.names[1]
}
resource "aws_route_table_association" "PrivateAZA" {
    subnet_id = aws_subnet.PrivateAZA.id
    route_table_id = aws_route_table.private.id
}
resource "aws_db_subnet_group" "rds_subnet" {
  subnet_ids          = "${var.rds_subnet_ids}"
  name                = "${var.project_name}-${var.env}-data-rdssg"

  tags {
    Project = "${var.project_name}"
    Env = "${var.env}"
    Type = "rdssg"
    Component = "data"
    Name = "${var.project_name}-${var.env}-data-rds"
  }
}