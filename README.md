# PBI_M_Replacing_Multiple_Values
Some exemplos and code about how to replace multiple values on a table using list.accumulate

## PRACTICAL EXEMPLE

The Nielsen route´s names are changed from one fiscal year to another.
They need to see te historical data within the new rouetes names.
We need to massively lookup the old values and replace then with the new values.
As route isnt a primary key and isn't used for connections on the model, the step just need to be done on the dimension table dim_routes

## FUNCION 

list.accumulate()

  ### FUNCTION MS DOCUMENTATION

  List.Accumulate(list as list, seed as any , accumulator as function) as any
  
#1 - List: we will provide a resumen of the elements as list, this way the function can run along the items list applying the transformation we need. 
          Each item of the list represents de "current" value on our function

#2 - Seed (optional): where we will be applying the transformations. In this case is the table generated on the previous step

#3 - Function: (state, current) =>  transformations
      WHERE:
        state is
        current is the item where we are on our list, applyng the function we declared
        


### REQUIREMENTS 

- A table with old_values (to be replaced) column and new_values column (replace with)

  <img width="413" height="258" alt="nielsen_areas" src="https://github.com/user-attachments/assets/21443b42-fd84-45d1-b1c3-77b5b1e1b63d" />

- List.Accumulate applied on the table created on the previous P Query step

<img width="1076" height="207" alt="list_accumulate_areas" src="https://github.com/user-attachments/assets/dc62ecf6-3301-4bb5-bca3-72d9881f0d45" />
