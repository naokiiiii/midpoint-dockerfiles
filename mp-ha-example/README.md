`midPoint High Availability` example
======================

What is it?
-----------

This is an example of midPoint's high availability architecture.


Requirements
-----------

You need to edit the hosts file on your local machine to access to this Docker host:

   ````
   XXX.XXX.XXX.XXX	iga.example.com
   ````


Build and Run
-----------

To build and run the example, execute the following docker-compose command:

   ````
   docker-compose up -d --build
   ````

After the startup, you can access the following applications:

|Application Name|URL|userID/Password|
|:--|:--|:--|
|midPoint Console|http://iga.example.com/|administrator/5ecr3t|


Stop
-----------

To stop the example, execute the following docker-compose command:

   ````
   docker-compose down
   ````
