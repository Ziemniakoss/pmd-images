FROM alpine:3.16.2 as fetch-pmd
RUN wget https://github.com/pmd/pmd/releases/download/pmd_releases%2F6.50.0/pmd-bin-6.50.0.zip
RUN unzip pmd-bin-6.50.0.zip -d /pmd
RUN mv /pmd/pmd-bin-6.50.0/* /pmd

FROM  openjdk:8-jre-alpine
COPY --from=fetch-pmd /pmd /pmd
COPY pmd /usr/bin/pmd
RUN chmod +x /usr/bin/pmd
CMD ["sh"]
