[fwBasic]
status = enabled
incoming = deny
outgoing = allow
routed = disabled

[Rule0]
ufw_rule = 631 ALLOW IN Anywhere
description = CUPS
command = /usr/sbin/ufw allow in from any to any port 631
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 631
iface = 
routed = 
logging = 

[Rule1]
ufw_rule = 8003 ALLOW IN Anywhere
description = Arco-Repo
command = /usr/sbin/ufw allow in from any to any port 8003
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 8003
iface = 
routed = 
logging = 

[Rule2]
ufw_rule = 8080 ALLOW IN Anywhere
description = Arch-Repo
command = /usr/sbin/ufw allow in from any to any port 8080
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 8080
iface = 
routed = 
logging = 

[Rule3]
ufw_rule = 5353/udp ALLOW IN Anywhere
description = PLEX Avahi discovery
command = /usr/sbin/ufw allow in proto udp from any to any port 5353
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = 

[Rule4]
ufw_rule = 137,138/udp ALLOW IN Anywhere
description = SAMBA
command = /usr/sbin/ufw allow in proto udp from any to any port 137,138
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 137,138/udp
iface = 
routed = 
logging = 

[Rule5]
ufw_rule = 139,445/tcp ALLOW IN Anywhere
description = SAMBA
command = /usr/sbin/ufw allow in proto tcp from any to any port 139,445
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 139,445/tcp
iface = 
routed = 
logging = 

[Rule6]
ufw_rule = 631 (v6) ALLOW IN Anywhere (v6)
description = CUPS
command = /usr/sbin/ufw allow in from any to any port 631
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 631
iface = 
routed = 
logging = 

[Rule7]
ufw_rule = 8003 (v6) ALLOW IN Anywhere (v6)
description = Arco-Repo
command = /usr/sbin/ufw allow in from any to any port 8003
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 8003
iface = 
routed = 
logging = 

[Rule8]
ufw_rule = 8080 (v6) ALLOW IN Anywhere (v6)
description = Arch-Repo
command = /usr/sbin/ufw allow in from any to any port 8080
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 8080
iface = 
routed = 
logging = 

[Rule9]
ufw_rule = 5353/udp (v6) ALLOW IN Anywhere (v6)
description = PLEX Avahi discovery
command = /usr/sbin/ufw allow in proto udp from any to any port 5353
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 5353/udp
iface = 
routed = 
logging = 

[Rule10]
ufw_rule = 137,138/udp (v6) ALLOW IN Anywhere (v6)
description = SAMBA
command = /usr/sbin/ufw allow in proto udp from any to any port 137,138
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 137,138/udp
iface = 
routed = 
logging = 

[Rule11]
ufw_rule = 139,445/tcp (v6) ALLOW IN Anywhere (v6)
description = SAMBA
command = /usr/sbin/ufw allow in proto tcp from any to any port 139,445
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 139,445/tcp
iface = 
routed = 
logging = 

