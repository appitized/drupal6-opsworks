# Drupal 6x AWS OpsWorks Recipes

These recipes will set-up Drupal 6x on AWS OpsWorks

### Version
0.1

### Changelog

  - 0.1 - Initial

### Installation

You will need Drupal 6x in a public/private repo added as an application in OpsWorks and to enable custom cookbooks in your stack.

Create a new PHP layer and click on Recipes link on the layer and then EDIT. 

Under Custom Chef Recipes use the following:

```sh
Setup: drupal::packages
```
```sh
Deploy: drupal::permissions drupal::dbconfig drupal::settings
```
Then click Save to complete the set-up. 

### New Relic APM

If you want to use New Relic then add the below to your set-up

```sh
Setup: newrelic::default newrelic::php_agent
```
click + to add it to the list and click the Save button at the bottom to save the updated. 

You will also need to add the folowing into your custom JSON on your stack:


{
    "newrelic": {
        "license": "YOUR_NEWRELIC_API_KEY,
        "php_agent": {
            "php_recipe": "mod_php5_apache2::default",
            "config_file": "/etc/php5/apache2/conf.d/newrelic.ini"
        },
        "application_monitoring": {
            "app_name": "YOUR_APP_NAME",
			  "error_collector": "enable"
        }
    }
}

See http://blog.newrelic.com/2014/07/31/monitoring-aws-opsworks/ for more info. 
