FROM dtzar/helm-kubectl:2.12.3

RUN apk -v --update add \
  python py-pip \
  && pip install -U awscli \
  && apk -v --purge del py-pip \
  && rm /var/cache/apk/*

RUN wget -q https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/0.4.0-alpha.1/aws-iam-authenticator_0.4.0-alpha.1_linux_amd64 -O /usr/local/bin/aws-iam-authenticator \
  && chmod +x /usr/local/bin/aws-iam-authenticator

# The following need to be set at runtime.
ENV AWS_ACCESS_KEY_ID "TBD"
ENV AWS_SECRET_ACCESS_KEY "TBD"

# The following CMD is an example, Override at run time.
# Mount the chart to /root/chart
# Mount the config to /root/.kube
# Don't forget the AWS creds.
CMD ["bash", "helm_deploy.sh"]
