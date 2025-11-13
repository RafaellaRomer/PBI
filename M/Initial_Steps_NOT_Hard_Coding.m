//  CSV. DOCUMENT() step ->binary to table

let

  Origen = SharePoint.Files(ruta_shp, [ApiVersion = 15]),

  filtra_carpeta = Table.SelectRows(
    Origen,
    each [Folder Path] = ruta_shp & ruta_carpeta and [Extension] = ".csv"
  ),

  csv = Table.TransformColumns(
    filtra_carpeta,
    {
      {
        "Content",
        each Csv.Document(
          _,
          [Delimiter = ";", Columns = 12, Encoding = 65001, QuoteStyle = QuoteStyle.None]
        )
      }
   }
),

  Content = csv[[Content]], // lista de tablas de una carpeta, donde se aplica la funcion de tabla si hay

  tbl = Content[Content]{0}, // para acceder conteuno primer archivo, primer paso de una funcion de tabla


in

  tbl
 


// EXCEL.WORKBOOK step ->binary to table

let
    Origen = SharePoint.Files(ruta_shp, [ApiVersion = 15]),
    filtra_carpeta = Table.SelectRows(Origen, each 
    [Folder Path] = ruta_shp & ruta_carpeta 
     and [Extension] = ".xslx"),
    csv = Table.TransformColumns(filtra_carpeta, 
        {
            {"Content", each Excel.Workbok(_) }
        }
        )

in
    csv

