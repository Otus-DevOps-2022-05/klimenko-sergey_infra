variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable region_id {
  description = "Region"
  default = "ru-central1"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  # description = "/home/user/.ssh/ubuntu.pub"
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  # description = "/home/user/keys/terraform-svc-acc-key.json"
  description = "key .json"
}
variable private_key_path {
  # description = "/home/user/.ssh/ubuntu"
  description = "Path to the private key"
}
variable zone_instance {
  description = "Zone of compute instance"
  default     = "ru-central1-a"
}
