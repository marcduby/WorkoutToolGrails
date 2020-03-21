dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = true
	cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
			dbCreate = "update" // "validate" // "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/workout?zeroDateTimeBehavior=convertToNull&useUnicode=yes&characterEncoding=UTF-8"
			username = ""
            password = ""
//          dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//          url = "jdbc:h2:mem:devDb;MVCC=TRUE"
        }
    }
    test {
        dataSource {
			dbCreate = "update" // "validate" // "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/workout_test?zeroDateTimeBehavior=convertToNull&useUnicode=yes&characterEncoding=UTF-8"
			username = ""
            password = ""
//            dbCreate = "update"
//            url = "jdbc:h2:mem:testDb;MVCC=TRUE"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
