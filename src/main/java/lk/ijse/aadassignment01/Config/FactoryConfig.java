package lk.ijse.aadassignment01.Config;

import lk.ijse.aadassignment01.Entity.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryConfig {
    private static FactoryConfig factoryConfig;
    private SessionFactory sessionFactory;

    private FactoryConfig() {

        Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml");


        configuration.addAnnotatedClass(Category.class);


        sessionFactory = configuration.buildSessionFactory();
    }

public static FactoryConfig getInstance() {
    return (factoryConfig == null) ?
          factoryConfig =  new FactoryConfig() : factoryConfig;
}

public Session getSession() {
    return sessionFactory.openSession();
}
}