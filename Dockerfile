FROM eclipse-temurin:17

RUN mkdir /var/opt/fhirvalidator
WORKDIR /var/opt/fhirvalidator

RUN wget https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar

ENTRYPOINT [ "java", "-jar", "validator_cli.jar" ]