

class drupal::config {

}

class drupal {
  include php
  
  include drupal::params, drupal::config
}