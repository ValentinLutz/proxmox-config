# ansible

```shell
make help
```

## create files for secrets

wireguard.secrets.yaml

```yaml
wireguard_server_private_key:
wireguard_client_public_key:
```

pihole.secrets.yaml

```yaml
# needs to be double sha256 encoded
# optional
web_password:
```
