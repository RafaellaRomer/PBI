//  CSV. DOCUMENT

let
    Origen = SharePoint.Files(ruta_shp, [ApiVersion = 15]),
    filtra_carpeta = Table.SelectRows(Origen, each 
    [Folder Path] = ruta_shp & ruta_carpeta 
    and [Attributes]?[Hidden]? <> true
    and [Extension] = ".csv"),
    csv = Table.TransformColumns(filtra_carpeta, 
        {
            {"Content", each Csv.Document(_,[Delimiter=";", Columns=12, Encoding=65001, QuoteStyle=QuoteStyle.None]) }
        }
        )

in
    csv


// EXCEL.WORKBOOK

let
    Origen = SharePoint.Files(ruta_shp, [ApiVersion = 15]),
    filtra_carpeta = Table.SelectRows(Origen, each 
    [Folder Path] = ruta_shp & ruta_carpeta 
    and [Attributes]?[Hidden]? <> true
    and [Extension] = ".csv"),
    csv = Table.TransformColumns(filtra_carpeta, 
        {
            {"Content", each Excel.Workbok(_) }
        }
        )

in
    csv

