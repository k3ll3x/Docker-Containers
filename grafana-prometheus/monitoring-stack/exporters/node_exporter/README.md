# Node Exporter Setup and Usage

The Node Exporter is a Prometheus exporter that exposes various hardware and OS metrics. It is designed to be run on the target machine and collects metrics such as CPU usage, memory usage, disk I/O, and network statistics.

## Installation

To install the Node Exporter, follow these steps:

1. **Download the Node Exporter**:
   Visit the [Node Exporter releases page](https://github.com/prometheus/node_exporter/releases) and download the latest version suitable for your operating system.

2. **Extract the Binary**:
   After downloading, extract the binary from the tarball:
   ```
   tar xvfz node_exporter-*.*.tar.gz
   ```

3. **Run the Node Exporter**:
   You can run the Node Exporter directly from the command line:
   ```
   ./node_exporter
   ```
   By default, it will start on port `9100`.

## Configuration

The Node Exporter does not require any configuration files. However, you can customize its behavior using command-line flags. For example, to change the listening address or port, use:
```
./node_exporter --web.listen-address=":9101"
```

## Prometheus Configuration

To scrape metrics from the Node Exporter, you need to add it as a target in your Prometheus configuration (`prometheus/prometheus.yml`):

```yaml
scrape_configs:
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['<NODE_EXPORTER_IP>:9100']
```

Replace `<NODE_EXPORTER_IP>` with the IP address of the machine running the Node Exporter.

## Accessing Metrics

Once the Node Exporter is running and Prometheus is configured to scrape it, you can access the metrics at:
```
http://<NODE_EXPORTER_IP>:9100/metrics
```

## Grafana Dashboard

To visualize the metrics collected by the Node Exporter, you can use the community Grafana dashboard with ID `1860`. This dashboard is pre-configured to display various metrics collected by the Node Exporter.

## Conclusion

The Node Exporter is a powerful tool for monitoring system metrics. By integrating it with Prometheus and Grafana, you can gain valuable insights into the performance and health of your systems.