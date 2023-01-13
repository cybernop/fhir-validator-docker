ARG JAVA_VERSION=17

FROM eclipse-temurin:${JAVA_VERSION}

ARG VAL_VERSION=5.6.89

RUN mkdir /var/opt/fhirvalidator
WORKDIR /var/opt/fhirvalidator

RUN wget https://github.com/hapifhir/org.hl7.fhir.core/releases/download/${VAL_VERSION}/validator_cli.jar

ENTRYPOINT [ "java", "-jar", "validator_cli.jar" ]