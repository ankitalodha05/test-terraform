module "prod" {
    source = "../day-1"
    ami = "ami-071226ecf16aa7d96"
    instance_type = "t2.micro"
    key_name = "key"
    
  
}