terraform {
backend "s3"{
    bucket  ="terraformstate1be9c2d7"
    region  = "us-east-1"
    key     ="backend.tf"
    dynamodb_table  ="terraformstatelock"
    }
}
