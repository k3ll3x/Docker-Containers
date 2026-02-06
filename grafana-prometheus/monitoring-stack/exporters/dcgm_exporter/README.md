# DCGM Exporter Setup and Usage

The DCGM (Data Center GPU Manager) Exporter is a tool that collects GPU metrics from NVIDIA GPUs. This document provides instructions on how to set up and use the DCGM Exporter in conjunction with Prometheus and Grafana for monitoring GPU performance.

## Prerequisites

- Ensure that you have Docker and Docker Compose installed on your system.
- You need to have NVIDIA drivers installed on your host machine to access GPU metrics.

## Setup Instructions

1. **Clone the Repository**: Start by cloning the monitoring stack repository to your local machine.

   ```bash
   git clone <repository-url>
   cd monitoring-stack
   ```

2. **Configure Docker Compose**: The `docker-compose.yml` file in the root of the project defines the services for Prometheus, Grafana, and the DCGM Exporter. Ensure that the DCGM Exporter service is included in your `docker-compose.yml` file.

3. **Build and Run the Stack**: Use Docker Compose to build and run the monitoring stack.

   ```bash
   docker-compose up -d
   ```

4. **Access Prometheus**: Once the services are running, you can access Prometheus at `http://localhost:9090`. Here, you can verify that the DCGM Exporter is correctly scraping GPU metrics.

5. **Access Grafana**: Grafana can be accessed at `http://localhost:3000`. Log in using the default credentials (admin/admin) and change the password when prompted.

6. **Import Dashboard**: The community dashboard with ID 1860 is already configured in the Grafana provisioning files. You can find it under the dashboards section in Grafana.

## Metrics Collected

The DCGM Exporter collects a variety of GPU metrics, including but not limited to:

- GPU utilization
- Memory usage
- Temperature
- Power consumption
- ECC errors

These metrics can be visualized in Grafana using the provided dashboard.

## Troubleshooting

- If you encounter issues with the DCGM Exporter not collecting metrics, ensure that the NVIDIA drivers are correctly installed and that the Docker container has access to the GPU.
- Check the logs of the DCGM Exporter container for any error messages.

## Additional Resources

- [NVIDIA DCGM Documentation](https://docs.nvidia.com/datacenter/dcgm/latest/index.html)
- [Prometheus Documentation](https://prometheus.io/docs/introduction/overview/)
- [Grafana Documentation](https://grafana.com/docs/grafana/latest/)