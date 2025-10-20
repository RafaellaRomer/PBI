# INDEX(), OFFSET AND WINDOW() FUNCTIONS

- Are a filter functions (tabular functions)
- Navigate across a orderen and partitioned table
- Have optional arguments, just one mandatory

## GENERAL SINTAXIS

```m
Function (<select rows>, <table>, <order by>, <blanks>, <partition by>)
```
<select rows> mandatory
<table> optional
<order by> optional
<blanks> optional
<partition by> optional

- INDEX() -line postition in absolute value / just one value at the time
- OFFSET() - relative position value (based on the actual line) / just one value at the time
- WINDOW() - works with max and minimun values, a rande of values, and works with absolute and relative values



