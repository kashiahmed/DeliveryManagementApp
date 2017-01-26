# Delivery Management - Custom Force.com App
Deploy to Salesforce directly
<a href="https://githubsfdeploy.herokuapp.com?owner=kashiahmed&repo=DeliveryManagementApp">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

<p>The is simple force.com app to capture Delivery Confirmation. It contains 3 objects i.e.  Route > Deliver > Delivery Item. Delivery Confirmation Visual Force Page is the front end for a Driver to record delivery confirmation and get customer signature.
</p>
<p>   <img alt="Delivery Management SF1 Ready"
       src="https://raw.githubusercontent.com/kashiahmed/DeliveryManagementApp/master/img/dm_sf1-phone.png"> </p>
 <p>
 <h2>This app demonstrate the following features: </h2> <br/>
One VF Page for Drivers i.e. Delivery Confirmation (Note: Please make sure to Add Delivery Confirmation VF Page to Salesforce 1 Navigation via Setup > Administer > Salesforce1 Navigation)  <br/> <br/>
Delivery Confirmation page shows dynamic dependent picklist to view Daily Routes and based on the route it display available OPEN Deliveries > Once delivery is selected it shows all the OPEN delivery Items for a customer <br/><br/>
When driver complete the delivery, he or she can get customer eSignature, take item picture and save the record <br/><br/>
The app automatically geo tag the location on the record to verify the item was delivered to the same customer address. <br/> <br/>
A Process is defined via Process Builder to update Delivery Status to DELIVERED once all the delivery items are DELIVERED. <br/><br/>
</p>
<p>  <a href="https://youtu.be/5VG7BYHSsBw"> Delivery Managemnt App Demo Video <img alt="Delivery Management App Demo Video"
       src="https://i.ytimg.com/vi/5VG7BYHSsBw/1.jpg?time=1485447270443"> </p> </a>
 <p>


<p>
(c) Developed by Kashi <a href="http://kashiahmed.com"> kashiahmed.com </a>
 </p>
       
 
 
