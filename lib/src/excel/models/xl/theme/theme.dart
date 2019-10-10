import 'package:xml/xml.dart' as xml;
import 'dart:convert';

//\xl\theme\theme1.xml
class Theme {
  Map<String, String> namespaces = {
    "http://schemas.openxmlformats.org/drawingml/2006/main": "a",
  };
  toStringXml() {
    /*var builder = xml.XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="UTF-8" standalone="yes"');
    //coreProperties
    builder.element('coreProperties',
        namespace: "http://schemas.openxmlformats.org/drawingml/2006/main", namespaces: namespaces, nest: () {});
    var theme = builder.build();
    var result = theme.toXmlString(pretty: true);*/

    var base64Str ='PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/Pgo8YTp0aGVtZSB4bWxuczphPSJodHRwOi8vc2NoZW1hcy5vcGVueG1sZm9ybWF0cy5vcmcvZHJhd2luZ21sLzIwMDYvbWFpbiIgbmFtZT0iVGVtYSBkbyBPZmZpY2UiPgogICAgPGE6dGhlbWVFbGVtZW50cz4KICAgICAgICA8YTpjbHJTY2hlbWUgbmFtZT0iT2ZmaWNlIj4KICAgICAgICAgICAgPGE6ZGsxPgogICAgICAgICAgICAgICAgPGE6c3lzQ2xyIHZhbD0id2luZG93VGV4dCIgbGFzdENscj0iMDAwMDAwIiAvPgogICAgICAgICAgICA8L2E6ZGsxPgogICAgICAgICAgICA8YTpsdDE+CiAgICAgICAgICAgICAgICA8YTpzeXNDbHIgdmFsPSJ3aW5kb3ciIGxhc3RDbHI9IkZGRkZGRiIgLz4KICAgICAgICAgICAgPC9hOmx0MT4KICAgICAgICAgICAgPGE6ZGsyPgogICAgICAgICAgICAgICAgPGE6c3JnYkNsciB2YWw9IjQ0NTQ2QSIgLz4KICAgICAgICAgICAgPC9hOmRrMj4KICAgICAgICAgICAgPGE6bHQyPgogICAgICAgICAgICAgICAgPGE6c3JnYkNsciB2YWw9IkU3RTZFNiIgLz4KICAgICAgICAgICAgPC9hOmx0Mj4KICAgICAgICAgICAgPGE6YWNjZW50MT4KICAgICAgICAgICAgICAgIDxhOnNyZ2JDbHIgdmFsPSI0NDcyQzQiIC8+CiAgICAgICAgICAgIDwvYTphY2NlbnQxPgogICAgICAgICAgICA8YTphY2NlbnQyPgogICAgICAgICAgICAgICAgPGE6c3JnYkNsciB2YWw9IkVEN0QzMSIgLz4KICAgICAgICAgICAgPC9hOmFjY2VudDI+CiAgICAgICAgICAgIDxhOmFjY2VudDM+CiAgICAgICAgICAgICAgICA8YTpzcmdiQ2xyIHZhbD0iQTVBNUE1IiAvPgogICAgICAgICAgICA8L2E6YWNjZW50Mz4KICAgICAgICAgICAgPGE6YWNjZW50ND4KICAgICAgICAgICAgICAgIDxhOnNyZ2JDbHIgdmFsPSJGRkMwMDAiIC8+CiAgICAgICAgICAgIDwvYTphY2NlbnQ0PgogICAgICAgICAgICA8YTphY2NlbnQ1PgogICAgICAgICAgICAgICAgPGE6c3JnYkNsciB2YWw9IjVCOUJENSIgLz4KICAgICAgICAgICAgPC9hOmFjY2VudDU+CiAgICAgICAgICAgIDxhOmFjY2VudDY+CiAgICAgICAgICAgICAgICA8YTpzcmdiQ2xyIHZhbD0iNzBBRDQ3IiAvPgogICAgICAgICAgICA8L2E6YWNjZW50Nj4KICAgICAgICAgICAgPGE6aGxpbms+CiAgICAgICAgICAgICAgICA8YTpzcmdiQ2xyIHZhbD0iMDU2M0MxIiAvPgogICAgICAgICAgICA8L2E6aGxpbms+CiAgICAgICAgICAgIDxhOmZvbEhsaW5rPgogICAgICAgICAgICAgICAgPGE6c3JnYkNsciB2YWw9Ijk1NEY3MiIgLz4KICAgICAgICAgICAgPC9hOmZvbEhsaW5rPgogICAgICAgIDwvYTpjbHJTY2hlbWU+CiAgICAgICAgPGE6Zm9udFNjaGVtZSBuYW1lPSJPZmZpY2UiPgogICAgICAgICAgICA8YTptYWpvckZvbnQ+CiAgICAgICAgICAgICAgICA8YTpsYXRpbiB0eXBlZmFjZT0iQ2FsaWJyaSBMaWdodCIgcGFub3NlPSIwMjBGMDMwMjAyMDIwNDAzMDIwNCIgLz4KICAgICAgICAgICAgICAgIDxhOmVhIHR5cGVmYWNlPSIiIC8+CiAgICAgICAgICAgICAgICA8YTpjcyB0eXBlZmFjZT0iIiAvPiAgICAgICAgICAgCiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iQXJhYiIgdHlwZWZhY2U9IlRpbWVzIE5ldyBSb21hbiIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJIZWJyIiB0eXBlZmFjZT0iVGltZXMgTmV3IFJvbWFuIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlRoYWkiIHR5cGVmYWNlPSJUYWhvbWEiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iRXRoaSIgdHlwZWZhY2U9Ik55YWxhIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IkJlbmciIHR5cGVmYWNlPSJWcmluZGEiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iR3VqciIgdHlwZWZhY2U9IlNocnV0aSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJLaG1yIiB0eXBlZmFjZT0iTW9vbEJvcmFuIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IktuZGEiIHR5cGVmYWNlPSJUdW5nYSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJHdXJ1IiB0eXBlZmFjZT0iUmFhdmkiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iQ2FucyIgdHlwZWZhY2U9IkV1cGhlbWlhIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IkNoZXIiIHR5cGVmYWNlPSJQbGFudGFnZW5ldCBDaGVyb2tlZSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJZaWlpIiB0eXBlZmFjZT0iTWljcm9zb2Z0IFlpIEJhaXRpIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlRpYnQiIHR5cGVmYWNlPSJNaWNyb3NvZnQgSGltYWxheWEiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iVGhhYSIgdHlwZWZhY2U9Ik1WIEJvbGkiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iRGV2YSIgdHlwZWZhY2U9Ik1hbmdhbCIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJUZWx1IiB0eXBlZmFjZT0iR2F1dGFtaSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJUYW1sIiB0eXBlZmFjZT0iTGF0aGEiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iU3lyYyIgdHlwZWZhY2U9IkVzdHJhbmdlbG8gRWRlc3NhIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9Ik9yeWEiIHR5cGVmYWNlPSJLYWxpbmdhIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9Ik1seW0iIHR5cGVmYWNlPSJLYXJ0aWthIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9Ikxhb28iIHR5cGVmYWNlPSJEb2tDaGFtcGEiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iU2luaCIgdHlwZWZhY2U9Iklza29vbGEgUG90YSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJNb25nIiB0eXBlZmFjZT0iTW9uZ29saWFuIEJhaXRpIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlZpZXQiIHR5cGVmYWNlPSJUaW1lcyBOZXcgUm9tYW4iIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iVWlnaCIgdHlwZWZhY2U9Ik1pY3Jvc29mdCBVaWdodXIiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iR2VvciIgdHlwZWZhY2U9IlN5bGZhZW4iIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iQXJtbiIgdHlwZWZhY2U9IkFyaWFsIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IkJ1Z2kiIHR5cGVmYWNlPSJMZWVsYXdhZGVlIFVJIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IkJvcG8iIHR5cGVmYWNlPSJNaWNyb3NvZnQgSmhlbmdIZWkiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iSmF2YSIgdHlwZWZhY2U9IkphdmFuZXNlIFRleHQiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iTGlzdSIgdHlwZWZhY2U9IlNlZ29lIFVJIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9Ik15bXIiIHR5cGVmYWNlPSJNeWFubWFyIFRleHQiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iTmtvbyIgdHlwZWZhY2U9IkVicmltYSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJPbGNrIiB0eXBlZmFjZT0iTmlybWFsYSBVSSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJPc21hIiB0eXBlZmFjZT0iRWJyaW1hIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlBoYWciIHR5cGVmYWNlPSJQaGFnc3BhIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlN5cm4iIHR5cGVmYWNlPSJFc3RyYW5nZWxvIEVkZXNzYSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJTeXJqIiB0eXBlZmFjZT0iRXN0cmFuZ2VsbyBFZGVzc2EiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iU3lyZSIgdHlwZWZhY2U9IkVzdHJhbmdlbG8gRWRlc3NhIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlNvcmEiIHR5cGVmYWNlPSJOaXJtYWxhIFVJIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlRhbGUiIHR5cGVmYWNlPSJNaWNyb3NvZnQgVGFpIExlIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlRhbHUiIHR5cGVmYWNlPSJNaWNyb3NvZnQgTmV3IFRhaSBMdWUiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iVGZuZyIgdHlwZWZhY2U9IkVicmltYSIgLz4KICAgICAgICAgICAgPC9hOm1ham9yRm9udD4KICAgICAgICAgICAgPGE6bWlub3JGb250PgogICAgICAgICAgICAgICAgPGE6bGF0aW4gdHlwZWZhY2U9IkNhbGlicmkiIHBhbm9zZT0iMDIwRjA1MDIwMjAyMDQwMzAyMDQiIC8+CiAgICAgICAgICAgICAgICA8YTplYSB0eXBlZmFjZT0iIiAvPgogICAgICAgICAgICAgICAgPGE6Y3MgdHlwZWZhY2U9IiIgLz4gICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IkFyYWIiIHR5cGVmYWNlPSJBcmlhbCIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJIZWJyIiB0eXBlZmFjZT0iQXJpYWwiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iVGhhaSIgdHlwZWZhY2U9IlRhaG9tYSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJFdGhpIiB0eXBlZmFjZT0iTnlhbGEiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iQmVuZyIgdHlwZWZhY2U9IlZyaW5kYSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJHdWpyIiB0eXBlZmFjZT0iU2hydXRpIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IktobXIiIHR5cGVmYWNlPSJEYXVuUGVuaCIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJLbmRhIiB0eXBlZmFjZT0iVHVuZ2EiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iR3VydSIgdHlwZWZhY2U9IlJhYXZpIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IkNhbnMiIHR5cGVmYWNlPSJFdXBoZW1pYSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJDaGVyIiB0eXBlZmFjZT0iUGxhbnRhZ2VuZXQgQ2hlcm9rZWUiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iWWlpaSIgdHlwZWZhY2U9Ik1pY3Jvc29mdCBZaSBCYWl0aSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJUaWJ0IiB0eXBlZmFjZT0iTWljcm9zb2Z0IEhpbWFsYXlhIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlRoYWEiIHR5cGVmYWNlPSJNViBCb2xpIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IkRldmEiIHR5cGVmYWNlPSJNYW5nYWwiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iVGVsdSIgdHlwZWZhY2U9IkdhdXRhbWkiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iVGFtbCIgdHlwZWZhY2U9IkxhdGhhIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlN5cmMiIHR5cGVmYWNlPSJFc3RyYW5nZWxvIEVkZXNzYSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJPcnlhIiB0eXBlZmFjZT0iS2FsaW5nYSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJNbHltIiB0eXBlZmFjZT0iS2FydGlrYSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJMYW9vIiB0eXBlZmFjZT0iRG9rQ2hhbXBhIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlNpbmgiIHR5cGVmYWNlPSJJc2tvb2xhIFBvdGEiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iTW9uZyIgdHlwZWZhY2U9Ik1vbmdvbGlhbiBCYWl0aSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJWaWV0IiB0eXBlZmFjZT0iQXJpYWwiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iVWlnaCIgdHlwZWZhY2U9Ik1pY3Jvc29mdCBVaWdodXIiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iR2VvciIgdHlwZWZhY2U9IlN5bGZhZW4iIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iQXJtbiIgdHlwZWZhY2U9IkFyaWFsIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IkJ1Z2kiIHR5cGVmYWNlPSJMZWVsYXdhZGVlIFVJIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IkJvcG8iIHR5cGVmYWNlPSJNaWNyb3NvZnQgSmhlbmdIZWkiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iSmF2YSIgdHlwZWZhY2U9IkphdmFuZXNlIFRleHQiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iTGlzdSIgdHlwZWZhY2U9IlNlZ29lIFVJIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9Ik15bXIiIHR5cGVmYWNlPSJNeWFubWFyIFRleHQiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iTmtvbyIgdHlwZWZhY2U9IkVicmltYSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJPbGNrIiB0eXBlZmFjZT0iTmlybWFsYSBVSSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJPc21hIiB0eXBlZmFjZT0iRWJyaW1hIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlBoYWciIHR5cGVmYWNlPSJQaGFnc3BhIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlN5cm4iIHR5cGVmYWNlPSJFc3RyYW5nZWxvIEVkZXNzYSIgLz4KICAgICAgICAgICAgICAgIDxhOmZvbnQgc2NyaXB0PSJTeXJqIiB0eXBlZmFjZT0iRXN0cmFuZ2VsbyBFZGVzc2EiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iU3lyZSIgdHlwZWZhY2U9IkVzdHJhbmdlbG8gRWRlc3NhIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlNvcmEiIHR5cGVmYWNlPSJOaXJtYWxhIFVJIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlRhbGUiIHR5cGVmYWNlPSJNaWNyb3NvZnQgVGFpIExlIiAvPgogICAgICAgICAgICAgICAgPGE6Zm9udCBzY3JpcHQ9IlRhbHUiIHR5cGVmYWNlPSJNaWNyb3NvZnQgTmV3IFRhaSBMdWUiIC8+CiAgICAgICAgICAgICAgICA8YTpmb250IHNjcmlwdD0iVGZuZyIgdHlwZWZhY2U9IkVicmltYSIgLz4KICAgICAgICAgICAgPC9hOm1pbm9yRm9udD4KICAgICAgICA8L2E6Zm9udFNjaGVtZT4KICAgICAgICA8YTpmbXRTY2hlbWUgbmFtZT0iT2ZmaWNlIj4KICAgICAgICAgICAgPGE6ZmlsbFN0eWxlTHN0PgogICAgICAgICAgICAgICAgPGE6c29saWRGaWxsPgogICAgICAgICAgICAgICAgICAgIDxhOnNjaGVtZUNsciB2YWw9InBoQ2xyIiAvPgogICAgICAgICAgICAgICAgPC9hOnNvbGlkRmlsbD4KICAgICAgICAgICAgICAgIDxhOmdyYWRGaWxsIHJvdFdpdGhTaGFwZT0iMSI+CiAgICAgICAgICAgICAgICAgICAgPGE6Z3NMc3Q+CiAgICAgICAgICAgICAgICAgICAgICAgIDxhOmdzIHBvcz0iMCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpzY2hlbWVDbHIgdmFsPSJwaENsciI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6bHVtTW9kIHZhbD0iMTEwMDAwIiAvPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxhOnNhdE1vZCB2YWw9IjEwNTAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTp0aW50IHZhbD0iNjcwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L2E6c2NoZW1lQ2xyPgogICAgICAgICAgICAgICAgICAgICAgICA8L2E6Z3M+CiAgICAgICAgICAgICAgICAgICAgICAgIDxhOmdzIHBvcz0iNTAwMDAiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6c2NoZW1lQ2xyIHZhbD0icGhDbHIiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxhOmx1bU1vZCB2YWw9IjEwNTAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpzYXRNb2QgdmFsPSIxMDMwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6dGludCB2YWw9IjczMDAwIiAvPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9hOnNjaGVtZUNscj4KICAgICAgICAgICAgICAgICAgICAgICAgPC9hOmdzPgogICAgICAgICAgICAgICAgICAgICAgICA8YTpncyBwb3M9IjEwMDAwMCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpzY2hlbWVDbHIgdmFsPSJwaENsciI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6bHVtTW9kIHZhbD0iMTA1MDAwIiAvPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxhOnNhdE1vZCB2YWw9IjEwOTAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTp0aW50IHZhbD0iODEwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L2E6c2NoZW1lQ2xyPgogICAgICAgICAgICAgICAgICAgICAgICA8L2E6Z3M+CiAgICAgICAgICAgICAgICAgICAgPC9hOmdzTHN0PgogICAgICAgICAgICAgICAgICAgIDxhOmxpbiBhbmc9IjU0MDAwMDAiIHNjYWxlZD0iMCIgLz4KICAgICAgICAgICAgICAgIDwvYTpncmFkRmlsbD4KICAgICAgICAgICAgICAgIDxhOmdyYWRGaWxsIHJvdFdpdGhTaGFwZT0iMSI+CiAgICAgICAgICAgICAgICAgICAgPGE6Z3NMc3Q+CiAgICAgICAgICAgICAgICAgICAgICAgIDxhOmdzIHBvcz0iMCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpzY2hlbWVDbHIgdmFsPSJwaENsciI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6c2F0TW9kIHZhbD0iMTAzMDAwIiAvPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxhOmx1bU1vZCB2YWw9IjEwMjAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTp0aW50IHZhbD0iOTQwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L2E6c2NoZW1lQ2xyPgogICAgICAgICAgICAgICAgICAgICAgICA8L2E6Z3M+CiAgICAgICAgICAgICAgICAgICAgICAgIDxhOmdzIHBvcz0iNTAwMDAiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6c2NoZW1lQ2xyIHZhbD0icGhDbHIiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxhOnNhdE1vZCB2YWw9IjExMDAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpsdW1Nb2QgdmFsPSIxMDAwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6c2hhZGUgdmFsPSIxMDAwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L2E6c2NoZW1lQ2xyPgogICAgICAgICAgICAgICAgICAgICAgICA8L2E6Z3M+CiAgICAgICAgICAgICAgICAgICAgICAgIDxhOmdzIHBvcz0iMTAwMDAwIj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxhOnNjaGVtZUNsciB2YWw9InBoQ2xyIj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpsdW1Nb2QgdmFsPSI5OTAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpzYXRNb2QgdmFsPSIxMjAwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6c2hhZGUgdmFsPSI3ODAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvYTpzY2hlbWVDbHI+CiAgICAgICAgICAgICAgICAgICAgICAgIDwvYTpncz4KICAgICAgICAgICAgICAgICAgICA8L2E6Z3NMc3Q+CiAgICAgICAgICAgICAgICAgICAgPGE6bGluIGFuZz0iNTQwMDAwMCIgc2NhbGVkPSIwIiAvPgogICAgICAgICAgICAgICAgPC9hOmdyYWRGaWxsPgogICAgICAgICAgICA8L2E6ZmlsbFN0eWxlTHN0PgogICAgICAgICAgICA8YTpsblN0eWxlTHN0PgogICAgICAgICAgICAgICAgPGE6bG4gdz0iNjM1MCIgY2FwPSJmbGF0IiBjbXBkPSJzbmciIGFsZ249ImN0ciI+CiAgICAgICAgICAgICAgICAgICAgPGE6c29saWRGaWxsPgogICAgICAgICAgICAgICAgICAgICAgICA8YTpzY2hlbWVDbHIgdmFsPSJwaENsciIgLz4KICAgICAgICAgICAgICAgICAgICA8L2E6c29saWRGaWxsPgogICAgICAgICAgICAgICAgICAgIDxhOnByc3REYXNoIHZhbD0ic29saWQiIC8+CiAgICAgICAgICAgICAgICAgICAgPGE6bWl0ZXIgbGltPSI4MDAwMDAiIC8+CiAgICAgICAgICAgICAgICA8L2E6bG4+CiAgICAgICAgICAgICAgICA8YTpsbiB3PSIxMjcwMCIgY2FwPSJmbGF0IiBjbXBkPSJzbmciIGFsZ249ImN0ciI+CiAgICAgICAgICAgICAgICAgICAgPGE6c29saWRGaWxsPgogICAgICAgICAgICAgICAgICAgICAgICA8YTpzY2hlbWVDbHIgdmFsPSJwaENsciIgLz4KICAgICAgICAgICAgICAgICAgICA8L2E6c29saWRGaWxsPgogICAgICAgICAgICAgICAgICAgIDxhOnByc3REYXNoIHZhbD0ic29saWQiIC8+CiAgICAgICAgICAgICAgICAgICAgPGE6bWl0ZXIgbGltPSI4MDAwMDAiIC8+CiAgICAgICAgICAgICAgICA8L2E6bG4+CiAgICAgICAgICAgICAgICA8YTpsbiB3PSIxOTA1MCIgY2FwPSJmbGF0IiBjbXBkPSJzbmciIGFsZ249ImN0ciI+CiAgICAgICAgICAgICAgICAgICAgPGE6c29saWRGaWxsPgogICAgICAgICAgICAgICAgICAgICAgICA8YTpzY2hlbWVDbHIgdmFsPSJwaENsciIgLz4KICAgICAgICAgICAgICAgICAgICA8L2E6c29saWRGaWxsPgogICAgICAgICAgICAgICAgICAgIDxhOnByc3REYXNoIHZhbD0ic29saWQiIC8+CiAgICAgICAgICAgICAgICAgICAgPGE6bWl0ZXIgbGltPSI4MDAwMDAiIC8+CiAgICAgICAgICAgICAgICA8L2E6bG4+CiAgICAgICAgICAgIDwvYTpsblN0eWxlTHN0PgogICAgICAgICAgICA8YTplZmZlY3RTdHlsZUxzdD4KICAgICAgICAgICAgICAgIDxhOmVmZmVjdFN0eWxlPgogICAgICAgICAgICAgICAgICAgIDxhOmVmZmVjdExzdCAvPgogICAgICAgICAgICAgICAgPC9hOmVmZmVjdFN0eWxlPgogICAgICAgICAgICAgICAgPGE6ZWZmZWN0U3R5bGU+CiAgICAgICAgICAgICAgICAgICAgPGE6ZWZmZWN0THN0IC8+CiAgICAgICAgICAgICAgICA8L2E6ZWZmZWN0U3R5bGU+CiAgICAgICAgICAgICAgICA8YTplZmZlY3RTdHlsZT4KICAgICAgICAgICAgICAgICAgICA8YTplZmZlY3RMc3Q+CiAgICAgICAgICAgICAgICAgICAgICAgIDxhOm91dGVyU2hkdyBibHVyUmFkPSI1NzE1MCIgZGlzdD0iMTkwNTAiIGRpcj0iNTQwMDAwMCIgYWxnbj0iY3RyIiByb3RXaXRoU2hhcGU9IjAiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6c3JnYkNsciB2YWw9IjAwMDAwMCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6YWxwaGEgdmFsPSI2MzAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvYTpzcmdiQ2xyPgogICAgICAgICAgICAgICAgICAgICAgICA8L2E6b3V0ZXJTaGR3PgogICAgICAgICAgICAgICAgICAgIDwvYTplZmZlY3RMc3Q+CiAgICAgICAgICAgICAgICA8L2E6ZWZmZWN0U3R5bGU+CiAgICAgICAgICAgIDwvYTplZmZlY3RTdHlsZUxzdD4KICAgICAgICAgICAgPGE6YmdGaWxsU3R5bGVMc3Q+CiAgICAgICAgICAgICAgICA8YTpzb2xpZEZpbGw+CiAgICAgICAgICAgICAgICAgICAgPGE6c2NoZW1lQ2xyIHZhbD0icGhDbHIiIC8+CiAgICAgICAgICAgICAgICA8L2E6c29saWRGaWxsPgogICAgICAgICAgICAgICAgPGE6c29saWRGaWxsPgogICAgICAgICAgICAgICAgICAgIDxhOnNjaGVtZUNsciB2YWw9InBoQ2xyIj4KICAgICAgICAgICAgICAgICAgICAgICAgPGE6dGludCB2YWw9Ijk1MDAwIiAvPgogICAgICAgICAgICAgICAgICAgICAgICA8YTpzYXRNb2QgdmFsPSIxNzAwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgPC9hOnNjaGVtZUNscj4KICAgICAgICAgICAgICAgIDwvYTpzb2xpZEZpbGw+CiAgICAgICAgICAgICAgICA8YTpncmFkRmlsbCByb3RXaXRoU2hhcGU9IjEiPgogICAgICAgICAgICAgICAgICAgIDxhOmdzTHN0PgogICAgICAgICAgICAgICAgICAgICAgICA8YTpncyBwb3M9IjAiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6c2NoZW1lQ2xyIHZhbD0icGhDbHIiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxhOnRpbnQgdmFsPSI5MzAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpzYXRNb2QgdmFsPSIxNTAwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6c2hhZGUgdmFsPSI5ODAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpsdW1Nb2QgdmFsPSIxMDIwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L2E6c2NoZW1lQ2xyPgogICAgICAgICAgICAgICAgICAgICAgICA8L2E6Z3M+CiAgICAgICAgICAgICAgICAgICAgICAgIDxhOmdzIHBvcz0iNTAwMDAiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6c2NoZW1lQ2xyIHZhbD0icGhDbHIiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxhOnRpbnQgdmFsPSI5ODAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpzYXRNb2QgdmFsPSIxMzAwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGE6c2hhZGUgdmFsPSI5MDAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpsdW1Nb2QgdmFsPSIxMDMwMDAiIC8+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L2E6c2NoZW1lQ2xyPgogICAgICAgICAgICAgICAgICAgICAgICA8L2E6Z3M+CiAgICAgICAgICAgICAgICAgICAgICAgIDxhOmdzIHBvcz0iMTAwMDAwIj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxhOnNjaGVtZUNsciB2YWw9InBoQ2xyIj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YTpzaGFkZSB2YWw9IjYzMDAwIiAvPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxhOnNhdE1vZCB2YWw9IjEyMDAwMCIgLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvYTpzY2hlbWVDbHI+CiAgICAgICAgICAgICAgICAgICAgICAgIDwvYTpncz4KICAgICAgICAgICAgICAgICAgICA8L2E6Z3NMc3Q+CiAgICAgICAgICAgICAgICAgICAgPGE6bGluIGFuZz0iNTQwMDAwMCIgc2NhbGVkPSIwIiAvPgogICAgICAgICAgICAgICAgPC9hOmdyYWRGaWxsPgogICAgICAgICAgICA8L2E6YmdGaWxsU3R5bGVMc3Q+CiAgICAgICAgPC9hOmZtdFNjaGVtZT4KICAgIDwvYTp0aGVtZUVsZW1lbnRzPgogICAgPGE6b2JqZWN0RGVmYXVsdHMgLz4KICAgIDxhOmV4dHJhQ2xyU2NoZW1lTHN0IC8+CiAgICA8YTpleHRMc3Q+CiAgICAgICAgPGE6ZXh0IHVyaT0iezA1QTRDMjVDLTA4NUUtNDM0MC04NUEzLUE1NTMxRTUxMERCMn0iPgogICAgICAgICAgICA8dGhtMTU6dGhlbWVGYW1pbHkgeG1sbnM6dGhtMTU9Imh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vb2ZmaWNlL3RoZW1lbWwvMjAxMi9tYWluIiBuYW1lPSJPZmZpY2UgVGhlbWUiIGlkPSJ7NjJGOTM5QjYtOTNBRi00REI4LTlDNkItRDZDN0RGREM1ODlGfSIgdmlkPSJ7NEEzQzQ2RTgtNjFDQy00NjAzLUE1ODktNzQyMkE0N0E4RTRBfSIgLz4KICAgICAgICA8L2E6ZXh0PgogICAgPC9hOmV4dExzdD4KPC9hOnRoZW1lPg==';
    var result = String.fromCharCodes(base64.decode(base64Str));
    print(result);
    return result;
  }
}
