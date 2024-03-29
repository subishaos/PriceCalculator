### Price Calculator for a local grocery store

At the local grocery store items are sold by quantity. For example Milk costs $3.97. However sometimes there is a sale and then consumers can buy n items for the price of one. 

This week the pricing table at the local grocery store looks like this

```
Item     Unit price        Sale price
--------------------------------------
Milk      $3.97            2 for $5.00
Bread     $2.17            3 for $6.00
Banana    $0.99
Apple     $0.89
```

At the cash counter the items are accepted in any order. So at the cash counter the order of items can be in the order of Bread, Banana, Milk, Apple, Bread and then Milk. Notice that quantity of the Milk is 2 and this week there is a sale on Milk if 2 milk is purchased. So the price applied for milk should be $5.00.

Also note that if the user buys three milk then for the first two milk user should get the sale price and on the third milk user should get the unit price.

### Task

Taks is to build a ruby program which when execute would ask user to list all the itesm purchased in any order. Once user has listed all the items then print the total cost.

``` 
$ ruby price_calculator.rb
Please enter all the items purchased separated by a comma
milk,milk, bread,banana,bread,bread,bread,milk,apple

Item     Quantity      Price
--------------------------------------
Milk      3            $8.97
Bread     4            $8.17
Apple     1            $0.89
2.17Banana    1            $0.99  

Total price : $19.02
You saved $3.45 today.

```
