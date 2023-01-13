# FHIR Validator Docker Image

This respository provides a Docker image for using the FHIR Validator CLI from https://github.com/hapifhir/org.hl7.fhir.core without installing Java on your local machine.

This allows to validate one or multiple FHIR resources against an IG and/or a profile.

## Building

Requirements:

* Docker

There is no further configuration needed to build the image. Just run from this directory:

```bash
docker build --tag <image name> .
```

## Validate

This image is built to allow all arguments to be direclty forwarded to the FHIR Validator CLI.

```bash
docker run --rm [<mounts>] <image name> <arguments>
```

For convience a directory to locally store the FHIR packages can be mounted to avoid downloading them everytime the validator is started.

```bash
docker run --rm -v <fhir package dir>:/root/.fhir <image name>
```

Validate a single resource file located in `<directory>`

```bash
docker run --rm -v <directory>:/resources <image name> /resources/<file name>
```
Validate all resource files in `<directory>`

```bash
docker run --rm -v <directory>:/resources <image name> /resources
```
When validating against a specific profile use the `-ig` and `-profile` argument

```bash
docker run --rm [<mounts>] <image name> <arguments> [-ig <IG>] -profile <profile>
```
The `<profile>` is specified using the canonical URL. `<IG>` can be specified either using the canonical URL or the package name. It `<IG>` is omitted the FHIR core spec is assumed.

For further information about arguments and the general usage see https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator
