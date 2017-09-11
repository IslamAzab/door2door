# README

This is a solution for door2door backend challenger found [here](https://github.com/door2door-io/backend-code-challenge).

[Here](https://door2door-backend.herokuapp.com/) you can find the api deployed to heroku, it contains one end point which can be found at **POST** **_/submit_emission_** with following mandatory paramters:
* **uuid**: a valid uuid as mentioned in the challenge
* **timestamp**: a valid time stamp eg '2017-09-11 00:01:02'
* **vehicle_type**: any value from these [bus, taxi, tram, train]
* **latitude**: should be between -90 and 90.
* **longitude**: should be between -180 and 180.
* **heading**: should be between 0 and 359.
