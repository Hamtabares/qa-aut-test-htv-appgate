package runners;

import com.intuit.karate.junit5.Karate;

public class RunnerTestE2E {

    @Karate.Test
    Karate testReadAMQ() {
        return Karate.run("classpath:features/conectionamq.feature",
                "classpath:features/servicesamq.feature",
                "classpath:features/conectionbd.feature")
                 .relativeTo(getClass());
    }
}

