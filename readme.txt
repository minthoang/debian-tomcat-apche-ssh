
# Load the mod_jk module.   


  LoadModule    jk_module  path/to/mod_jk.so


  # Declare the module for use with the <IfModule directive> element.  (This only applies to versions of HTTPD below 2.x.  For 2.x and above, REMOVE THIS LINE.)


  AddModule     mod_jk.c


  # Set path to workers.properties. We will create this file in the next step.  The file will be placed in the same directory as httpd.conf.


  JkWorkersFile /path/to/httpd/conf/workers.properties


  # Set path to jk shared memory.  Generally, you'll want this to point to your local state or logs directory.


  JkShmFile     /path/to/log/httpd/mod_jk.shm


  # Where to put jk logs


  # Set path to jk logs.  This path should point to the same logs directory as the HTTPD access_log.


 JkLogFile     /path/to/log/httpd/mod_jk.log


  # Set the jk log level.  Valid values for this setting are 'debug', 'error', or 'info'.


  JkLogLevel    level

  # Set timestamp log format.  Use provided variables to customize.


  JkLogStampFormat "[%a %b %d %H:%M:%S %Y] "


  # Map a worker to a namespace.  Workers represent Tomcat instances that are listening for requests.  We'll configure these in the next section.  For the sake of this example, Tomcat's "examples" context is used, and a default worker named 'worker1', which we will create in Step 4, is designated.  Multiple JkMount attributes can be used simultaneously.
 

  JkMount  /examples/* worker1

Step 4 - Configure workers.properties
The workers.properties file defines a list of Tomcat 'workers' to which Apache HTTPD can pass requests.  

The bare-bones configuration below defines the ajp13 worker named 'worker1' that we designated in Step 3 to handle all requests for the "examples" context:


# Define a worker named 'worker1' (more workers can be added as comma separated values)
 

  worker.list=worker1
  # Set worker properties
  worker.worker1.type=ajp13
  worker.worker1.host=localhost
  worker.worker1.port=8009
In the interest of simplicity, this tutorial only provides a basic configuration.