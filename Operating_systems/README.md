
# Theater Ticketing System

![image](https://user-images.githubusercontent.com/81590123/184472422-877f4d6f-8837-4c66-b046-f80ed2d3d158.png)

* The objective of this project was to create a program where customers are making phone calls in a call center and they are waiting to get the first available line.

* When a customer finds an available line he is ordering a random number of tickets in a random theater zone. Each zone can have a different amount of seats and price.

* The call support employee is then scanning the theater plan looking for X contiguous available seats.

* In the next phase, if the number of contiguous requested seats are available the customer connects to the first available cashier to make the payment.


## Implementation

* The implementation is based on POSIX Threads.
* Every customer is a thread.
* There is a finite amount of employees that the customers are waiting to interact with through thread synchronization.
* Mutexes are used in shared variables to ensure their integrity. 
