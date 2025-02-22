# Используем базовый образ R с Shiny
FROM rocker/shiny:latest

# Устанавливаем необходимые пакеты R
RUN install2.r --error \
    rms \
    DynNom \
    shiny

# Копируем файлы приложения в контейнер
COPY . /srv/shiny-server/my_app

# Устанавливаем рабочую директорию
WORKDIR /srv/shiny-server/my_app

# Открываем порт для Shiny
EXPOSE 8080

# Запускаем Shiny-приложение
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/my_app', host='0.0.0.0', port=8080)"]