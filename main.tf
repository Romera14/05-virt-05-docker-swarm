terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token = "${var.do_token}"
#  cloud_id  = var.cloud_id
  folder_id = "${var.do_folder_id}"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "server" {
  count = 1
  name = "server${count.index}"

  resources {
    cores  = 2
    memory = 2
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = "fd8oshj0osht8svg6rfs"
      size = 5
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }
  
  metadata = {
    user-data = "${file("/home/paromov/ansible_terr_dkr/meta.txt")}"
  }

}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}


output "server_name" {
  value = yandex_compute_instance.server[*].name
}

output "internal_ip_address_server" {
  value = yandex_compute_instance.server[*].network_interface.0.ip_address
}
output "external_ip_address_server" {
  value = yandex_compute_instance.server[*].network_interface.0.nat_ip_address
}
