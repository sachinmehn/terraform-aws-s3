# Input variable definitions

variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
  default = "23823823838"
}

variable "bucket_name-02" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
  default = "23823823"
}

variable "region" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
  default = "us-east-1"
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}

 variable "s3versioning" {
    type = string
    description = "This is enablement of versioning"
    default = "Enabled"
}