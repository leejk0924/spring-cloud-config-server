# 1. 베이스 이미지로 OpenJDK 사용
FROM openjdk:21-jdk-slim

# 2. 작업 디렉터리 설정
WORKDIR /app

# 3. 빌드된 JAR 파일을 컨테이너로 복사 (빌드 파일명은 `app.jar`로 가정)
COPY target/app.jar /app/app.jar

# 4. 애플리케이션 포트 설정
EXPOSE 8888

# 5. Spring Boot 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
