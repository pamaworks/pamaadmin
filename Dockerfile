FROM azul/zulu-openjdk-alpine:11
COPY ./build/libs/pamaadmin-0.0.1-SNAPSHOT.jar /tmp
WORKDIR /tmp
EXPOSE 58080
CMD ["java", "-jar", "pamaadmin-0.0.1-SNAPSHOT.jar"]