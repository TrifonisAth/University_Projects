
# Theater Ticketing System

* The objective of this project was to create a program where customers are making phone calls in a call center and they are waiting to get the first available line.

* When a customer finds an available line he is ordering a random number of tickets in a random theater zone. Each zone can have a different amount of seats and price.

* The call support employee is then scanning the theater plan looking for X contiguous available seats.

* In the next phase, if the number of contiguous requested seats are available the customer connects to the first available cashier to make the payment.


## Implementation

* The implementation is based on POSIX Threads.
* Every customer is a thread.
* There is a finite amount of employees that the customers are waiting to interact with through thread synchronization.
* Mutexes are used in shared variables to ensure their integrity. 