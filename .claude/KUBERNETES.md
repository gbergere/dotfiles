# Kubernetes Standards

## Resource Naming

### Container Naming
**Main container in Pods must always be named `app`:**
```yaml
spec:
  containers:
  - name: app
    image: registry.example.com/service-name
```

### Resource Naming Convention
- Use consistent, descriptive names across related resources
- Match service name to deployment selector labels
- Use the same base name for namespace, deployment, service, and ingress

## Resource Management

### Resource Requests and Limits
**Pods must always have at least resource requests defined. Limits are strongly recommended:**

```yaml
resources:
  requests:
    cpu: "250m"
    memory: "256Mi"
  limits:
    cpu: "500m"
    memory: "512Mi"
```

**Guidelines:**
- Always define `requests` (required)
- Always define `limits` (strongly recommended)
- Requests should reflect baseline resource usage
- Limits should prevent resource exhaustion
- Memory limits should be 1.5-2x requests
- CPU limits should be 2x requests or higher

**Common patterns:**
- Small services: 250m CPU / 256Mi memory → 500m CPU / 512Mi memory
- Medium services: 500m CPU / 1Gi memory → 1000m CPU / 2Gi memory
- Large services: 1000m CPU / 2Gi memory → 2000m CPU / 4Gi memory

## Health Checks

### Readiness Probes
Always include readiness probes to prevent traffic to unhealthy pods:

```yaml
readiness_probe {
  http_get {
    path = "/health"
    port = 8080
  }
  initial_delay_seconds = 10
  period_seconds        = 5
  timeout_seconds       = 3
  failure_threshold     = 2
}
```

**Probe Types:**
- **HTTP GET**: For services with health endpoints
- **TCP Socket**: For services that only need connection checks
- **Exec**: For custom health check scripts

### Liveness Probes
Use liveness probes cautiously. Only add when necessary to restart failed containers:
- Set higher failure thresholds than readiness probes
- Avoid for services that self-recover
- Use for services prone to deadlocks or hangs

## Configuration Management

### Environment Variables vs Secrets
**Separate sensitive from non-sensitive configuration:**

**Non-sensitive configuration** (env blocks):
```yaml
env:
  - name: NODE_ENV
    value: "production"
  - name: LOG_LEVEL
    value: "info"
  - name: API_TIMEOUT
    value: "30"
```

**Sensitive configuration** (secrets):
```yaml
env_from:
  - secret_ref:
      name: app-secrets

# Or individual secret values:
env:
  - name: DATABASE_PASSWORD
    value_from:
      secret_key_ref:
        name: app-secrets
        key: DATABASE_PASSWORD
```

**What belongs in secrets:**
- API keys and tokens
- Database passwords and connection strings
- Private keys and certificates
- OAuth credentials
- Any sensitive credential or PII

**What can be in env:**
- Service URLs (non-sensitive)
- Feature flags
- Log levels
- Timeouts and limits
- Service configuration IDs

## Ingress Configuration

### Standard Annotations
```yaml
annotations = {
  "kubernetes.io/ingress.class"        = "nginx"
  "cert-manager.io/cluster-issuer"     = "letsencrypt-cloudflare"
}
```

### DNS Management
**Automatic DNS (external-dns manages records):**
```yaml
annotations = {
  "external-dns.alpha.kubernetes.io/cloudflare-proxied" = "true"
}
```

**Manual DNS (ignore external-dns):**
```yaml
annotations = {
  "external-dns.alpha.kubernetes.io/controller" = "ignore-me"
}
```

### CORS Configuration
Enable CORS via ingress annotations when needed:
```yaml
annotations = {
  "nginx.ingress.kubernetes.io/enable-cors"            = "true"
  "nginx.ingress.kubernetes.io/cors-allow-origin"      = "https://app.example.com, http://localhost:3000"
  "nginx.ingress.kubernetes.io/cors-allow-methods"     = "GET, POST, PUT, DELETE, PATCH, OPTIONS"
  "nginx.ingress.kubernetes.io/cors-allow-credentials" = "true"
}
```

## Deployment Best Practices

### Image Management
Use lifecycle rules to ignore image tag changes when managed by CI/CD:
```yaml
lifecycle {
  ignore_changes = [spec[0].template[0].spec[0].container[0].image]
}
```

### Replica Configuration
- Start with 1 replica for staging environments
- Use 2+ replicas for production high-availability
- Consider HPA (Horizontal Pod Autoscaler) for variable load

### Service Types
- **ClusterIP**: Default for internal services (most common)
- **LoadBalancer**: Only for services requiring external IPs
- **NodePort**: Avoid; use Ingress instead

## Namespace Organization

### Namespace per Application
Create dedicated namespaces for logical separation:
```yaml
resource "kubernetes_namespace_v1" "app_name" {
  metadata {
    name = "app-name"
  }
}
```

**Benefits:**
- Resource isolation
- RBAC boundaries
- Quota management
- Clear ownership

## Labels and Selectors

### Standard Labels
Always include consistent labels:
```yaml
labels = {
  app     = "service-name"
  version = "v1.0"
  env     = "production"
}
```

### Selector Matching
Ensure deployment selectors match pod labels:
```yaml
# Deployment selector
selector {
  match_labels = {
    app = "service-name"
  }
}

# Pod template labels
template {
  metadata {
    labels = {
      app = "service-name"
    }
  }
}

# Service selector
spec {
  selector = {
    app = "service-name"
  }
}
```

## Anti-Patterns

**Avoid:**
- Pods without resource requests
- Missing health checks for services with traffic
- Hardcoded credentials in manifests
- Using `latest` image tags in production
- Running as root user unnecessarily
- Services without resource limits (leads to resource exhaustion)
- Complex bash scripts in probe exec commands
- Ingress without TLS in production
- Mixing multiple applications in one namespace
