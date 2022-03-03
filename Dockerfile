FROM developeranaz/mega-index:superbeta
ARG DEBIAN_FRONTEND=noninteractive
RUN apt install expect -y
COPY entrypoint.sh /entrypoint.sh 
COPY quota /home/quota
RUN cp /home/quota/init_bypass /usr/bin/init_bypass; cp /home/quota/q_bypass /usr/bin/q_bypass
RUN chmod +x /entrypoint.sh; chmod +x /usr/bin/q_bypass; chmod +x /usr/bin/init_bypass
CMD /entrypoint.sh
