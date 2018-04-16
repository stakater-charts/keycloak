# chart-keycloak

This repository contains 3 charts that are used to deploy keycloak to kubernetes.

- keycloak
- keycloak-db
- keycloak-db-storage

## Installing

Install `keycloak` chart

```bash
helm install --name keycloak chartmuseum/keycloak
```

Install `keycloak-db-storage` chart (Optional)

```bash
helm install --name keycloak-db-storage chartmuseum/keycloak-db-storage
```
Install `keycloak-db` chart

```bash
helm install --name keycloak-db chartmuseum/keycloak-db
```
