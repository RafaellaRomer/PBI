# PBI_M_Replacing_Multiple_Values
Some exemplos and code about how to replace multiple values on a table using list.accumulate

## PRACTICAL EXEMPLE

The Nielsen route´s names are changed from one fiscal year to another.
They need to see te historical data within the new rouetes names.
We need to massively lookup the old values and replace then with the new values.
As route isnt a primary key and isn't used for connections on the model, the step just need to be done on the dimension table dim_routes

## FUNCION 

list.accumulate()

  ### EXPLANATION

### REQUIREMENTS 

- A table with old_values (to be replaced) column and new_values column (replace with)
