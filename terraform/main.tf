# This section works in v. +0.13 :(
# terraform {
#   required_providers {
#     yandex = {
#       source = "yandex-cloud/yandex"
#     }
#   }
#   required_version = "~> 0.35"
# }

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "app" {
  count = 2
  name = "reddit-app-t7m-${count.index}"
  zone = var.zone_instance

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

  metadata = {
    # ssh-keys = "ubuntu:${file("~/.ssh/ubuntu.pub")}"
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      # image_id = "fd8ivvbjadib8a692ich"
      image_id = var.image_id
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    # subnet_id = "e9b9gdbsjthlkef7143p"
    subnet_id = var.subnet_id
    nat       = true
  }

  connection {
    type  = "ssh"
    # host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
    host  = self.network_interface[0].nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = "${file(var.private_key_path)}"
  }
}

resource "yandex_lb_target_group" "tg-app" {
  name      = "my-target-group"
  region_id = var.region_id

  dynamic "target" {
    for_each   = yandex_compute_instance.app.*.network_interface.0.ip_address
    content {
      subnet_id = var.subnet_id
      address = target.value
    }
  }
}
