# Api en RoR para propositos didácticos

### Requisitos:

* [Requisitos](http://rubyonrails.org.es/instala.html)

### ¿ Como instalar ?

* `bundle install`

### Preparación

* Correr el comando `rails db:migrate` para las migraciones
* `rails db:seed` para los seeders y data de prueba
* `rails s` para iniciar el api

### Rutas

* **GET** `http://localhost:3000/departments/index` Lista la jerarquía actual.
* **POST** `http://localhost:3000/departments/:id` Agregar un item en la jerarquía. El :id es el identificador del padre a donde se insertará el item. Se debe pasar por body lo siguiente: 
*Body:* => 
```json
  {
    "area": "Mi area",
    "nota": 5.6  
  }
```

* **PUT** `http://localhost:3000/departments/:id` Actualiza un area determinada por un id, se debe pasar al body lo siguiente:
*Body:* => 
```json
  {
    "padre": 2,
  }
  //Donde el padre es el departamento en donde se cambiara el :id del hijo
```

## Consideraciones

* El `Content-type` puede ser `application/x-www-form-urlencoded` o `application/json`.

# LICENCIA MIT