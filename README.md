# Run DNS Server with vagrant-linode plugin

install DNS server for my own domain name with vagrant-linode plugin

1. get LINODE_API_KEY from https://manager.linode.com/profile/api
```
	export LINODE_API_KEY=Gn1rKs9Rdik7YKvwQE1JGG5rZ05a~~~
```

2. install vagrant-linode plugin
```
	tz-dns_linode> vagrant-linode plugin install vagrant-linode
	cf. https://www.linode.com/docs/applications/configuration-management/vagrant-linode-environments
```

3. modify domain with yours
```
	ex) /tz-dns_linode/_support/vagrant/nserver/nserver.sh
		/tz-dns_linode/_support/vagrant/resource/db.tz.com
		/tz-dns_linode/_support/vagrant/resource/named.conf.local
		
		tz.com => yours.com
```
		
4. change instance information in setup.conf
```
	You can increase the number of instance.
```

5. vagrant destroy -f && vagrant up

6. vagrant ssh or ssh root@linode_ip_address
```
	dig @dns.tz.com tz.com
	
	;; ANSWER SECTION:
	tz.com.			604800	IN	A	178.79.168.252
	
	;; AUTHORITY SECTION:
	tz.com.			604800	IN	NS	ns.tz.com.	
```

7. check out webmin
```
	In the end of the console log, you can see like the webmin url.
	==> node1: ====================================
	==> node1: access to  https://45.33.3.194:10000
```

8. destroy the instance on linode
```
	vagrant destroy -f node1
```
	