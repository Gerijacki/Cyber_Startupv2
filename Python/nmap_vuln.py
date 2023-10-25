import nmap
    
    target_host = "example.com"
    
    scanner = nmap.PortScanner()
    scanner.scan(target_host, arguments="-sV -O")
    
    for host in scanner.all_hosts():
        print(f"Host: {host}")
        print(f"Estado: {scanner[host].state()}")
        for proto in scanner[host].all_protocols():
            print(f"Protocolo: {proto}")
            ports = scanner[host][proto].keys()
            for port in ports:
                print(f"Puerto: {port}, Estado: {scanner[host][proto][port]['state']}")