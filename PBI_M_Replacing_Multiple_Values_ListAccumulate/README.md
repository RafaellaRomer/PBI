# PBI_M_Replacing_Multiple_Values

Some examples and M code showing how to replace multiple values in a table using `List.Accumulate` in Power Query (M language).

## FUNCTION FOCUS: `List.Accumulate()`

### FUNCTION MS DOCUMENTATION

```m
List.Accumulate(list as list, seed as any, accumulator as function) as any
```

### FUNCTION PARAMETERS

1. **List**:  
   A list of elements that the function will iterate through. Each item in the list is referred to as `current` during each iteration.

2. **Seed (initial state)**:  
   The value that will be transformed throughout the iterations. In this case, it's the table generated in the previous Power Query step.

3. **Function** `(state, current) => ...`:  
   - `state`: the accumulated result (starting as the seed and changing with each step).  
   - `current`: the current item from the list being processed.

---

## PRACTICAL EXAMPLE 1

Nielsen route names often change from one fiscal year to another.  
To allow users to view historical data using the new route names, we need to **massively replace** the old values with the new ones.  
Since the route name is not a primary key and is not used in data model relationships, this transformation is only needed in the `dim_routes` dimension table.

### REQUIREMENTS

- A table with two columns:
  - `OLD AREA`: the values to be replaced
  - `NEW AREA`: the new values to replace with

<img width="325" height="182" alt="1_areas" src="https://github.com/user-attachments/assets/671b24ba-b324-4998-b3e1-73ef498594b6" />


- `List.Accumulate` applied to the table generated in the previous Power Query step.

<img width="953" height="202" alt="3_M_commented" src="https://github.com/user-attachments/assets/005db38b-5348-4517-8886-2012a3e7339d" />

- `Table before correction by list.accumulate:`
- 
  <img width="571" height="301" alt="2_record_routes_area_ex1_OLD" src="https://github.com/user-attachments/assets/2cc49166-a00d-40d4-9242-6068e952c658" />

-  `Table after correction by list.accumulate:`
-  
<img width="563" height="429" alt="2_record_routes_area_ex1_NEW" src="https://github.com/user-attachments/assets/7eb3ffc6-776c-4057-8fb6-049f7a700db4" />


### DATASET FOR EXAMPLE 1

[Areas_To_Change.xlsx](https://github.com/RafaellaRomer/PBI_M_Replacing_Multiple_Values/blob/main/Areas_To_Change.xlsx)

### POWER BI WITH THE EXAMPLE

*(Add screenshot or link here if available)*

---

## PRACTICAL EXAMPLE 2

A small company uses a monthly Excel file to report sales by company.  
Due to manual data entry, the same company may appear under different spellings.  
To correctly report sales by company and date in Power BI, the names must be cleaned and unified.

### REQUIREMENTS

- A table with two columns:
  - `Old Company Name`: incorrect or inconsistent spellings
  - `New Company Name`: the correct spelling
  
<img width="326" height="250" alt="4_companies_list_ex2" src="https://github.com/user-attachments/assets/df8e569a-4c2a-4cd7-8cdc-f8086216d659" />

- Apply `List.Accumulate` to clean the data using the replacement table.

  <img width="405" height="207" alt="5_list_accumulate_ex2" src="https://github.com/user-attachments/assets/23b58568-ebc0-479c-83df-0d02a7444817" />

#### IMPORTANT: 
When standardizing company names, it's important to choose the appropriate replacement method. Power Query provides both Replacer.ReplaceText and Replacer.ReplaceValue:

  - ReplaceText performs partial (substring) replacements.
  - ReplaceValue replaces only exact (whole value) matches.
  - 
In this case, since we're standardizing full company names, Replacer.ReplaceValue is used to ensure only complete matches are replaced. It's worth keeping this distinction in mind when adapting or extending the logic.

- `Table before correction by list.accumulate:`
<img width="713" height="232" alt="6_sales_before_listaccumulate" src="https://github.com/user-attachments/assets/1a22e87a-6481-4e67-a56c-189a95fe9651" />

-  `Table after correction by list.accumulate:`
<img width="716" height="677" alt="7_sales_after_listaccumulate_ex2" src="https://github.com/user-attachments/assets/1740e2d4-aab3-4275-9b28-9a1aa9280c66" />


### DATASET FOR EXAMPLE 2

[Ex2_companys_sales_2025.xlsx](https://github.com/RafaellaRomer/PBI_M_Replacing_Multiple_Values/blob/5755d658f77b6af2748465c6a962aa1995a148c3/Ex2_companys_sales_2025.xlsx)

### POWER BI WITH THE EXAMPLE

[List_Accumulate_up.pbix](https://github.com/RafaellaRomer/PBI_M_Replacing_Multiple_Values/blob/5755d658f77b6af2748465c6a962aa1995a148c3/List_Accumulate_up.pbix)

---

## NEW PRACTICAL USE - REPLACING VALUES IN MULTIPLE COLUMNS:

- `TO REPLACE / REPLACE WITH TABLE`
- 
  <img width="357" height="598" alt="prod_toreplace_replacewith" src="https://github.com/user-attachments/assets/5d5ccb8e-6f15-48df-a77d-2a0c31db686f" />

- `Input table`
- 
  <img width="367" height="407" alt="input_table" src="https://github.com/user-attachments/assets/9a56139b-5118-46eb-ad31-a0dea429d7d6" />

- `Output table`
- 
<img width="376" height="412" alt="output_table" src="https://github.com/user-attachments/assets/f81fa20f-e184-431c-8336-f63813fb834a" />

- `M CODE`
- 
  ```m
= List.Accumulate(

        {0..List.Count(prod_old_new[TO REPLACE])-1},
        Tipo_cambiado,
        (state, current) =>
         Table.ReplaceValue(   state,
            prod_old_new[TO REPLACE]{current},
            prod_old_new[REPLACE WITH]{current},
            Replacer.ReplaceValue,
            {
            "COL1 SELECCIONA EL PRODUCTO",
             "COL2, SELECCIONA EL PRODUCTO",
             "COL3, SELECCIONA EL PRODUCTO"
             }
        )
    )
```
