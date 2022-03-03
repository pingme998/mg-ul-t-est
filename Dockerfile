FROM developeranaz/mega-index:superbeta
RUN apt update
COPY entrypoint.sh /entrypoint.sh 
COPY quota /home/quota
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
