# mon-stack

A simple docker compose deployment of [prometheus], [node_exporter], and [grafana] for monitoring your local host.

Included in the grafana deployment is the [Node Exporter Full] dashboard.

[prometheus]: https://github.com/prometheus/prometheus
[node_exporter]: https://github.com/prometheus/node_exporter
[grafana]: https://github.com/grafana/grafana
[Node Exporter Full]: https://grafana.com/grafana/dashboards/1860-node-exporter-full/

## Usage

```shell
$ make up
--- fixing directories
mkdir: created directory 'data/prometheus/data'
changed ownership of 'data/prometheus/data' from root:root to 65534:65534
--- starting services
docker compose up -d
[+] Running 4/4
 ✔ Network mon-stack_default            Created    0.1s
 ✔ Container mon-stack-node_exporter-1  Started    0.3s
 ✔ Container mon-stack-prometheus-1     Started    0.4s
 ✔ Container mon-stack-grafana-1        Started    0.4s
```

After a few seconds you should be able to access grafana on [localhost:3000].

[localhost:3000]: http://localhost:3000

To stop all services, you can use `make down`.

```shell
$ make down
--- stopping services
docker compose down
[+] Running 4/4
 ✔ Container mon-stack-prometheus-1     Removed    0.3s 
 ✔ Container mon-stack-node_exporter-1  Removed    0.2s 
 ✔ Container mon-stack-grafana-1        Removed    0.3s 
 ✔ Network mon-stack_default            Removed    0.3s 
```

For additional commands see `make help`.

```shell
$ make help
help    Prints this help message.
up      Starts services.
down    Stops services.
clean   Stops services and deletes data directories.
```
