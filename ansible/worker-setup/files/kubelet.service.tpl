[Unit]
Description=Kubernetes Kubelet
Documentation=https://github.com/kubernetes/kubernetes
After=cri-containerd.service
Requires=cri-containerd.service

[Service]
ExecStart=/usr/local/bin/kubelet \
  --allow-privileged=true \
  --anonymous-auth=false \
  --authorization-mode=Webhook \
  --client-ca-file=/var/lib/kubernetes/ca.pem \
  --cloud-provider= \
  --cluster-domain=cluster.local \
  --container-runtime=remote \
  --container-runtime-endpoint=unix:///var/run/containerd/containerd.sock \
  --image-pull-progress-deadline=2m \
  --kubeconfig=/var/lib/kubelet/kubeconfig \
  --network-plugin=cni \
  --pod-cidr=${subnetCidr} \
  --register-node=true \
  --runtime-request-timeout=15m \
  --tls-cert-file=/var/lib/kubelet/{{ host_name }}.pem \
  --tls-private-key-file=/var/lib/kubelet/{{ host_name }}-key.pem \
  --v=2
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target