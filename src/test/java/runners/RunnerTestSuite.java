package runners;

import com.intuit.karate.junit5.Karate;



public class RunnerTestSuite {
            @Karate.Test
            Karate testReadAMQ() {
                return Karate.run("classpath:features/conectionbd.feature"

                ).relativeTo(getClass());
            }
        }
