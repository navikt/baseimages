import java.util.Arrays;
import java.util.Map;
import java.util.Properties;

/*
 * This Java source file was generated by the Gradle 'init' task.
 */
public class Main {

    public static void main(String[] args) {
        System.out.println("=======   SYSTEM PROPERTIES   =======");
        Properties props = System.getProperties();
        props.list(System.out);

        System.out.println();
        System.out.println("======= ENVIRONMENT VARIABLES =======");
        Map<String, String> env = System.getenv();
        for (Map.Entry<String, String> entry : env.entrySet()) {
            System.out.print(entry.getKey());
            System.out.print("=");
            System.out.println(entry.getValue());
        }

        System.out.println();
        System.out.println("=======          ARGS         =======");
        System.out.println(Arrays.toString(args));

        testThatTruststoreIsInjected(env, props);
        testThatHttpProxyIsInjected(env, props);

        System.out.println("Test OK");
    }

    private static void test(boolean b) {
        if (!b) {
            throw new RuntimeException("test failed");
        }
    }

    private static void testThatTruststoreIsInjected(Map<String, String> env, Properties props) {
        String truststorePath = env.getOrDefault("NAV_TRUSTSTORE_PATH", "");
        String truststorePassword = env.getOrDefault("NAV_TRUSTSTORE_PASSWORD", "");

        test(truststorePath.length() > 0);
        test(truststorePassword.length() > 0);

        test(props.getProperty("javax.net.ssl.trustStore").equals(truststorePath));
        test(props.getProperty("javax.net.ssl.trustStorePassword").equals(truststorePassword));
    }

    private static void testThatHttpProxyIsInjected(Map<String, String> env, Properties props) {
        String javaProxyOptions = env.getOrDefault("JAVA_PROXY_OPTIONS", "");

        test(javaProxyOptions.length() > 0);

        test(props.getProperty("http.proxyHost").equals("foo.bar"));
        test(props.getProperty("https.proxyHost").equals("foo.bar"));
        test(props.getProperty("http.proxyPort").equals("1234"));
        test(props.getProperty("https.proxyPort").equals("1234"));
        test(props.getProperty("http.nonProxyHosts").equals("host1|host2|*.wildcard.local|*.local|foo"));
    }
}