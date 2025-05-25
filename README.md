# devbox
EC2 Instance that installs `k3s`, connects to a tailnet, and adds an SSH key to `/home/ubuntu/.ssh/auhtorized_keys`.

## Prerequisites
1. Tailscale account and an [auth key](https://tailscale.com/kb/1085/auth-keys).
2. IAM role that has necessary permissions. [Example](https://github.com/hammittd/aws-scripts/blob/e0c813639a8da5b3fff04ea09a4dfd6e96a7f5e4/attach-policy.sh).
3. An SSH public key.
4. An S3 Bucket named `devbox-tfstate`.

## Notes
This creates everything in `us-east-2`.
Connect with: `ssh ubuntu@devbox`
