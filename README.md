# PBI_M_Replacing_Multiple_Values
Some exemplos and code about how to replace multiple values on a table using list.accumulate

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
        
## PRACTICAL EXEMPLE 1 

The Nielsen route´s names are changed from one fiscal year to another.
They need to see te historical data within the new rouetes names.
We need to massively lookup the old values and replace then with the new values.
As route isnt a primary key and isn't used for connections on the model, the step just need to be done on the dimension table dim_routes

### REQUIREMENTS 

- A table with old_values (to be replaced) column and new_values column (replace with)

  <img width="413" height="258" alt="nielsen_areas" src="https://github.com/user-attachments/assets/21443b42-fd84-45d1-b1c3-77b5b1e1b63d" />

- List.Accumulate applied on the table created on the previous P Query step

<img width="1076" height="207" alt="list_accumulate_areas" src="https://github.com/user-attachments/assets/dc62ecf6-3301-4bb5-bca3-72d9881f0d45" />

### Dataset for the exemple 1

src="https://github.com/RafaellaRomer/PBI_M_Replacing_Multiple_Values/blob/main/Areas_To_Change.xlsx"

### Power BI with the exemple

### M Code



## PRACTICAL EXEMPLE 2

A small company uses a montly excel to report sales by company
In consequences of this process the same company can have lots of differents spellings in the records.
The name wrong spelled have to be corrected to correct show sales by date and company on Power BI.
Soluntion: from a list wich has 2 columns, the wrong spell and right spell, massivily correct the company's names

### Requirements

- A table with old_values (to be replaced) column and new_values column (replace with)

- List.Accumulate applied on the table created on the previous P Query step

  ### Dataset for the exemple 1

### Power BI with the exemple

### M Code



