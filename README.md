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
