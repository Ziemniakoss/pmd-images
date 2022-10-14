FROM ziemniakoss/pmd-full as base

FROM  openjdk:8-jre-alpine as filteredDependecies
COPY --from=base /pmd /pmd
COPY libs-remover /libs-remover
RUN sh /libs-remover

FROM  openjdk:8-jre-alpine
COPY --from=filteredDependecies /pmd /pmd
COPY --from=base /usr/bin/pmd /usr/bin/pmd
RUN chmod +x /usr/bin/pmd
CMD ["sh"]

