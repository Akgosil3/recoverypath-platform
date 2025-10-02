provider "google" {
  project = "recovery-rise-za"
  region  = "africa-south1"
}

resource "google_sql_database_instance" "userprofile" {
  name             = "prp-sa-user-profile-db"
  database_version = "POSTGRES_15"
  region           = "africa-south1"
  settings {
    tier = "db-perf-optimized-N-8"
    disk_size = 50
  }
}

resource "google_secret_manager_secret" "db_password" {
  secret_id = "prp-sa-db-secret"
  replication { automatic = true }
}

resource "google_cloud_run_service" "frontend" {
  name     = "prp-sa-frontend-service"
  location = "africa-south1"
  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
        ports { container_port = 8080 }
      }
    }
  }
}

resource "google_cloud_run_service" "chatbot" {
  name     = "prp-sa-mimi-chatbot-service"
  location = "africa-south1"
  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
        ports { container_port = 8080 }
      }
    }
  }
}

resource "google_pubsub_topic" "research_events" {
  name = "prp-sa-research-events"
}

resource "google_bigquery_dataset" "research_dw" {
  dataset_id = "prp_sa_research_data_warehouse"
  location   = "US"
}