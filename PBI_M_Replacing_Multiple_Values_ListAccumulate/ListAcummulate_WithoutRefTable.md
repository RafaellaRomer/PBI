## List Accumulate Structure

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

### USE WITH LIST PARAMETERS

It's possible to declare the list inside the Table.AddColumn() for exemple, and gives the list as a list, a  column from the table directly as a seed and create a fiction directly putting the parameters names.

I the following exemple, "acumulator" parameter will be the seed [Message_correct], and the "character" will be each character in the list CaracteresParaRemover = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/", "-"}

````
    list_accumulate = Table.AddColumn(
        toRecords_transformCols, 
        "Clear_Message", 
        each 
            let 
                CharacterToRemove = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "/", "-"},
                
                ClearResult = List.Accumulate(
                    CaracteresParaRemover, 
                    [Message_correct], // references directly to the original column
                    (acumulador, character) => Text.Replace(acumulador, character, "") // accumulator is the seed [Message_correct], character is each list's item CaracteresParaRemover
                )
            in 
                ClearResult, 
        type text
    )

````

The step add a column with the text cleared, by removing numbers and special characters "/" and "-"
