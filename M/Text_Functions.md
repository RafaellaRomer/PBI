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

m

= Text.Length(Text.From( true))
Returns: 4

m

= Text.Length(" ")
Returns 1 // there’s a space between quotes

EXAMPLE:

m

=> = Table.AddColumn(Origen, "Lenght", each Text.Length([Cadenas]))
Result:

Value	Result
empty	0
space	1

## 1.3. Belonging functions ()
### 1.3.1 Text.Contains()
Returns true or false. Then can be used to transform using the result.

EXAMPLE:

Table:

(example data source omitted for brevity)

Query:

m

let
    Origen = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("TVFBcoMwDPyKhnPLHxSjEGVki7EMHZrkC/lJT31SPlZhCuRij+TVand9uzWcekpMmRGGrAELiYC12DaPj1tjEXMBmslgA75+EIQjF+xwxWhoAVP3hnEyKf/PnJJGLRzsoA0aKQdGgZNm8suGFewSujEE1gQEHAehSKlgbaAL+4SgO/g6ondT0cQKE8pEuSMwlLO7qIgvlGogXFjICXhhU4MZjPLETmuHUK+L5p1QzdzRwjn2CsRZKqoeWfC0y+BkJY8R3SLCOez9zdBMYd0Z1a1ca0zd6DPu34vhkvcRWAmjCgKORRfSb3f/+k1vQ57jsCXZk5UlnI7uz2PX8Q/35+yRVYVrrHXV4w8=", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Cadenas = _t]),
    #"Tipo cambiado" = Table.TransformColumnTypes(Origen,{{"Cadenas", type text}}),
    #"Added Custom" = Table.AddColumn(#"Tipo cambiado", "Contains", each Text.Contains([Cadenas], "Ingenieria")),
    #"Added Custom2" = Table.AddColumn(#"Added Custom", "Contains2", each Text.Contains(Text.Proper( [Cadenas]), "Ingenieria")),
    #"Added Custom3" = Table.AddColumn(#"Added Custom2", "Contains3", each Text.Contains( [Cadenas], "Ingenieria", Comparer.OrdinalIgnoreCase )) 
in
    #"Added Custom3"
Returns: (table with boolean columns showing text containment)

###1.3.2. Text.StartWith() / Text.EndWith()
EXAMPLE

Table:

(example data source omitted)

Query:

m

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
Returns: (table with start and end checks)

### 1.3.3. Text.PositionOf / Text.PositionOfAny
Returns the position of a specified text.

Doesn’t accept null as a default value.

As optional, can give the number of occurrences to consider and an optional comparer function.

Occurrence modes:

Occurrence.All (returns a list)

Occurrence.First

Occurrence.Last

EXAMPLE POSITION OF:

It returns -1 for empty cell.

Occurrence.All (returns a list)
Occurrence.First
Occurrence.Last

1.4 – Extraction functions ()
1.4.1. Text.start / Text.end
Returns the text of the N characters specified.

EXAMPLE

QUERY

m
Copiar código
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
Copiar código
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
