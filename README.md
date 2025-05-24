# Spring-cloud-config-server project 

## usage

### Docker Image 생성 방법
Google Jib 을 사용하여 dockerfile 없이 Docker의 컨테이너 이미지 생성한다.
Docker 이미지 생성은 아래의 명령어를 통해 할 수 있다.
```text
./gradlew jibDockerBuild 
```

### 파일명 규칙
파일명은 일반적으로 아래의 형식을 따른다.
```
<applicaion-name>-<profile>.properties
```

`<application-name>` : 설정이 적용될 어플리케이션의 이름.
`<profile>` : Spring 프로파일 이름. `ex) dev, prod` 등
```shell
config-repo/
├── application.yml             # 모든 애플리케이션의 공통 기본 설정
├── application-dev.yml         # 모든 애플리케이션의 개발 환경 설정
├── application-prod.yml        # 모든 애플리케이션의 운영 환경 설정
├── serviceA.yml                # serviceA 애플리케이션의 공통 설정
├── serviceA-dev.yml            # serviceA 애플리케이션의 개발 환경 설정
├── serviceA-prod.yml           # serviceA 애플리케이션의 운영 환경 설정
├── serviceB.yml                # serviceB 애플리케이션의 공통 설정
└── serviceB-dev.yml            # serviceB 애플리케이션의 개발 환경 설정
```
파일명 규칙을 통해 Config Server 호출 예시
- /config/serviceA/default: serviceA.yml과 application.yml을 불러옴
- /config/serviceA/dev: serviceA-dev.yml, serviceA.yml, application-dev.yml, application.yml을 불러옴
- /config/serviceB/prod: serviceB-prod.yml, serviceB.yml, application-prod.yml, application.yml을 불러옴

# Reference
- https://docs.spring.io/spring-cloud-config/docs/current/reference/html/#_quick_start
- https://mangkyu.tistory.com/253
