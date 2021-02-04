package com.fpt.esanitary.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.Objects;
import java.util.Properties;

@EnableAsync
@Configuration
@EnableTransactionManagement
@PropertySource({"classpath:database-cfg.properties", "classpath:email-cfg.properties"})
@ComponentScan({"com.fpt.esanitary.dao", "com.fpt.esanitary.service"})
public class AppConfig {

    public static final String CURRENT_SESSION_CONTEXT_CLASS = "current_session_context_class";
    public static final String DEBUG = "mail.debug";
    public static final String DEFAULT_ENCODING = "spring.mail.default-encoding";
    public static final String DRIVER = "jdbc.driver";
    public static final String HIBERNATE_DIALECT = "hibernate.dialect";
    public static final String HIBERNATE_SHOW_SQL = "hibernate.show_sql";
    public static final String HOST = "spring.mail.host";
    public static final String INIT_POOL_SIZE = "connection.pool.initialPoolSize";
    public static final String JDBC_PASSWORD = "jdbc.password";
    public static final String JDBC_URL = "jdbc.url";
    public static final String JDBC_USER = "jdbc.user";
    public static final String MAIL_DEBUG = "spring.mail.properties.mail.debug";
    public static final String MAIL_SMTP_AUTH = "spring.mail.properties.mail.smtp.auth";
    public static final String MAIL_SMTP_STARTTLS_ENABLE = "spring.mail.properties.mail.smtp.starttls.enable";
    public static final String MAIL_TRANSPORT_PROTOCOL = "spring.mail.properties.mail.transport.protocol";
    public static final String MAX_POOL_IDLE_TIME = "connection.pool.maxIdleTime";
    public static final String MAX_POOL_SIZE = "connection.pool.maxPoolSize";
    public static final String MIN_POOL_SIZE = "connection.pool.minPoolSize";
    public static final String PACKAGE_ENTITIES = "com.fpt.esanitary.entities";
    public static final String PASSWORD = "spring.mail.password";
    public static final String PORT = "spring.mail.port";
    public static final String PROTOCOL = "mail.transport.protocol";
    public static final String SMTP_AUTH = "mail.smtp.auth";
    public static final String SMTP_STARTTLS_ENABLE = "mail.smtp.starttls.enable";
    public static final String USERNAME = "spring.mail.username";
    Logger LOGGER = LoggerFactory.getLogger(AppConfig.class);
    private Environment env;

    @Autowired
    public void setEnv(Environment env) {
        this.env = env;
    }

    @Bean
    public DataSource getDataSource() {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        try {
            dataSource.setDriverClass(env.getProperty(DRIVER));
        } catch (PropertyVetoException e) {
            throw new RuntimeException(e);
        }

        // Setup database
        dataSource.setJdbcUrl(env.getProperty(JDBC_URL));
        dataSource.setUser(env.getProperty(JDBC_USER));
        dataSource.setPassword(env.getProperty(JDBC_PASSWORD));

        // Connection pool
        dataSource.setInitialPoolSize(getIntProperty(INIT_POOL_SIZE));
        dataSource.setMinPoolSize(getIntProperty(MIN_POOL_SIZE));
        dataSource.setMaxPoolSize(getIntProperty(MAX_POOL_SIZE));
        dataSource.setMaxIdleTime(getIntProperty(MAX_POOL_IDLE_TIME));
        return dataSource;
    }

    // Read environment property and convert to int
    private int getIntProperty(String propName) {
        String propVal = env.getProperty(propName);
        assert propVal != null;
        return Integer.parseInt(propVal);
    }

    @Bean(name = "sessionFactory")
    public SessionFactory getSessionFactory(DataSource dataSource) throws Exception {
        Properties properties = new Properties();
        properties.put(HIBERNATE_DIALECT, env.getProperty(AppConfig.HIBERNATE_DIALECT));
        properties.put(HIBERNATE_SHOW_SQL, env.getProperty(HIBERNATE_SHOW_SQL));
        properties.put(CURRENT_SESSION_CONTEXT_CLASS, env.getProperty(CURRENT_SESSION_CONTEXT_CLASS));

        LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
        factoryBean.setPackagesToScan(PACKAGE_ENTITIES);
        factoryBean.setDataSource(dataSource);
        factoryBean.setHibernateProperties(properties);
        factoryBean.afterPropertiesSet();

        LOGGER.info("### getSessionFactory: " + factoryBean.getObject());
        return factoryBean.getObject();
    }

    @Bean(name = "transactionManager")
    public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
        return new HibernateTransactionManager(sessionFactory);
    }

    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(env.getProperty(HOST));
        mailSender.setPort(Integer.parseInt(Objects.requireNonNull(env.getProperty(PORT))));
        mailSender.setUsername(env.getProperty(USERNAME));
        mailSender.setPassword(env.getProperty(PASSWORD));
        mailSender.setDefaultEncoding(env.getProperty(DEFAULT_ENCODING));

        Properties props = mailSender.getJavaMailProperties();
        props.put(PROTOCOL, env.getProperty(MAIL_TRANSPORT_PROTOCOL));
        props.put(SMTP_AUTH, env.getProperty(MAIL_SMTP_AUTH));
        props.put(SMTP_STARTTLS_ENABLE, env.getProperty(MAIL_SMTP_STARTTLS_ENABLE));
        props.put(DEBUG, env.getProperty(MAIL_DEBUG));

        return mailSender;
    }
}