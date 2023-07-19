
# Millennium Gallery

Star Wars App. Prueba técnica de Tipti

## Diseño de la aplicación

Se realizó una aplicación de iOS y Android utilizando flutter, donde se obtendrá información de la API de swapi para popular la app. Esta nos dejará ver la información de todos los personajes de Star Wars con su respectivo nombre, género y películas en las que aparecieron.

También se agregó implementación de código nativo tanto para iOS (Swift) como para Android (Kotlin), con el fin de poder utilizar los sensores del dispositivo físico

#### Version de Flutter

Se utilizó la versión **2.10.2** de flutter como fue indicado en el pdf

#### Arquitectura

Para la arquitectura de la aplicación se utilizó Clean Architecture, donde se dividirá cada feature en 3 diferentes pilares. Estos son: presenter, domain, data. Dándonos de esta forma una escalabilidad más grande al momento de implementar código nuevo y poder seguir los principios de SOLID.

- **Presenter**: tendrá todo lo relacionado con con la parte visual del feature, y está dividida en 3 secciones.
    - **Pages**: és el widget principal donde se agregara los Providers necesarios para que los hijos los puedan acceder.
    - **Views**: es donde se armara el Layout que vamos a mostrar al usuario.
    - **Widgets**: son los widgets que se utilizaran en el view para mostrar el contenido que deseemos.

- **Domain**: es la capa donde tenemos nuestra lógica de negocio y abstracciones necesarias para que se adapten a nuestra lógica, y se divide en 3 secciones.
    - **Repositories**: es la abstracción de los repositorios que se van a utilizar.
    - **Entities**: es la representación más simple de los objetos que se van a utilizar en el feature.
    - **Bloc**: esta capa es donde tendremos la lógica donde se mandan los eventos de los usuarios  y se procesa la información. También realiza la comunicación necesaria con los repositorios o servicios.

- **Data**: esta es la capa que tiene las implementaciones de los repositorios que fueron descritas en nuestro domain. También tiene las implementaciones de las entidades descritas en domain y estas a su vez tiene los serializadores y deserialización a Json o cualquier función extra que se necesite.

#### Manejo de Estado

Para manejo de estado se utilizó Bloc esto nos permitirá manejar el estado y mandar los eventos del usuario de forma reactiva. Para utilizar bloc se utilizaron los siguientes paquetes: **bloc**, **flutter_bloc**, **bloc_test**, y **equatable**.

- **bloc**: nos permite crear nuevos blocs con sus respectivos eventos y estados, y poder tener esa comunicación con repositorios y servicios.
- **flutter_bloc**: nos permite hacer un bind del bloc al UI de nuestra aplicación, y de esta forma poder hacer un rebuild de un widget cuando tengamos un cambio en el estado.
- **bloc_test**: nos permite poder hacer unit test de nuestros blocs.
- **equatable**: nos ayuda a implementar igualdad entre objetos del mismo tipo, esto ayuda a que los blocs se nos se construyan innecesariamente.

### Implementación Código Nativo

Para la implementación del código nativo se creó un plugin de nombre galactic_compass donde se hizo la implementación de sensores nativos para obtener la orientación del dispositivo para poder rotar un objeto con Flutter.

El plug in se encuentra en el siguiente repositorio: https://github.com/daniel-cch/galactic_compass

Para Android se utilizó SensorManager para obtener el sensor de orientación, mientras que en iOS se utilizó CLLocation para poder obtener el heading del dispositivo.

### Plugins

Además de los paquetes ya mencionados también se utilizaron los siguientes:
- **Dio**: para poder hacer llamadas de HTTP.
- **Dartz**: para poder controlar de una mejor forma los errores al momento de hacer llamadas a los repositorios y tener el código más limpio.
- **Mocktail**: para poder hacer mocks de cualquier clase al momento de hacer test unitarios.

### Instalación

Para la instalación de la aplicación tenemos los siguientes pre requisitos:

- Tener instalado Flutter **2.10.2**
- En caso de iOS tener dispositivo físico ya que el sensor que se utiliza no está disponible para emulador.

Una vez que se tenga descargado el repositorio de la app, y conectado el dispositivo en el que se desea ejecutar la app,  se debe correr el siguiente comando.

`flutter pub get`

Para correr en debug la app

`flutter run --debug`

Para correr en realease la app

`flutter run --release`