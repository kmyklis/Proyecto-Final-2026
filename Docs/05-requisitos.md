# Requisitos del proyecto

## Requisitos funcionales

| Código | Requisito | Prioridad | Criterio de aceptación | Responsable |
|---|---|---|---|---|
| RF-01 |Permite que el usuario se reguistre| Alta |El nuevo usuario completa un formulario y queda registrado en la base de datos |Isabel|
| RF-02 |Permite mostrar los cursos| Alta |Se  muestra la lista actualizada de cursos disponibles en la interfaz |Isabel|
| RF-03 |Permite hacer una solicitud de salida| Alta |Se guarda la solicitud  asociando fecha, curso, motivo y estado inicial |Isabel|
| RF-04 |Permite cancelar una salida| Media |Cambia el estado de la solicitud a "Canecelar" y libera los cupos o horarios |Isabel|
| RF-05 |Permite ver que dias hay salidas| Alta|Muestra un calendario o lista con las fechas maracados que tienen salidas programadas |Isabel|
| RF-06 |Permite consultar solicitudes| Media|Muestra el listado de solicitudes con su estado fecha, y datos del curso |Isabel|
| RF-07 |Permite editar solicitudes| Alta|Permite modificar la fecha, curso o descripcion de una solicitud pendiente |Isabel|


## Requisitos no funcionales

| Código | Requisito | Cómo se comprobará |
|---|---|---|
| RNF-01 |Validacion|No se permite espacios vacios al iniciar|
| RNF-02 |Seguridad|Solo los usuarios autorisados pueden editar, cancelar la salida |
| RNF-03 |Funcionalidad|La interfas de la aplicacion es facil de usar|

## Historias de usuario opcionales

> Como [tipo de usuario], quiero [acción] para [beneficio].

## Priorización

- **Alta:** necesaria para el producto mínimo viable.
- **Media:** importante, pero puede simplificarse.
- **Baja:** mejora futura.
