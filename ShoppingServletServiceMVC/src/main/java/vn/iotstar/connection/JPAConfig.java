package vn.iotstar.connection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAConfig {
    private static final String PERSISTENCE_UNIT = "JPA_Shopping";

    private static EntityManagerFactory factory;

    private JPAConfig() {
    }

    private static synchronized EntityManagerFactory getFactory() {
        if (factory == null || !factory.isOpen()) {
            factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
        }
        return factory;
    }

    public static EntityManager getEntityManager() {
        return getFactory().createEntityManager();
    }

    public static synchronized void shutdown() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
        factory = null;
    }
}