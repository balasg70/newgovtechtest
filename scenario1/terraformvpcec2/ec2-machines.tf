resource "aws_instance" "countapphost" {
  ami           = lookup(var.AmiLinux, var.region)
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = aws_subnet.PublicAZA.id
  vpc_security_group_ids = [aws_security_group.WebApp.id]
  #key_name = var.key_name
  key_name = "Testkey"
  tags = {
        Name = "ec2_devops"
  }
  user_data = <<HEREDOC
  #!/bin/bash
  sudo yum update -y
  sudo amazon-linux-extras install nginx1 -y
  sudo systemctl start nginx
  sudo systemctl enable nginx
   #yum install -y nginx
   #service nginx start
   #chkconfig nginx on
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip -qq awscliv2.zip
  sudo ./aws/install
   #aws configure
  aws configure set aws_access_key_id ABCDEFGHIJKLMNOP
  aws configure set aws_secret_access_key xbdwsdADDS/ssfsfa/afzfASADQASAd
  aws configure set default.region eu-west-1
  aws s3 cp --recursive s3://bucket-name/$bucket /var/www/ --profile myaccount
  echo "<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type"
		content="text/html; charset=UTF-8" />
	
</head>
	
<body>
<!-- give a suitable heading using h1 tag-->
		<h1>Increment and Decrement counter</h1>

		<div class="container">			
		<!-- adding button and heading to show the digits -->
		<!--increment() and decrement() functions on button click-->
			<button onclick="increment()">+</button>
			<h2 id="counting"></h2>
			<button onclick="decrement()">-</button>		
		</div>

</body>

</html>" >> /var/www/index.html
  echo "/*apply css properties to body tag*/

body {
	position: absolute;
	left: 0%;
	text-align: center;
}

/*apply css properties to container class*/

.container {
	justify-content: center;
	align-items: center;
	display: flex;
	height: 100%;
	text-align: center;
}

/*apply css properties to button tag*/

button {
	width: 90px;
	height: 60px;
	font-size: 30px;
	background-color: green;
	color: honeydew;
}

/*apply hover effect to button tag*/

button:hover {
	background-color: greenyellow;
	color: grey;
}

/*apply css properties to h2 tag*/

h2 {
	color: black;
	margin: 0 50px;
	font-size: 45px;
}

/*apply css properties to h1 tag*/

h1 {
	font-size: 35px;
	color: green;
	text-align: center;
	padding-left: 10%;
}" >> /var/www/CSS
  echo "//initialising a variable name data

var data = 0;

//printing default value of data that is 0 in h2 tag
document.getElementById("counting").innerText = data;

//creation of increment function
function increment() {
	data = data + 1;
	document.getElementById("counting").innerText = data;
}
//creation of decrement function
function decrement() {
	data = data - 1;
	document.getElementById("counting").innerText = data;
}" >> /var/www/countapp.js
HEREDOC
}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh
}

resource "aws_eip" "default" {
  vpc = true
  instance                  = aws_instance.countapphost.id
  #associate_with_public_ip  = "10.0.0.12"
  depends_on                = [aws_internet_gateway.gw]



