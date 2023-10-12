variable "region" {
  default = "eu-west-2"
}
variable "AmiLinux" {
  type = map
  default = {
    eu-west-2 = "t2.micro"
    eu-west-1 = "t2.micro"
    us-east-1 = "t2.micro"
  }
}

variable "aws_access_key" {
  default = ""
  description = "the user aws access key"
}

variable "aws_secret_key" {
  default = ""
  description = "the user aws secret key"
}
variable "vpc-fullcidr" {
    default = "172.16.0.0/16"
  description = "the vpc cdir"
}
variable "Subnet-Public-AzA-CIDR" {
  default = "172.16.0.0/24"
  description = "the cidr of the subnet"
}
variable "Subnet-Private-AzA-CIDR" {
  default = "172.16.3.0/24"
  description = "the cidr of the subnet"
}
variable "key_name" {
  default = "Testkey"
  description = "the ssh key to use in the EC2 machines"
}
variable "DnsZoneName" {
  default = "ShaanAWSDNS.internal"
  description = "the internal dns name"
}
variable "kp_devops" {
  type        = string
  description = "EC2 Key pair name for the EC2"
}
=======
variable "region" {
  default = "eu-west-2"
}
variable "AmiLinux" {
  type = map
  default = {
    eu-west-2 = "t2.micro"
    eu-west-1 = "t2.micro"
    us-east-1 = "t2.micro"
  }
}

variable "aws_access_key" {
  default = "AKIAJUU5FDJ4B6ZWTCFA"
  description = "the user aws access key"
}

variable "aws_secret_key" {
  default = "FQB/v33sMjsKwMsU+Wwv2Fng6zzayJZeNif+XaXX"
  description = "the user aws secret key"
}
variable "vpc-fullcidr" {
    default = "172.16.0.0/16"
  description = "the vpc cdir"
}
variable "Subnet-Public-AzA-CIDR" {
  default = "172.16.0.0/24"
  description = "the cidr of the subnet"
}
variable "Subnet-Private-AzA-CIDR" {
  default = "172.16.3.0/24"
  description = "the cidr of the subnet"
}
variable "key_name" {
  default = "Testkey"
  description = "the ssh key to use in the EC2 machines"
}
variable "DnsZoneName" {
  default = "ShaanAWSDNS.internal"
  description = "the internal dns name"
}
variable "kp_devops" {
  type        = string
  description = "EC2 Key pair name for the EC2"
}
variable "test_name" {
  type = string
}
variable "open_bucket_prefix" {
  default = "s3-private-"
}
variable "env" {
    description = "Environment name"
}

variable "project_name" {
  description = "Name of the project"
}

variable "rds_instance_class" {
  description = "RDS instance class"
}

variable "rds_storage_type" {
  description = "RDS storage type"
  default = "gp2"
}

variable "rds_allocated_storage" {
  description = "RDS allocated storage"
}

variable "rds_db_password" {
  description = "RDS DB Password"
}

variable "rds_subnet_ids" {
  type = "list"
  description = "RDS Subnet IDs"
}

variable "rds_vpc_security_group_ids" {
  type = "list"
  description = "RDS List of VPC security groups to associate"
}

variable "rds_engine" {
  description = "RDS The engine to use (postgres, mysql, etc)"
}

variable "rds_engine_version" {
  description = "RDS The engine version to use"
}

output "endpoint" {
  description = "DB Endpoint"
  value = "${aws_db_instance.rds.endpoint}"
}

output "port" {
  description = "DB port"
  value = "${aws_db_instance.rds.port}"
}

output "dbname" {
  description = "DB name"
  value = "${aws_db_instance.rds.name}"
}
