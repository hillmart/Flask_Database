# Flask_Database
**Overview**
Relational database using Jinja and Python that my partner and I hosted on a school database. It included CRUD functionality as well as a dynamic search.
The purpose of the database was for users to store recipes with ingredients and dietary restrictions.


**Outline**
  * users - database of users, storing their email, ID connects to recipes
    - userID: int, auto increment, unique, not NULL, PK
    - email: varchar, not NULL
    - restrictionID: int, FK
    - M:N relationship with Recipes
    - M:N relationship with Dietary Restrictions
  * recipes - database of recipes, storing name and serving, ID connects to ingredients,
    users, and dietary restrictions
    - recipeID: int auto increment, unique, not NULL, PK
    - name: char, not NULL
    - servings: int, not NULL
    - restrictionID: int, FK
    - M:N relationship with Users
    - 1:N relationship with Dietary Restrictions
    - M:N relationship with Ingredients
  * ingredients - database of ingredients, storing their price and name, ID connects to recipes
    - ingredientID: int auto increment, unique, not NULL, PK
    - price: int, not NULL
    - name: char, not NULL
    - M:N relationship with Recipes
  * dietaryRestrictions - database of dietary restrictions storing name, ID connects to users and recipes
    - restrictionID: int auto increment, unique, not NULL, PK
    - name: char, not NULL
    - M:1 relationship with Users
    - M:1 relationship with Recipes
  * userRecipes - database to join Users and Recipes. Stores both IDs and date added
    - userID: int auto increment, unique, not NULL, PK, FK
    - recipeID: int auto increment, unique, not NULL, PK, FK
    - dateAdded: date, not NULL
    - 1:N relationship with Users
    - 1:N relationship with Recipes
  * recipeIngredients - database to connect recipes and ingredients, stores ID and quantity
    - recipeID: int auto increment, unique, not NULL, PK, FK
    - ingredientID: int auto increment, unique, not NULL, PK, FK
    - quantity: int, not NULL
    - units: char, not NULL
    - 1:N relationship with ingredients
    - 1:N relationship with Recipes
