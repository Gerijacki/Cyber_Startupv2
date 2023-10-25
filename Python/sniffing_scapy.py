from scapy.all import *
   
   def packet_callback(packet):
       if packet.haslayer(HTTPRequest):
           print(packet.show())
   
   sniff(prn=packet_callback, store=0)