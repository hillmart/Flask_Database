-- Need to replace the following in a query with actual values for use:
--   userID, 
--   emailInput,
--   restrictionIDInput,
--   recipeID,
--   nameInput,
--   servingsInput,
--   ingredientID,
--   quantity,
--   units 

-- get all dietary restrictions to populate the Restrictions dropdown
SELECT restrictionID, name FROM dietaryRestrictions

-- get all ingredients to populate the Ingredients dropdown
SELECT ingredientID, name FROM ingredients

-- get all users and their dietary restrictions
SELECT users.userID, email, dietaryRestrictions.name AS restriction 
FROM users 
INNER JOIN dietaryRestrictions ON users.restrictionID = dietaryRestrictions.restrictionID

-- get a single user's data
SELECT userID, email, restrictionID FROM users WHERE userID = :userID

-- get all users' data to populate a dropdown for associating with a recipe
SELECT userID, email FROM users

-- get all recipes to populate a dropdown for associating with users
SELECT recipeID, name FROM recipes

-- get all recipes and their dietary restrictions
SELECT recipes.recipeID, recipes.name, dietaryRestrictions.name AS restriction 
FROM recipes 
INNER JOIN dietaryRestrictions ON recipes.restrictionID = dietaryRestrictions.restrictionID

-- add a new user
INSERT INTO users (email, restrictionID) VALUES (:emailInput, :restrictionIDInput)

-- associate a user with a recipe
INSERT INTO userRecipes (userID, recipeID, dateAdded) VALUES (:userID, :recipeID, :dateAdded)

-- update a user's data
UPDATE users SET email = :emailInput, restrictionID = :restrictionIDInput WHERE userID = :userID

-- delete a user
DELETE FROM users WHERE userID = :userID

-- get a single recipe's data
SELECT recipeID, name, servings, restrictionID FROM recipes WHERE recipeID = :recipeID

-- add a new recipe
INSERT INTO recipes (name, servings, restrictionID) VALUES (:nameInput, :servingsInput, :restrictionIDInput)

-- update a recipe's data
UPDATE recipes SET name = :nameInput, servings = :servingsInput, restrictionID = :restrictionIDInput WHERE recipeID = :recipeID

-- delete a recipe
DELETE FROM recipes WHERE recipeID = :recipeID

-- get all ingredients in a recipe
SELECT recipeIngredients.ingredientID, recipeIngredients.quantity, recipeIngredients.units, ingredients.name
FROM recipeIngredients 
INNER JOIN ingredients ON recipeIngredients.ingredientID = ingredients.ingredientID 
WHERE recipeIngredients.recipeID = :recipeID

-- add an ingredient to a recipe
INSERT INTO recipeIngredients (ingredientID, recipeID, quantity, units) VALUES (:ingredientID, :recipeID, :quantity, :units)

-- update an ingredient in a recipe
UPDATE recipeIngredients SET quantity = :quantity, units = :units WHERE ingredientID = :ingredientID AND recipeID = :recipeID

-- delete an ingredient from a recipe
DELETE FROM recipeIngredients WHERE ingredientID = :ingredientID AND recipeID = :recipeID

-- dis-associate a recipe from a user
DELETE FROM userRecipes WHERE userID = :userID AND recipeID = :recipeID
