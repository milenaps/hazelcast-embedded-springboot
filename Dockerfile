#FROM adoptopenjdk:11-jre-hotspot as builder
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} app.jar
#RUN java -Djarmode=layertools -jar app.jar extract
#
#FROM adoptopenjdk:11-jre-hotspot
#COPY --from=builder dependencies/ ./
#COPY --from=builder snapshot-dependencies/ ./
#COPY --from=builder spring-boot-loader/ ./
#COPY --from=builder application/ ./
#ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]

FROM adoptopenjdk/openjdk11:alpine
COPY target/*.jar app.jar
COPY config/* /config/
ENTRYPOINT exec java ${JAVA_OPTS} -jar app.jar
