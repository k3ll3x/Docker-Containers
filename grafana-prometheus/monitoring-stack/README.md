# Monitoring Stack

This project sets up a monitoring stack using Prometheus and Grafana to collect and visualize computer metrics, including CPU, GPU, and network statistics. The stack is composed of several components, each with its own configuration files.

## Project Structure

```
monitoring-stack
├── prometheus
│   ├── prometheus.yml          # Prometheus configuration file
│   └── rules
│       └── alert_rules.yml     # Alerting rules for Prometheus
├── grafana
│   ├── provisioning
│   │   ├── datasources
│   │   │   └── datasource.yml   # Grafana data source configuration
│   │   └── dashboards
│   │       └── dashboards.yml    # Dashboard provisioning configuration
│   └── dashboards
│       └── 1860.json            # Community Grafana dashboard JSON
├── exporters
│   ├── node_exporter
│   │   └── README.md            # Documentation for Node Exporter
│   └── dcgm_exporter
│       └── README.md            # Documentation for DCGM Exporter
├── docker-compose.yml           # Docker Compose configuration
├── .env                         # Environment variables for Docker Compose
├── .gitignore                   # Git ignore file
└── README.md                    # Project documentation
```

## Setup Instructions

1. **Clone the Repository**: 
   Clone this repository to your local machine.

2. **Install Docker and Docker Compose**: 
   Ensure that you have Docker and Docker Compose installed on your system.

3. **Configure Environment Variables**: 
   Edit the `.env` file to set any necessary environment variables for your setup.

4. **Start the Monitoring Stack**: 
   Navigate to the project directory and run the following command to start the services:
   ```
   docker-compose up -d
   ```

5. **Access Grafana**: 
   Once the services are running, you can access Grafana by navigating to `http://localhost:3000` in your web browser. The default login is `admin` for both username and password.

6. **Explore Dashboards**: 
   The community dashboard with ID 1860 is pre-configured and ready to use for visualizing the collected metrics.

## Exporters

- **Node Exporter**: 
  Collects hardware and OS metrics. Refer to `exporters/node_exporter/README.md` for setup instructions.

- **DCGM Exporter**: 
  Collects GPU metrics. Refer to `exporters/dcgm_exporter/README.md` for setup instructions.

## Contributing

Feel free to submit issues or pull requests to improve the project. Your contributions are welcome!