# source : https://stackoverflow.com/questions/7885785/using-openssl-to-get-the-certificate-from-a-server
# With SNI
# If the remote server is using SNI (that is, sharing multiple SSL hosts on a single IP address) you will need to send the correct hostname in order to get the right certificate.
openssl s_client -showcerts -servername www.example.com -connect www.example.com:443 </dev/null

# Without SNI
# If the remote server is not using SNI, then you can skip -servername parameter:
openssl s_client -showcerts -connect www.example.com:443 </dev/null
