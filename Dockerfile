FROM developeranaz/mega-index:superbeta
RUN apt update
COPY entrypoint.sh /entrypoint.sh 
COPY quota/init_bypass /usr/bin/init_bypass
COPY quota/init_h_login  /usr/bin/init_h_login 
COPY quota/q_bypass  /usr/bin/q_bypass
RUN chmod +x /usr/bin/q_bypass
RUN chmod +x /usr/bin/init_h_login 
RUN chmod +x /usr/bin/init_bypass
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
