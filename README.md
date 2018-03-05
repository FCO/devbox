# devbox

This project will simplify your development environment providing tools to make it easy.

### Quick Usage:
The fastest way to use this image, can be executing the following command:

```bash
>$ docker run fernandocorrea/devbox create_devbox | bash
>$ devbox
```

### Some useful commands:

To test C :
```bash
>$ ctest
```

```c
#include <stdio.h>

main() {
  printf("test.c\n");
}
```

To test Java :
```bash
>$ jtest
```

```java
public class Test {
        public static void main(String[] args) {
                System.out.println("Test");
        }
}
```

Available languages:
    * C
    * Java

### Execute a container inside a docker network:
```bash
>$ docker-compose ps

      Name                    Command               State            Ports
-----------------------------------------------------------------------------------
project-service1_1    /bin/sh -c java -javaagent ...   Up             8100/tcp
project-service2_1    /bin/sh -c java -javaagent ...   Up             8100/tcp
project-db_1        docker-entrypoint.sh postgres    Up             5432/tcp

>$ docker network ls

NETWORK ID          NAME                    DRIVER              SCOPE
038c3ac905ca        bridge                  bridge              local
1667d9b5b18f        project-docker          bridge              local

>$ devbox project-docker

>$ ping service1
PING service1 (172.19.0.3) 56(84) bytes of data.
64 bytes from project-service1.project-docker (172.19.0.3): icmp_seq=1 ttl=64 time=0.184 ms
64 bytes from project-service1.project-docker (172.19.0.3): icmp_seq=2 ttl=64 time=0.144 ms
64 bytes from project-service1.project-docker (172.19.0.3): icmp_seq=3 ttl=64 time=0.142 ms
64 bytes from project-service1.project-docker (172.19.0.3): icmp_seq=4 ttl=64 time=0.126 ms
64 bytes from project-service1.project-docker (172.19.0.3): icmp_seq=5 ttl=64 time=0.169 ms
--- service1 ping statistics ---
```
