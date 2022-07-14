variable public_key_path {
  # Описание переменной
  # description = "/home/user/.ssh/ubuntu.pub"
  description = "Path to the public key used for ssh access"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  # default = "reddit-db-base"
  default = "fd8v0h0pbb495jgfbqbm"
}
variable subnet_id {
  description = "Subnets for modules"
}
