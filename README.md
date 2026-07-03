# 💾 OsirisLegacy

> **"When digital ownership becomes a lease, preservation becomes an act of resistance."**

**OsirisLegacy** es un sistema de gestión de biblioteca agnóstico, privado y autoalojado diseñado para catalogar y centralizar tus copias de seguridad (ROMs) y emuladores locales. 

Nace como respuesta técnica a la obsolescencia programada y la desaparición del formato físico. Este software devuelve el control total de los archivos al consumidor y actúa como una infraestructura local robusta, sin juzgar la procedencia del catálogo ni actuar como intermediario.

---

## 🛠️ Tech Stack & Aprendizaje Escalonado

El stack se ha seleccionado estratégicamente para afianzar las bases del desarrollo web nativo (Vanilla) y delegar el diseño en herramientas utilitarias que eviten la frustración con CSS tradicional:

*   **Runtime:** Electron (Entorno Node.js para interactuar con el Sistema Operativo)
*   **Backend / Lógica:** JavaScript Vanilla (ES6+)
*   **Persistencia:** Archivos SQL planos estructurados mediante SQLite (`better-sqlite3`) para dominar consultas relacionales directas sin ORMs
*   **Frontend:** HTML5 nativo + JavaScript Vanilla para manipulación directa del DOM
*   **Estilos y Maquetación:** Tailwind CSS (Clases utilitarias integradas en el HTML para lograr un acabado cyberpunk de forma ágil)

---

## 🗺️ Roadmap de Desarrollo Incremental

Para garantizar la robustez del software y facilitar el aprendizaje, el desarrollo se realiza de atrás hacia adelante: construyendo primero un motor sólido de datos antes de pintar interfaces.

### 📦 Fase 1: El Motor de Datos (Foco Actual 🛠️)
El objetivo es dominar la persistencia, el uso de SQL relacional y la lectura del sistema de archivos local desde Node.js.
- [ ] **Esquema SQL Puro:** Separación del diseño de datos en un script nativo `schema.sql` (`platforms`, `emulators`, `games`).
- [ ] **Persistencia Automatizada:** Lector en Node.js para procesar e inyectar el esquema DDL y transacciones en bloque (`db.transaction`).
- [ ] **File System Scanner:** Módulo en Node.js para leer directorios locales de forma eficiente y filtrar ROMs según su extensión.

### 🖥️ Fase 2: El Puente y la Interfaz Nativa (Próximo Hito 🚀)
Conectar procesos y maquetar la visualización del catálogo sin sobrecarga de frameworks.
- [ ] **Comunicación IPC segura:** Implementación del bridge de Electron (`preload.js`) para comunicar el frontend y el backend sin exponer Node.js al navegador.
- [ ] **UI Catálogo (Tailwind CSS):** Creación de un layout cyberpunk oscuro con buscador interactivo y rejilla de juegos responsiva.
- [ ] **Inyección de Datos (DOM):** Uso de JS Vanilla para renderizar dinámicamente las tarjetas de juegos basándose en el estado de SQLite.

---

## 🏗️ Estructura del Repositorio

```text
osirislegacy/
├── src/
│   ├── main.js           # Orquestador del ciclo de vida de Electron
│   ├── schema.sql        # Estructura DDL pura de la base de datos (Tablas e Índices)
│   ├── database.js       # Conexión a SQLite y ejecutor del script schema.sql
│   ├── scanner.js        # Lógica del backend para lectura del sistema de archivos
│   ├── preload.js        # Capa de seguridad y puente IPC (Inter-Process Communication)
│   ├── index.html        # Estructura e interfaz visual estructurada con Tailwind CSS
│   └── renderer.js       # Lógica del frontend y control directo del DOM
├── package.json          # Gestión de dependencias seguras del proyecto
└── LICENSE               # Licencia MIT