
class tomcat {
  include tomcat::params,
          tomcat::install,
          tomcat::config,
          tomcat::service
}