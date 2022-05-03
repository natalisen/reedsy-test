# reedsy-test
**Natalja Sentjureva**
Ruby on Rails Engineer

**Project instructions:**

Versions:
ruby-2.7.0
Rails 7.0.2.3

Steps:
- git clone https://github.com/natalisen/reedsy-test.git
- bundle install
- rails db:migrate
- rails db:seed
- rails server

Tasks:

1. List of items: http://localhost:3000/items

2. Update price of item (f.e. hoodie item price):

  PATCH http://localhost:3000/items/3/
  ```
  Params: {"item": {"price": 21}}
  ```
3. Create order - sum of items
POST http://localhost:3000/orders

  ```
  Items: 1 MUG, 1 TSHIRT, 1 HOODIE
  Total: 41.00
  Params: {"order": {"item_ids_and_quantities":[[1, 1],[2, 1],[3,1]]}} >
  ```
  
  ```
  Items: 2 MUG, 1 TSHIRT
  Total: 27.00
  Params: {"order": {"item_ids_and_quantities":[[1, 2],[2, 1]]}}
  ```
  ```
  Items: 3 MUG, 1 TSHIRT
  Total: 33.00
  Params: {"order": {"item_ids_and_quantities":[[1, 3],[2, 1]]}}
  ```

After order is created it should redirect to order show with list and total of items

4. Discount

POST http://localhost:3000/orders

  ```
  Items: 1 MUG, 1 TSHIRT, 1 HOODIE
  Total: 41.00
  Params: {"order": {"item_ids_and_quantities":[[1, 1],[2, 1],[3,1]]}}
  ```
  
  ```
  Items: 9 MUG, 1 TSHIRT
  Total: 69.00
  Params: {"order": {"item_ids_and_quantities":[[1, 9],[2, 1]]}}
  ```
  
  ```
  Items: 10 MUG, 1 TSHIRT
  Total: 73.80
  Params: {"order": {"item_ids_and_quantities":[[1, 10],[2, 1]]}}
  ```
  
  ```
  Items: 45 MUG, 3 TSHIRT
  Total: 279.90
  Params: {"order": {"item_ids_and_quantities":[[1, 45],[2, 3]]}}
  ```
  ```
  Items: 200 MUG, 4 TSHIRT, 1 HOODIE
  Total: 902.00
  Params: {"order": {"item_ids_and_quantities":[[1, 200],[2, 4],[3,1]]}}
  ```

