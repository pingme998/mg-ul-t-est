FROM developeranaz/mega-index:superbeta
RUN apt update
COPY entrypoint.sh /entrypoint.sh 
COPY quota /home/quota
RUN chmod +x /entrypoint.sh
RUN cp /home/quota/init_bypass /usr/bin/init_bypass; cp /home/quota/q_bypass /usr/bin/q_bypass
CMD /entrypoint.sh
