# Dockerized Express & MongoDB Application

Цей репозиторій містить приклад Express-додатка, контейнеризованого за допомогою Docker та Docker Compose з інтеграцією MongoDB.

## Передумови

- [Docker](https://www.docker.com/products/docker-desktop/)
- [Docker Compose](https://docs.docker.com/compose/)

## Запуск проєкту

1. Клонувати репозиторій та перейти до каталогу проєкту:
   ```bash
   git clone <repository-url>
   cd fullstack_hw68
   ```

2. Запустити сервіси:
   ```bash
   docker compose up --build
   ```

3. Відкрити у браузері [http://localhost:3000](http://localhost:3000) та переконатися, що сервер повертає JSON-відповідь з вітальним повідомленням.

4. Зміни в коді (наприклад, у `server.js`) автоматично підхоплюються завдяки змонтованим томам. Перезапуск контейнерів не потрібен для відображення оновлень під час розробки.

## Перевірка з'єднання з MongoDB

- Основний маршрут `/` повертає інформацію про стан з'єднання з MongoDB.
- Додатковий маршрут `/health` повертає `status: ok`, якщо з'єднання з MongoDB встановлено.

## Зупинка сервісів

Щоб зупинити та видалити контейнери, виконайте:
```bash
docker compose down
```

## Структура проєкту

- `server.js` – вихідний код Express-додатка.
- `Dockerfile` – інструкція для збірки образу додатка.
- `docker-compose.yml` – конфігурація сервісів (Express та MongoDB).
- `.dockerignore` – список файлів та тек, які не потрібно копіювати в образ Docker.

## Налаштування змінних середовища

Додаток використовує змінну середовища `MONGODB_URI`, що визначена у `docker-compose.yml`. За потреби її можна змінити у файлі Compose або передати через `.env` файл.

## Усунення несправностей

Якщо команда `docker` або `docker compose` не знайдена, переконайтеся, що Docker встановлено та додано до `PATH`.

1. Перевірте наявність Docker CLI:
   ```bash
   docker --version
   docker compose version
   ```
   Якщо команди повертають помилку `command not found`, встановіть [Docker Desktop](https://www.docker.com/products/docker-desktop/) (для Windows/macOS) або [Docker Engine](https://docs.docker.com/engine/install/) разом із Docker Compose Plugin (для Linux).
2. Після встановлення перезапустіть термінал або систему, щоб змінні середовища оновилися.
3. На Linux переконайтеся, що ваш користувач доданий до групи `docker`, або запускайте команди з `sudo`.

Тільки після успішного виконання команд вище запускайте `docker compose up --build`.

