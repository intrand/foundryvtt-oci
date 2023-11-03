# foundryvtt-oci
Scripts and instructions of how to build a FoundryVTT OCI image

1. Download the FoundryVTT zip for Linux and place it next to build.sh (in the same directory as it).

2. Build with:

    ```
    ./build.sh 11.314
    ```


3. Run with:

    ```
    docker run \
      -d \
      --name "foundry-server1" \
      --hostname "foundry-server1" \
      --restart always \
      -p 8000:30000 \
      -v /opt/foundry/server1:/opt/foundrydata
      foundryvtt:11.314;
    ```
