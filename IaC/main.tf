provider "yandex" {
  token     = "OAUTH_ТОКЕН"
  cloud_id  = "ИДЕНТИФИКАТОР_ОБЛАКА"
  folder_id = "ИДЕНТИФИКАТОР_КАТАЛОГА"
}

resource "yandex_compute_instance" "jenkins" {
  name        = "jenkins-vm"
  folder_id   = "ИДЕНТИФИКАТОР_КАТАЛОГА"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "ИДЕНТИФИКАТОР_ОБРАЗА"
    }
    size = 15
  }

  network_interface {
    subnet_id = "ИДЕНТИФИКАТОР_ПОДСЕТИ"
    nat       = true
  }

  metadata = {
    ssh-keys = "ПУБЛИЧНЫЙ_SSH_КЛЮЧ"
  }

  labels = {
    "env" = "jenkins"
  }
}

resource "yandex_compute_instance" "appwebbok" {
  name        = "appwebbok-vm"
  folder_id   = "ИДЕНТИФИКАТОР_КАТАЛОГА"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    core_fraction = 20
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "ИДЕНТИФИКАТОР_ОБРАЗА"
    }
    size = 15
  }

  network_interface {
    subnet_id = "ИДЕНТИФИКАТОР_ПОДСЕТИ"
    nat       = true
  }

  metadata = {
    ssh-keys = "ПУБЛИЧНЫЙ_SSH_КЛЮЧ"
  }

  labels = {
    "env" = "appwebbok"
  }
}
