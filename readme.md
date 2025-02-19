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