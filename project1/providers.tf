provider "aws" {
  region                  = "us-east-2"
  shared_config_files     = ["~/.aws/config"]
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}