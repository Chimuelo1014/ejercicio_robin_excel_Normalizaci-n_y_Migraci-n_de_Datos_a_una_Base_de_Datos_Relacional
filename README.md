# VetPharma API – Taller de Normalización y Migración
Este proyecto implementa la migración de datos de Excel a MySQL,
aplicando normalización hasta 3FN y exponiendo los datos
a través de una API REST con Node.js y Express.

## 📌 Características principales
Normalización de datos hasta 3FN

Migración de datos de Excel/ODS a MySQL

API REST con Node.js + Express + MySQL2

Endpoints GET y POST para inserción y consulta

Pruebas de servicios con Postman

Integridad y trazabilidad de la información mediante JOINs

## 📂 Estructura del proyecto
proyecto_api/
│
├── backend/
│   ├── server.js        # API principal
│   ├── package.json     # Dependencias Node.js
│   └── node_modules/    # Módulos instalados
│
└── datos/
    ├── cliente.csv
    ├── factura.csv
    ├── detalle_factura.csv
    ├── medicamento.csv
    └── pago.csv

## ⚙️ Requisitos
Node.js >= 18

MySQL >= 8

Postman (para pruebas)

Instalar dependencias Node: 
npm install

## ▶️ Ejecución del servidor
### 1. Configura tu base de datos en server.js:
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'TU_CONTRASEÑA',
    database: 'ejerciciorobin'
});

### 2. Inicia el servidor
node server.js
### 3. El servidor estará disponible en:
http://localhost:3000

## 📡 Endpoints principales
### GET /cliente
Obtiene todos los clientes registrados.

### Ejemplo de respuesta:
[
  { "id_cliente": 1, "nombre": "Laura Gómez", "email": "laura@gmail.com", "telefono": "3012223344" }
]


### POST /cliente
Agrega un nuevo cliente.

#### Body JSON:
{
  "nombre": "Pedro Díaz",
  "email": "pedro@gmail.com",
  "telefono": "3005558899"
}
#### Respuesta:
{ "message": "Cliente agregado correctamente", "id": 7 }

### GET /facturas
Obtiene la trazabilidad completa de cada factura,
incluyendo cliente, medicamentos, cantidad y pagos.

## 🧪 Pruebas
Importa la colección de Postman incluida en el proyecto (VetPharma API.postman_collection.json).

Ejecuta los GET y POST para validar la API.

Verifica que los datos insertados aparecen en MySQL y en /facturas.

## 📄 Autor
### Realizado por: Samuel Quintero
### Clan: Ritchie
### CC: 1025890263
