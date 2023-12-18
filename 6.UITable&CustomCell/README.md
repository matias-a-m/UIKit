# TableView Example

Este proyecto de iOS muestra cómo implementar una `UITableView` en Swift, con celdas personalizadas y datos organizados por sección. En este caso, la tabla muestra dispositivos divididos en secciones para "Device House" y "Device Work".

## Contenido del Proyecto

### ViewController

`ViewController` es la clase principal que gestiona la interfaz de usuario y contiene la configuración principal de la tabla.

- **Propiedades:**
  - `devicesTableView`: Una instancia de `UITableView` configurada programáticamente.
  - `dataSource`: Una instancia de `ViewControllerDataSource` para manejar el origen de datos.
  - `delegate`: Una instancia de `ViewControllerDelegate` para manejar los eventos de selección en la tabla.

- **loadView():**
  - Configura la vista principal del controlador con una `UITableView` nueva.
  - Inicializa las instancias de origen de datos y delegado.
  - Asigna el origen de datos y el delegado a la tabla.
  - Registra una celda personalizada para su reutilización.
  - Asigna la tabla como la vista principal del controlador.

### `ViewControllerDataSource`

`ViewControllerDataSource` es una clase que actúa como origen de datos para la tabla.

- **Propiedades:**
  - `dataSource`: Una matriz bidimensional que contiene los datos organizados por sección.

- **Métodos:**
  - `numberOfSections(in tableView:)`: Devuelve el número de secciones en la tabla.
  - `tableView(_:numberOfRowsInSection:)`: Devuelve el número de filas en cada sección.
  - `tableView(_:cellForRowAt:)`: Configura las celdas de la tabla con los datos correspondientes.
  - `tableView(_:titleForHeaderInSection:)`: Devuelve el título de la sección.

### `ViewControllerDelegate`

`ViewControllerDelegate` es una clase que implementa el delegado de la tabla.

- **Métodos:**
  - `tableView(_:didSelectRowAt:)`: Maneja el evento de selección de una celda e imprime el título del modelo de datos seleccionado.

### `TableViewCustomCell`

`TableViewCustomCell` es una celda personalizada para la tabla.

- **Propiedades:**
  - `deviceImageView`: Una vista de imagen para mostrar una imagen relacionada con el dispositivo.
  - `devicenNameLabel`: Una etiqueta para mostrar el nombre del dispositivo.

- **Métodos:**
  - `configure(model:)`: Configura la celda con un modelo de datos específico.

