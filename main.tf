resource "aws_instance" "my_server" {
  ami           = "ami-02b2c1b57c5105166"
  instance_type = "t3.micro"

  tags = {
    Name = "webhook-test-server"
  }
}
