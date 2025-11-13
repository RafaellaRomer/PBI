// To use this code:
  // invoque the fuction as a step after the table to agregate the base64 column fx_webImg_toBase64 (table_previuos_step)
  // in web_contents = define the name of the column yhat contains the web link [Col_Contains_Image_Link]
  // in web_contents and binary_toText define the "Column_Name1" and "Column_Name2"
  // keep or remove the quita_col step, it removes the non more usable initial and created columns
  

fx_webImg_toBase64 = (tabela as table) as table =>
       let
           web_contents = Table.AddColumn(tabela, "Column_Name1", each Web.Contents([Col_Contains_Image_Link])),  
           binary_toText = Table.AddColumn(web_contents, "Column_Name2", each "data:image/png;base64, " & Binary.ToText([Column_Name1], BinaryEncoding.Base64)),
           quita_col = Table.RemoveColumns(binary_toText, {"Column_Name1", "Col_Contains_Image_Link"})
       in
           quita_col


// put conditions to not return return errors in case of empty fields

Col_Contains_Image_Link

= (tabela as table) as table =>

        let

            web_contents = Table.AddColumn(tabela, "Column_Name1", each 

                                if [Col_Contains_Image_Link] <> null then Web.Contents([Col_Contains_Image_Link])

                                 else null

                            ),

            binary_toText = Table.AddColumn(web_contents, "Column_Name2", each 

                                if [Icon_Web] <> null then "data:image/png;base64, " & Binary.ToText([Column_Name1], BinaryEncoding.Base64)

                                else null

                            ),

            quita_col = Table.RemoveColumns(binary_toText, {"Column_Name1", "Col_Contains_Image_Link"})

        in

            quita_col
 
