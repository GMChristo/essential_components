import 'dart:convert';

import 'package:archive/archive.dart';
//import 'package:archive/archive_io.dart';
import 'dart:html';

//models
import './models/doc_props/app.dart';
import './models/doc_props/core.dart';
import './models/rels/relationship.dart';
import './models/rels/relationships.dart';
import './models/xl/theme/theme.dart';
import './models/xl/shared_string.dart';
import './models/xl/workbook.dart';
import './models/xl/worksheets/worksheet.dart';
import './models/xl/style_sheet.dart';
import './models/content_types.dart';

class SimpleXLSX {
  List<List<String>> data = List<List<String>>();
  String _sheetName = "Sheet 1";

  SimpleXLSX() {}

  set sheetName(sheetName) {
    if (sheetName != null) {
      _sheetName = sheetName;
    }
  }

  get sheetName {
    return _sheetName;
  }

  addRow(List<String> row) {
    data.add(row);
  }

  setData(data) {
    if (data != null) {
      this.data = data;
    }
  }

  build() {
    int workbookRelationId = 1;
    int styleRelationId = 2;
    int sheetRelationId = 3;

    //_rels/.rels
    var rootRels = Relationships();
    rootRels.addWorkbook(workbookRelationId);

    //[Content_Types].xml
    var contentTypes = ContentTypes();

    //xl
    //xl\_rels\workbook.xml.rels
    var xlRels = Relationships();
    xlRels.addStyle(styleRelationId);
    xlRels.addWorksheet(sheetRelationId);
    xlRels.toStringXml();

    //xl\workbook.xml
    var workbook = Workbook();
    workbook.addSheet(Sheet(_sheetName, sheetRelationId));
    workbook.toStringXml();

    //xl\worksheets\sheet1.xml
    var worksheet = Worksheet();
    //worksheet.addConlSettings(Col());
    //preenche com os dados
    if (data != null) {
      int rowIndex = 1;
      data.forEach((value) {
        var row = Row(rowIndex);
        int cellIndex = 0;
        value.forEach((v) {
          row.addCellText(v, cellIndex: cellIndex);
          cellIndex++;
        });

        worksheet.addRow(row);
        rowIndex++;
      });
    }

    worksheet.toStringXml();

    //xl\styles.xml
    var styleSheet = StyleSheet();
    styleSheet.toStringXml();

    var rootRelsBytes = rootRels.toFileBytes();
    var contentTypesBytes = contentTypes.toFileBytes();
    var xlRelsBytes = xlRels.toFileBytes();
    var worksheetBytes = worksheet.toFileBytes();
    var workbookBytes = workbook.toFileBytes();
    var styleSheetBytes = styleSheet.toFileBytes();

    Archive archive = Archive();
    archive.addFile(ArchiveFile('_rels/.rels', rootRelsBytes.length, rootRelsBytes));
    archive.addFile(ArchiveFile('[Content_Types].xml', contentTypesBytes.length, contentTypesBytes));
    archive.addFile(ArchiveFile('xl/_rels/workbook.xml.rels', xlRelsBytes.length, xlRelsBytes));
    archive.addFile(ArchiveFile('xl/worksheets/sheet1.xml', worksheetBytes.length, worksheetBytes));
    archive.addFile(ArchiveFile('xl/workbook.xml', workbookBytes.length, workbookBytes));
    archive.addFile(ArchiveFile('xl/styles.xml', styleSheetBytes.length, styleSheetBytes));
    List<int> encodedzipdata = ZipEncoder().encode(archive);

    //application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
    //'application/zip'
    var blob = Blob([encodedzipdata], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    var downloadUrl = Url.createObjectUrlFromBlob(blob);

    AnchorElement(href: downloadUrl)
      ..setAttribute("download", "dados.xlsx") //xlsx
      ..click();
  }
}