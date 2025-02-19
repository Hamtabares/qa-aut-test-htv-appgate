QA Automation - HTV Appgate

Este proyecto contiene pruebas automatizadas para **HTV Appgate**, utilizando **Karate, Java y Gradle**.

 Tecnologías utilizadas
Java 17
Karate Framework
Gradle
GitHub Actions

 Instalación y configuración

Clonar el repositorio

git clone https://github.com/Hamtabares/qa-aut-test-htv-appgate.git

configurar dependencias
./gradlew dependencies

ejecutar la prueba de todos los escenaris
./gradlew test --tests runners.RunnerTestE2E --info

el reporte queda
qa-aut-test-htv-appgate/build/karate-reports/karate-summary.html

Integración con GitHub Actions -- pipeline
Este proyecto está configurado con GitHub Actions para ejecutar las pruebas en cada push o pull request. Puedes ver los resultados en:

https://github.com/Hamtabares/qa-aut-test-htv-appgate/actions

**PARA QUE ESTE PIPELINE SEA FUNCIONAL SE DEBE LEVENTAR EL REPOSITORIO**
https://github.com/LuisCastillo-AG/qa-automation-test-appgate


Hallazgos Detectados
Consulta de información para clientes inexistentes

Al realizar una consulta a los servicios para clientes que no existen, no se genera un error adecuado.
La API responde con un código 200 OK, pero no retorna información válida.
Ingreso de clientes inexistentes desde la cola

Es posible ingresar clientes que no existen a través de la cola.
La aplicación procesa estos clientes y asigna valores de estado, aunque no existan en PostgreSQL.
Inconsistencia en la lectura de la respuesta desde la cola

La respuesta obtenida desde la cola debería reflejar datos reales almacenados en la base de datos.
Actualmente, la información retornada no coincide con los valores reales en PostgreSQL.
 
Recomendación
Se debe implementar una validación para:
Asegurar que la consulta de clientes inexistentes retorne un error adecuado (por ejemplo, 404 Not Found).
 Evitar el ingreso de clientes inexistentes en la cola.
Validar que los datos leídos desde la cola coincidan con la base de datos.