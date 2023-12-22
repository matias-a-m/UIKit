# CollectionView App

## Descripción
Esta aplicación iOS utiliza el patrón de diseño MVVM (Model-View-ViewModel) para mostrar una colección de dispositivos divididos en las secciones "Home" y "Office". Cada dispositivo se representa con una celda en la colección, y se utiliza una vista de encabezado para mostrar el nombre de cada sección.

## Características Principales
- **MVVM Pattern:** La aplicación sigue el patrón MVVM para una arquitectura de código limpia y mantenible.
- **UICollectionView:** Muestra la lista de dispositivos de manera organizada y estéticamente agradable.
- **Diferencial de Datos:** Utiliza `UICollectionViewDiffableDataSource` para la gestión eficiente de datos y actualizaciones de la interfaz de usuario.
- **Lazy Initialization:** Se utiliza `lazy var` para inicializar y configurar el `viewModel` de manera eficiente.

## Estructura del Proyecto
- **CollectionView:** Clase principal que contiene la configuración de la interfaz de usuario y gestión de datos.
- **DeviceViewModel:** ViewModel que gestiona los datos de los dispositivos para las secciones "Home" y "Office".
- **DeviceCellViewModel:** ViewModel para cada celda de dispositivo, proporcionando la información necesaria para la presentación.
- **Device:** Modelo de datos que representa un dispositivo con un título y una imagen.
- **SectionHeader:** Vista de encabezado para mostrar el nombre de cada sección en la colección.

## Configuración del Proyecto
1. Clona el repositorio: `git clone [URL del repositorio]`
2. Abre el proyecto en Xcode.
3. Ejecuta la aplicación en el simulador o dispositivo iOS.

## Requisitos
- Xcode 12.0 o superior
- Dispositivo o simulador iOS con iOS 12.0 o superior

## Licencia
Este proyecto está bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.

