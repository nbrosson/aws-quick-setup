variable "key_pair_path" {
  type = map
  default = {
    public_key_path = "ssh-keys/aws_ssh_key.pub",
    private_key_path = "ssh-keys/aws_ssh_key",
  }
}