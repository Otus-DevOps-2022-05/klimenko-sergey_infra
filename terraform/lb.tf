resource "yandex_lb_network_load_balancer" "lb" {
  name = "lb-reddit-app"

  listener {
    name = "my-listener"
    port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.tg-app.id

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        # path = "/ping"
      }
    }
  }
}
