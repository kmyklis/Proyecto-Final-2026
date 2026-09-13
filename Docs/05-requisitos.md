# Requisitos del proyecto

## Requisitos funcionales

| Código | Requisito | Prioridad | Criterio de aceptación | Responsable |
|---|---|---|---|---|
| RF-01 |Permite que el usuario se registre autenticando al usuario por rol| Alta |El nuevo usuario completa un formulario y queda registrado en la base de datos |Isabel|
| RF-02 |cursos| Alta |Mostrar lista de cursos para asociar un aviso/estudiante.|Isabel|
| RF-03 |Permite registrar un aviso o comunicación| Alta |Se guarda el comunicado asociando fecha, curso, motivo, tipo de aviso y estado inicial |Isabel|
| RF-04 |Permite cancelar| Media |oDesactivar o archivar un aviso emitido |Isabel|
| RF-05 |Calendario o muro de avisos| Alta|Muro de avisos y eventos del liceo ordenados por fecha y prioridad.|Isabel|
| RF-06 |Permite consultar avisos| Media|Filtro por curso, profesor emisor o tipo de aviso|Isabel|
| RF-07 |editar comunicados| Alta|Modificar avisos pendientes o correcciones de información.|Isabel|


## Requisitos no funcionales

| Código | Requisito | Cómo se comprobará |
|---|---|---|
| RNF-01 |Validacion|No se permite espacios vacios al iniciar|
| RNF-02 |Seguridad|Solo los usuarios autorisados pueden editar, cancelar o archivar un aviso |
| RNF-03 |Funcionalidad|La interfas de la aplicacion es facil de usar|

## Historias de usuario opcionales

> Como [tipo de usuario], quiero [acción] para [beneficio].

## Priorización

- **Alta:** necesaria para el producto mínimo viable.
- **Media:** importante, pero puede simplificarse.
- **Baja:** mejora futura.
