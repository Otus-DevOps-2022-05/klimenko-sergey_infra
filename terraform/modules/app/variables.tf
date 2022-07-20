variable public_key_path {
  # Описание переменной
  # description = "/home/user/.ssh/ubuntu.pub"
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit db"
  # default = "reddit-app-base"
  default = "fd8139f53dovgn4nhs9k"
}
variable subnet_id {
  description = "Subnets for modules"
}
