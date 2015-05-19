# END ROUTES & DATABASE STRUCTURE

* = priorities


| Prefix        | Verb           | Path                                                                  | Description         | Controller#Action   | Return Message |
| -------------:|:-------------- |:---------------------------------------------:|:---------------------:|:-------------------:|:------------------------------------:|
| dishes			  | GET*           | /dishes																		 	 | get all dishes  			 | dishes#index  			 | renders all dishes, else false       |
| dish			  	| POST*          | /dishes/new		                               | create a new dish   	 | dishes#create 			 | on success: saved, else unsuccessful |
| dish				  | DELETE         | /dishes/:id                                   | delete a dish  			 | dishes#delete 			 | on success: true, else false         |
| dish   			  | GET*           | /dishes/:id                                   | get one dish 		     | dish#index   			 | renders one dish, else false         |
| restaurants   | GET*           | /restaurants    												       | get all restaurants   | restaurants#index   | renders all restaurants, else false  |



# DATABASE STRUCTURE

### Users  ==> has_many: dishes

| id     | username         | email           | password          |
|--------|------------------|-----------------|-------------------|
|1       | xavi			        |                 |                   |
|2       | mia	            |                 |                   |


###Dishes ==> belongs_to: users & restaurants

|id       | user_id        | restaurant_id     | name    					 | picture_id  			| content		   			 | created_at   | updated_at   |
|---------|----------------|-------------------|-------------------|------------------| -------------------|--------------|--------------|
|1        | 1              | 1                 | 1                 |                  |                    |              |              |
|2        | 1              | 2                 | 1                 |                  |                    |              |              |
|3        | 2              | 3                 | 1                 |                  |                    |              |              |
|4        | 2              | 2                 | 1                 |                  |                    |              |              |     


### Restaurants ==> has_many: dishes 

|id     | name 						       | location       | description       |
|-------|------------------------|----------------| ------------------|
|1      |                        | 								|  								  |
|2      |                        | 								|   								|




