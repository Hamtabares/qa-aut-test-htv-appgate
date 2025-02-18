function fn() {
    // Definir función antes de usarla en config
    function makeid() {
        var numbers = [1, 2, 3, 4];
        return numbers[Math.floor(Math.random() * numbers.length)];
    }
    var config = {

        urlSend: 'http://localhost:15672/api/exchanges/%2F/amq.default/publish',
        basic: 'Basic YWRtaW46YWRtaW4=',
        user: 'admin',
        pass: 'admin',
        queuename : 'testing.customer.query.is-customer-available',
        customer: makeid()  // Llamar a makeid() después de definirla
    };
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    var env = karate.env;
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
    }
    if (env == 'stage') {
        config.someUrlBase = 'https://stage-host/v1/auth';
    } else if (env == 'e2e') {
        config.someUrlBase = 'https://e2e-host/v1/auth';
    }
    return config;
}