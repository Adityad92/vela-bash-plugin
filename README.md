# vela-bash-plugin

#### build the image
docker build -t adicop49/vela-sample:bash .

#### publish the image
docker push adicop49/vela-sample:bash

### Troubleshooting 
#### To verify that the plugin performs the desired task, it can be executed locally via the command line:
```bash
docker run --rm \
  -e PARAMETER_METHOD="GET" \
  -e PARAMETER_URL="https://wynk.in/manifest.json" \
  target/vela-sample:bash
```
### Usage
#### After publishing the image to a Docker registry, it can be referenced in a pipeline:
```bash
version: "1"

steps:
  - name: sample bash plugin
    image: adicop49/vela-sample:bash
    pull: always
    parameters:
      url: https://wynk.in/manifest.json
      method: GET
```
