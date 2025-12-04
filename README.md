# 🌙 Mood Music – Encontre a playlist perfeita para o seu momento

O **Mood Music** é um aplicativo mobile desenvolvido em Flutter que recomenda playlists com base no humor do usuário.  
A ideia é simples: **você seleciona como se sente e o app encontra playlists que combinam com o seu estado emocional.**

---

## 🎯 Por que esse projeto é interessante?

- ✔ Arquitetura organizada (MVVM + Factory)  
- ✔ UI moderna e agradável  
- ✔ Consumo de API real  
- ✔ Scroll infinito  
- ✔ Login e cadastro funcionais  
- ✔ Navegação fluida entre telas  
- ✔ Ótimo projeto para portfólio  

---

## 🧠 Como o Mood Music funciona?

1. O usuário faz login ou cria uma conta  
2. Escolhe o sentimento atual  
3. O app faz requisição à API para buscar playlists relacionadas  
4. A playlist abre diretamente no YouTube  

---

## 🎨 Funcionalidades

### 🔹 Seleção de Sentimentos  
Organizados em três categorias:

- **Positivos**
- **Negativos**
- **Neutros / Reflexivos**

Cada sentimento leva a listas relacionadas ao mood selecionado.

---

### 🔹 Consumo de API  
As playlists carregadas incluem:

- ID  
- Título  
- Thumbnail  
- Link dinâmico do YouTube

Formato do link:

https://www.youtube.com/playlist?list= <ID>

---

### 🔹 Scroll Infinito  
Enquanto o usuário navega, o app continua carregando playlists automaticamente.

---

### 🔹 Tela de Configurações  
- Visualização de nome e e-mail  
- Sobre o app  
- Logout  

---

### 🔹 Login e Cadastro  
- Autenticação simulada  
- Armazenamento temporário do usuário logado  
- Redirecionamento para a tela inicial  

---

## 🧩 Arquitetura do Projeto

/scenes
/login
/mood
/home
/settings

/shared
/models
/services

/design_system
/theme
/widgets


Estrutura modular que facilita manutenção e escalabilidade.

---

## ⚙️ Tecnologias Utilizadas

- Flutter  
- Dart  
- Dio  
- URL Launcher  
- ChangeNotifier  
- Material Design  

---

## 🚀 Como Rodar o Projeto

```bash
flutter pub get
flutter run