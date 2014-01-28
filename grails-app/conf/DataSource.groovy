dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}

hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='org.hibernate.cache.EhCacheProvider'
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost:3306/porteaporte"
            username = "grails"
            password = "grails"
        }
    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://db4free.net:3306/porteaporteh"
            username = "porteaporteh"
            password = "porteaporteh"
        }
    }	
    production {
        dataSource {
           dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
           url = "jdbc:mysql://localhost:3306/porteaporte"
           username = "root"
           password = "root"
        }
    }	
}