import json

# Load JSON output from Terraform
with open("ip_output.json") as f:
    data = json.load(f)

public_ips = data["instance_public_ips"]["value"]
private_ips = data["instance_private_ips"]["value"]

with open("instance_ips.txt", "w") as f:
    f.write("Public IPs:\n")
    for ip in public_ips:
        f.write(f"{ip}\n")
    f.write("\nPrivate IPs:\n")
    for ip in private_ips:
        f.write(f"{ip}\n")

print("IP addresses saved in instance_ips.txt")
