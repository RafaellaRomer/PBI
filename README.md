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
        

    - 

    - List
    ZonasRef_Corregidas = List.Accumulate(
    {0..List.Count(Zonas_ref[ANTÍGUA Nielsen Area])-1}, 
  // lista da cantidad de valores que tenemos en nuestra tabla de zonas para sere cambiadas. 
// Es También el "current" de la función que vamos aplicar. A cada indice, vamos buscar en current el valor con este indice de la columna antigua y vamos a reemplaxzar con el valor con este indice de la columna NUEVA de la tabla de zonas 
    #"Texto recortado", // seed, y tambien el "state" dde la funcion que vamos utilizar. Donde vamos aplicar los cambios
    (state, current) => Table.ReplaceValue(state,Zonas_ref[ANTÍGUA Nielsen Area]{current},Zonas_ref[NUEVA Nielsen Area]{current},Replacer.ReplaceText,{"Nielsen Area"}) // esta es sencillamente  la funcion intrinseca de replace valules, con variables sustituidas por lo que nos pide la funcio list.accumulate() 
)

### REQUIREMENTS 

- A table with old_values (to be replaced) column and new_values column (replace with)

  <img width="413" height="258" alt="nielsen_areas" src="https://github.com/user-attachments/assets/21443b42-fd84-45d1-b1c3-77b5b1e1b63d" />

