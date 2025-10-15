
# Laravel Docker + Xdebug

A boilerplate setup to run a Laravel application using Docker, with Xdebug enabled for local PHP debugging.

## 📦 Features

- Laravel application running inside Docker containers  
- Preconfigured PHP container with Xdebug support  
- MySQL / MariaDB database container  
- Apache as web server  
- Easy host & network configuration

## 🧰 Prerequisites

Before you get started, you’ll need:

- Docker (Engine) installed  
- Docker Compose installed  
- Git  
- VSCode + [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) (you can try another editor / IDE, but this is the one I used for develop and test it)
- It was tested only in Linux, but I believe it will works fine in Windows too

## 🏗️ Setup & Installation
If you with, you can start a Laravel application in the way you think is better and just copy containers files to your repository, but if you want to use the Laravel application in this repository, here is the step-by-step:

1. Clone the repository  
   ```bash
   git clone https://github.com/devdiogenes/laravel-docker-xdebug.git
   cd laravel-docker-xdebug
   ```

2. Copy `.env.example` to `.env` and adjust configuration if needed  
   ```bash
   cp .env.example .env
   ```.

3. Open the folder in VSCode
    ```bash
    code .
    ```

4. Press Ctrl + Shift + P and open it as a dev container
<img width="668" height="131" alt="image" src="https://github.com/user-attachments/assets/44f215d4-bd36-46c6-b295-dd48c7cdcea5" />

5. Get your MariaDB container name
    ```bash
    docker ps
    ```

6. Set your MariaDB container name as DB_HOST in .env
<img width="270" height="71" alt="image" src="https://github.com/user-attachments/assets/c490f98a-5d74-4e7b-9f47-aca0d378235e" />

7. Open terminal in VSCode (inside remote container)

7. Install PHP dependencies
   ```bash
   composer install
   ```

8. Generate Laravel application key  
   ```bash
   docker-compose exec app php artisan key:generate
   ```

9. Run migrations  
   ```bash
   php artisan migrate
   ```

10. Access your application in the browser  
   The default URL is typically `http://127.0.0.1`

## 🤝 Contributing

Contributions, issues, and feature requests are welcome.

1. Fork the repo  
2. Create a feature branch (`git checkout -b feature/my-feature`)  
3. Commit your changes (`git commit -m "Add some feature"`)  
4. Push to the branch (`git push origin feature/my-feature`)  
5. Open a Pull Request  

## 📜 License

This project is open-sourced software licensed under the **MIT License**.  
