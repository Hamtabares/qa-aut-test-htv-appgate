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