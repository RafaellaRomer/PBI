# PBI-M-Text_Functions

# M INTERMEDIARIO notes

## 1 - TEXT FUNCTIONS

There exist 42 text functions in M.

M is case sensitive.

### General Structure

```m
Text.Action()
Consult functions:
```

“Nullable” values in functions = if there exist null values, it will return a null result.

##1.1. Text functions allow the user to:

- Obtain structure information (length, position, content)

- Change structure (insert, remove, replace, select)

- Extract text chains (before delimiter, after delimiter, etc)

- Convert other values to text

- Format text (concat, etc)

## 1.2 – Information functions ()
### 1.2.1. Text.Length()
```m

= Text.Length ("Power Query")
```
Output: 11

```m

= Text.Length (null)
Returns: null
```

```m

= Text.Length ("")
Returns: 0 // empty text string
```

```m
= Text.Length( 13648909847)
```
Returns: #ERROR // using number in a text function - has to use Text.From or between quotes

```m
= Text.Length(Text.From( 13648909847))
```
Returns: 11

```m

= Text.Length( true)
```
Returns: #ERROR // because is boolean values

```m

= Text.Length(Text.From( true))
```
Returns: 4

```m

= Text.Length(" ")
```
Returns 1 // there’s a space between quotes

EXAMPLE:
<img width="267" height="528" alt="image" src="https://github.com/user-attachments/assets/321fe84a-b868-46cd-bfd0-d713f6d32bbb" />   => = Table.AddColumn(Origen, "Lenght", each Text.Length([Cadenas]))


Result:

<img width="429" height="514" alt="image" src="https://github.com/user-attachments/assets/ea10791f-7703-4196-813a-691be6f6207c" />  empty	0, space	1


## 1.3. Belonging functions ()
### 1.3.1 Text.Contains()
Returns true or false. Then can be used to transform using the result.

<img width="598" height="422" alt="image" src="https://github.com/user-attachments/assets/a5a466e8-02c5-46b6-8912-1e016aaad408" />


EXAMPLE:


Query:

```m

let
    Origen = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("TVFBcoMwDPyKhnPLHxSjEGVki7EMHZrkC/lJT31SPlZhCuRij+TVand9uzWcekpMmRGGrAELiYC12DaPj1tjEXMBmslgA75+EIQjF+xwxWhoAVP3hnEyKf/PnJJGLRzsoA0aKQdGgZNm8suGFewSujEE1gQEHAehSKlgbaAL+4SgO/g6ondT0cQKE8pEuSMwlLO7qIgvlGogXFjICXhhU4MZjPLETmuHUK+L5p1QzdzRwjn2CsRZKqoeWfC0y+BkJY8R3SLCOez9zdBMYd0Z1a1ca0zd6DPu34vhkvcRWAmjCgKORRfSb3f/+k1vQ57jsCXZk5UlnI7uz2PX8Q/35+yRVYVrrHXV4w8=", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Cadenas = _t]),
    #"Tipo cambiado" = Table.TransformColumnTypes(Origen,{{"Cadenas", type text}}),
    #"Added Custom" = Table.AddColumn(#"Tipo cambiado", "Contains", each Text.Contains([Cadenas], "Ingenieria")),
    #"Added Custom2" = Table.AddColumn(#"Added Custom", "Contains2", each Text.Contains(Text.Proper( [Cadenas]), "Ingenieria")),
    #"Added Custom3" = Table.AddColumn(#"Added Custom2", "Contains3", each Text.Contains( [Cadenas], "Ingenieria", Comparer.OrdinalIgnoreCase )) 
in
    #"Added Custom3"
```
Returns: 

###1.3.2. Text.StartWith() / Text.EndWith()

<img width="816" height="369" alt="image" src="https://github.com/user-attachments/assets/0be71990-2ff9-4e3b-9ccf-9dade982892f" />
<img width="739" height="176" alt="image" src="https://github.com/user-attachments/assets/c9dd0251-052a-4000-8cbd-7033008babab" />


EXAMPLE

Query:

```m

let
    Origen = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("TVFBcoMwDPyKhnPLHxSjEGVki7EMHZrkC/lJT31SPlZhCuRij+TVand9uzWcekpMmRGGrAELiYC12DaPj1tjEXMBmslgA75+EIQjF+xwxWhoAVP3hnEyKf/PnJJGLRzsoA0aKQdGgZNm8suGFewSujEE1gQEHAehSKlgbaAL+4SgO/g6ondT0cQKE8pEuSMwlLO7qIgvlGogXFjICXhhU4MZjPLETmuHUK+L5p1QzdzRwjn2CsRZKqoeWfC0y+BkJY8R3SLCOez9zdBMYd0Z1a1ca0zd6DPu34vhkvcRWAmjCgKORRfSb3f/+k1vQ57jsCXZk5UlnI7uz2PX8Q/35+yRVYVrrHXV4w8=", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Cadenas = _t]),
    #"Tipo cambiado" = Table.TransformColumnTypes(Origen,{{"Cadenas", type text}}),
    Start = Table.AddColumn(#"Tipo cambiado" , "TextStartWith", each Text.StartsWith([Cadenas], "IN")),
    Satrt2 = Table.AddColumn(Start , "TextStartWith2", each Text.StartsWith([Cadenas], "In")),
    start3 = Table.AddColumn(Satrt2 , "TextStartWith3", each Text.StartsWith([Cadenas], "In", Comparer.OrdinalIgnoreCase)),
    end1 = Table.AddColumn(start3 , "TextEndsWith", each Text.EndsWith([Cadenas], "A")),
    end2 = Table.AddColumn(end1 , "TextEndsWith2", each Text.EndsWith([Cadenas], "a")),
    end3 = Table.AddColumn(end2 , "TextEndsWith3", each Text.EndsWith([Cadenas], "a", Comparer.OrdinalIgnoreCase))
in
    end3
```

Returns: 

<img width="1015" height="399" alt="image" src="https://github.com/user-attachments/assets/8c4de8ec-9b90-4fab-a2ea-b443d2934710" />




### 1.3.3. Text.PositionOf / Text.PositionOfAny
Returns the position of a specified text.
<img width="781" height="470" alt="image" src="https://github.com/user-attachments/assets/40cbcfc4-ee26-4adf-b10f-8d1f175d2521" />


Doesn’t accept null as a default value.
As optional, can give the number of occurrences to consider and an optional comparer function.

<img width="557" height="139" alt="image" src="https://github.com/user-attachments/assets/5c05d1a3-88a0-4325-a0a2-36c36768e647" />
<img width="791" height="210" alt="image" src="https://github.com/user-attachments/assets/0b2cb380-88ed-4422-afc8-f29fcfef6493" />
<img width="595" height="101" alt="image" src="https://github.com/user-attachments/assets/601e9f02-aaf8-4219-bf27-9b10176846ca" />


Occurrence modes:

    -  Occurrence.All (returns a list)

    - Occurrence.First

    - Occurrence.Last

EXAMPLE :

It returns -1 for empty cell.

<img width="940" height="489" alt="image" src="https://github.com/user-attachments/assets/da6990b2-66d5-4ed1-af10-bd8cac0af14b" />


## 1.4 – Extraction functions ()
### 1.4.1. Text.start / Text.end
Returns the text of the N characters specified.

EXAMPLE

QUERY

m

let
    Origen = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("PZDNroJQDITfhfVdnP63a4OCJkqIRoH4/q/hgZ7c5aSdbzrdto7Q5nkOYuu+f1tnSu/3G0zjkBKxLAsJpzTmvu9VouRU+Hq9kkZbBpqmSQThkA6lorhgksP9dDqhGjSvVBmGkmT0x+OhiokK8nEcAdEPWSMqSjAoveb7VdiCiHVdVwPIq8jofr8LOjWyfj4fiZYbJLfbzZgyyFHO5zOVkkFYcBgG5X8v7o2q55AMe18jbUFAz+fTGTSnGBVlQCnVsS6DGCbZ6HK5GEuitOxvp7BcFo3X6+Vh3F4XdQoF0qtcakGy9nYLqcsg7WYTqo1UuXq/Pw==", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Codigo = _t]),
    #"Tipo cambiado" = Table.TransformColumnTypes(Origen,{{"Codigo", type text}}),
    start = Table.AddColumn( #"Tipo cambiado", "Start", each Text.Start([Codigo], 3)),
    end = Table.AddColumn( start, "End", each Number.From( Text.End([Codigo], 4)))
in
    end
RESULT

(table returning start and end parts of the code)

1.4.2. Text.range / Text.middle
Text.Range: Asks text as text, an offset (position after which it will start returning the text), a number of characters wants to return.

Text.Middle: Similar, but allows longer ranges than the evaluated text.

EXAMPLE

TextRange doesn’t work with number of character greater than the evaluated text.

TextMiddle does.

CODE

m

let
    Origen = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("PZDNroJQDITfhfVdnP63a4OCJkqIRoH4/q/hgZ7c5aSdbzrdto7Q5nkOYuu+f1tnSu/3G0zjkBKxLAsJpzTmvu9VouRU+Hq9kkZbBpqmSQThkA6lorhgksP9dDqhGjSvVBmGkmT0x+OhiokK8nEcAdEPWSMqSjAoveb7VdiCiHVdVwPIq8jofr8LOjWyfj4fiZYbJLfbzZgyyFHO5zOVkkFYcBgG5X8v7o2q55AMe18jbUFAz+fTGTSnGBVlQCnVsS6DGCbZ6HK5GEuitOxvp7BcFo3X6+Vh3F4XdQoF0qtcakGy9nYLqcsg7WYTqo1UuXq/Pw==", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Codigo = _t]),
    #"Tipo cambiado" = Table.TransformColumnTypes(Origen,{{"Codigo", type text}}),
    range = Table.AddColumn( #"Tipo cambiado", "Range", each Text.Range([Codigo], 3, 3)),
    middle = Table.AddColumn(range, "Middle", each Text.Middle([Codigo], 3, 3)),
    middle2 = Table.AddColumn( middle, "Middle2", each Text.Middle([Codigo], 3, 10)),
    range2 = Table.AddColumn( middle2, "Range2", each Text.Range([Codigo], 3, 10))
in
    range2
RETURNS

(table with range and middle text columns)

1.3.3. Text.At
Returns the single character at the specified position.

Index starts at 0.

EXAMPLE

Doesn’t work if the index number is greater than number of characters.

## 1.5 – Transformation Functions

This section describes key **Power Query M functions** for text manipulation and how to handle nullable values safely — without raising errors.

---

### 1.5.1 Text.Lower / Text.Upper / Text.Proper

These functions transform the casing of text values and **accept nullable values** without returning errors.

#### ✅ Description

| Function | Description |
|-----------|--------------|
| `Text.Lower(text)` | Converts all letters to lowercase. |
| `Text.Upper(text)` | Converts all letters to uppercase. |
| `Text.Proper(text)` | Converts text to proper case (first letter uppercase). |

---

#### 💡 Example

```m
let
    Origen = Table.FromRows(
        Json.Document(
            Binary.Decompress(
                Binary.FromText("TVFBcsIwDPyKJueWPwhHgBjZylhOOinwAyY3ntFTn8THqjgl4WRLXq1215dLw+lIiSkzQpc1YCERsB3umtvHpbGIuQCNZPACPn8QhCMXbHHBaNgBpvYN42RS/p85JY1aONhGGzRSDowCe83kh3UL2CW0fQisCQg4dkKRUsHaQBf2CUFX8LlH76aiiRUGlIFyS2AoB3dREV8o1UA4sZAT8MymBiMY5YGd1jahXhfNK6GauaOZsz8qEGepqOlxv9dLFtyvUjhZyX1Et4lwCGv/ZWqksOyN6nbONaq29xnPwIvulNcRWAijCgL2RWfSb0/g+ZvehjzL7pXmkazMAbV0nbZd219cp9FjqwqXaOuq2x8=", BinaryEncoding.Base64),
                Compression.Deflate
            )
        ),
        let _t = ((type nullable text) meta [Serialized.Text = true]) 
        in type table [Cadenas = _t]
    ),

    #"Changed Type" = Table.TransformColumnTypes(Origen,{{"Cadenas", type text}}),
    lower = Table.AddColumn(#"Changed Type", "Lower", each Text.Lower([Cadenas])),
    upper = Table.AddColumn(lower, "Upper", each Text.Upper([Cadenas])),
    proper = Table.AddColumn(upper, "Proper", (x) => Text.Proper(x[Cadenas]))
in
    proper
```

#### 🧾 Returns

| Cadenas | Lower | Upper | Proper |
|----------|--------|--------|--------|
| Example Text | example text | EXAMPLE TEXT | Example Text |

---

### 1.5.2 Text.Insert / Text.PadStart / Text.PadEnd

These functions manipulate or format strings by inserting or padding characters.

#### ✅ Description

| Function | Description |
|-----------|--------------|
| `Text.Insert(text, position, substring)` | Inserts text at a specified position. |
| `Text.PadStart(text, count, character)` | Adds characters to the start until reaching the desired total length. |
| `Text.PadEnd(text, count, character)` | Adds characters to the end until reaching the desired total length. |

#### 🧩 Notes

- Useful inside **conditional statements**.
- They **require** a total character length (`count`) greater than zero.
- Great for formatting **dates**, **IDs**, or **numeric strings**.

---

#### 💡 Example

```m
let
    Origen = Table.FromRows(
        Json.Document(
            Binary.Decompress(
                Binary.FromText("bY+xEcAgDAN3oU4hCwjswrH/GvFBYlSkk2z5dR4jWTEjyDQvN8iubeuGGobNcIyhham6gIOCVSXlYwtzi3ZWP5VdT1CCRW3ZoZ+Fs6iNAtZGSklZD/Pl9tBZH8lfaD4=", BinaryEncoding.Base64),
                Compression.Deflate
            )
        ),
        let _t = ((type nullable text) meta [Serialized.Text = true]) 
        in type table [Fechas = _t]
    ),

    type_date = Table.TransformColumnTypes(Origen,{{"Fechas", Int64.Type}}),
    add_date2 = Table.DuplicateColumn(type_date, "Fechas", "Date2"),

    // ❌ Direct conversion may fail due to missing slashes
    chgTodate_Date2 = Table.TransformColumnTypes(add_date2,{{"Date2", type date}}),

    // ✅ Build a valid date text format with "/" based on string length
    add_date = Table.AddColumn(
        chgTodate_Date2, 
        "Correct Date", 
        each
            let
                txt = Text.From([Fechas]),
                cont = Text.Length(txt),
                Ins1 = if cont = 8 then Text.Insert(txt, 4, "/" )
                       else Text.Insert(txt, 3, "/" ),
                Ins2 = if cont = 8 then Text.Insert(Ins1, 2, "/" )
                       else Text.Insert(Ins1, 1, "/" )
            in
                Ins2
    ),

    // ✅ Alternative using Text.PadStart to simplify logic
    add_date_PAD = Table.AddColumn(
        add_date, 
        "Correct Date Pad", 
        each
            let
                txt = Text.From([Fechas]),
                txt_pad = Text.PadStart(txt, 8, "0"),
                InsPad = Text.Insert(txt_pad, 4, "/" ),
                InsPad2 = Text.Insert(InsPad, 2, "/" )
            in
                InsPad2
    )
in
    add_date_PAD
```

#### 🧾 Output Example

| Fechas | Correct Date | Correct Date Pad |
|--------|---------------|------------------|
| 1012024 | 10/1/2024 | 01/01/2024 |
| 23122023 | 23/12/2023 | 23/12/2023 |

---

### 1.5.3 Text.Remove / Text.Replace / Text.Select / Text.Split / Text.Combine

These additional text functions are commonly used for cleansing and restructuring string data.

| Function | Description |
|-----------|--------------|
| `Text.Remove(text, removeChars)` | Removes specified characters. |
| `Text.Replace(text, old, new)` | Replaces occurrences of a substring. |
| `Text.Select(text, selectChars)` | Keeps only specified characters. |
| `Text.Split(text, delimiter)` | Splits text into a list based on a delimiter. |
| `Text.Combine(list, delimiter)` | Joins list elements into a single string. |

---

## 2. SYNTAX – Function Operators

Power Query offers two equivalent syntaxes for row context:  
- `(_)=>` lambda functions  
- `each` shorthand expression

Both are interchangeable for simple row transformations.

#### 💡 Example

```m
let
    Origen = Table.FromRows(
        Json.Document(
            Binary.Decompress(
                Binary.FromText("TVFBcsIwDPyKJueWPwhHgBjZylhOOinwAyY3ntFTn8THqjgl4WRLXq1215dLw+lIiSkzQpc1YCERsB3umtvHpbGIuQCNZPACPn8QhCMXbHHBaNgBpvYN42RS/p85JY1aONhGGzRSDowCe83kh3UL2CW0fQisCQg4dkKRUsHaQBf2CUFX8LlH76aiiRUGlIFyS2AoB3dREV8o1UA4sZAT8MymBiMY5YGd1jahXhfNK6GauaOZsz8qEGepqOlxv9dLFtyvUjhZyX1Et4lwCGv/ZWqksOyN6nbONaq29xnPwIvulNcRWAijCgL2RWfSb0/g+ZvehjzL7pXmkazMAbV0nbZd219cp9FjqwqXaOuq2x8=", BinaryEncoding.Base64),
                Compression.Deflate
            )
        ),
        let _t = ((type nullable text) meta [Serialized.Text = true]) 
        in type table [Cadenas = _t]
    ),

    #"Changed Type" = Table.TransformColumnTypes(Origen,{{"Cadenas", type text}}),
    lower = Table.AddColumn(#"Changed Type", "Lower", each Text.Lower([Cadenas])),
    upper = Table.AddColumn(lower, "Upper", each Text.Upper([Cadenas])),

    // (_)=>_ returns all column values for the current row
    syntax = Table.AddColumn(upper, "Syntax1", (_)=> _),

    // (_)=>_[Cadenas] accesses only one specific column
    syntax2 = Table.AddColumn(syntax, "Syntax2", (_)=> _[Cadenas]),

    // ()=> equals "each", shorter and more readable
    syntax3 = Table.AddColumn(syntax2, "Syntax3", each [Cadenas]),

    // Applying a transformation function
    upper2 = Table.AddColumn(syntax3, "Upper2", each Text.Upper([Cadenas]))
in
    upper2
```

---

### 🧠 Summary

| Syntax | Equivalent To | Description |
|---------|----------------|-------------|
| `(_)=> _` | Returns a record with all column values. |
| `(_)=> _[Column]` | Returns a single column value. |
| `each [Column]` | Simplified version of lambda for row context. |

---

📄 **Author:** _Your Name_  
📅 **Version:** 1.0  
🔧 **Compatible with:** Power BI / Power Query Editor



