FROM dtzar/helm-kubectl:2.12.3

RUN wget -q [] -O /usr/local/bin/aws-iam-authenticator \
  && chmod +x /usr/local/bin/aws-iam-authenticator

# The following need to be set at runtime.
ENV AWS_ACCESS_KEY_ID "TBD"
ENV AWS_SECRET_ACCESS_KEY "TBD"

ENTRYPOINT = ["helm"]

# The following CMD is an example, Override at run time.
# Mount the chart to /root/chart
# Mount the config to /root/.kube
# Don't forget the AWS creds.
CMD ["upgrade", "myRelease", "/root/chart", "-i", "-f", "values.yaml", "--set", "foo=fii,bar=bor"]
