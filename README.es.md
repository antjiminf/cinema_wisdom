# 🎬 Cinema Wisdom

🌍 Disponible en: [English](README.md)

Cinema Wisdom es una aplicación desarrollada en Flutter que ofrece a los usuarios información detallada sobre películas, incluyendo datos provenientes de The Movie Database (TMDB). La aplicación permite explorar películas, obtener detalles específicos y gestionar preferencias personales.

## 🚀 Características principales

- **Exploración de películas**: Navega por una amplia selección de películas disponibles en la base de datos de TMDB.
- **Detalles de películas**: Accede a información detallada de cada película, incluyendo sinopsis, elenco y más.
- **Gestión de favoritos**: Marca tus películas preferidas para un acceso rápido en el futuro.
- **Búsqueda avanzada**: Utiliza filtros y criterios de búsqueda para encontrar películas según tus intereses.

## 🛠️ Requisitos del sistema

- **Flutter**: Asegúrate de tener instalada la versión más reciente de Flutter. Puedes verificar tu versión actual ejecutando:
  
  ```bash
  flutter --version
  ```

- **Dependencias**: Las dependencias del proyecto están especificadas en el archivo `pubspec.yaml`. Asegúrate de instalar todas las dependencias necesarias antes de ejecutar la aplicación.

## 📦 Instalación

1. **Clona el repositorio** en tu máquina local:

   ```bash
   git clone https://github.com/antjiminf/cinema_wisdom.git
   ```

2. **Navega al directorio del proyecto**:

   ```bash
   cd cinema_wisdom
   ```

3. **Configura las variables de entorno**:
   - Renombra el archivo `.env.template` a `.env`.
   - Actualiza las variables de entorno en el archivo `.env` con tus propias claves y configuraciones, especialmente la clave de TMDB.

4. **Instala las dependencias**:

   ```bash
   flutter pub get
   ```

5. **Genera el código necesario**:
   - Después de modificar cualquier entidad en la capa de dominio, ejecuta:

   ```bash
   flutter pub run build_runner build
   ```

## 🚀 Ejecución en modo desarrollo

Para ejecutar la aplicación en modo desarrollo:

1. **Inicia la aplicación**:

   ```bash
   flutter run
   ```

   Esto lanzará la aplicación en el dispositivo o emulador conectado.

## 📱 Prueba interna en Google Play

Cinema Wisdom está disponible en una prueba interna a través de **Google Play Console**.  
Si deseas probar la aplicación antes de su lanzamiento oficial, envíame un correo electrónico con tu cuenta de Google para que te agregue a la lista de testers.  

📩 **Correo de contacto**: [Aquí!](mailto:antoniojimenezinfante@gmail.com)