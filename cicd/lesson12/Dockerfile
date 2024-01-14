# Используем базовый образ
FROM openjdk:17-jdk

# Установка переменных среды
ENV DB_URL=jdbc:postgresql://158.160.127.224:5432/db_webboks

# Директория приложения
WORKDIR /app

# Копируем необходимые файлы в директорию приложения
COPY ./DigitalLibrary-0.0.1-SNAPSHOT.jar /app/

# Команда для запуска контейнера
CMD ["java", "-jar", "/app/DigitalLibrary-0.0.1-SNAPSHOT.jar"]
