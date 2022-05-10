                      FLUTTER TEST CASE
TABLE OF CONTENTS
•	Login
•	Bus List
•	Bus Detail
•	Drivers List
•	Driver Management

This provides a simple API to manage buses.

The following resources are available along with the details of the HTTP methods they support.

	Base Url : http://flutter.noviindus.co.in/api/

LOGIN
•	In order to get the access the user must login to the App
•	At the time of login, you will get an API key and Token. This API key and Token must be used in all other API’s.

API to login
LoginApi [ POST ]
o	key :
	username :  admin_user
	password : 123admin789
•	The token obtained will get expired within a specific time, so you must call a refresh token API to get new token.
API to get new token
           api/token/refresh/
o	key :
	refresh


BUS LIST
•	From this section you can list the bus
API to get the bus list

BusListApi/ Api Key /[ GET ]

BUS DETAIL
•	There are two sections in the bus detail.
1.	Driver detail
2.	Bus seat layout
•	In the Driver detail section, the user must have the option to assign and update the driver.
•	There are two types of seats in the seat layout
1.	1x3
2.	2x2
The seats must be equally aligned in column wise.
•	The layout will be given in the UI design

API to update the Driver
AssignDriverApi/ Api Key /[ PATCH ]
o	Key :
	bus_id
	driver_id

DRIVERS LIST
•	In this section you must list the drivers
API to list the Drivers
DriverApi/Api Key/ [ GET ]


DRIVER MANAGEMENT
•	Here there should be an option to create and delete new drivers.
•	DriverApi/ Api Key /   [ POST, DELETE ]
o	POST – Key :
	name
	mobile
	license_no
o	Delete – Key:
	driver_id



In addition to this, please ensure the following
1. Use a clean architecture approach.
2. Use git to version control your project and put it on Github, GitLab
3. Minimize usage of 3rd party packages
4. Make the UI minimally attractive.
5. Make the code base production-ready.

We should receive the following from you.

1. The source code on a git hosting website. The entire application should not be a single commit. We want to see how the process the development took place.
2. An apk built off this code base. Please upload this to a cloud hosting services like Google Drive, Dropbox, etc.
3. Screenshots (directly attach to email)

If you have any suggestions about the API, please email them to us. We will not be making any changes now but good suggestions will be positive during your application process.
