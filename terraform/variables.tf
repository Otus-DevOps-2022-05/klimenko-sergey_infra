variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  description = "/home/user/.ssh/ubuntu.pub"
}
variable image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "/home/user/keys/terraform-svc-acc-key.json"
}
variable private_key_path {
  description = "/home/user/.ssh/ubuntu"
}
variable zone_instance {
  description = "Zone of compute instance"
  default     = "ru-central1-a"
}
