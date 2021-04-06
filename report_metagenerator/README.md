# Report Metagenerator

Meta-stylesheet (XSLT 2) to generate another stylesheet that reports information from XML records into tabular format. 

## Use case

You have a set of data in XML that you want to report out to Excel, Google Sheets, etc. in tabular form. For example, a metadata records for a catalog. There could be one XML file with many records, or many XML files with one or more records each. The end result should be a table with one row per record and the desired information from each record, as obtained by XPATH expressions, in columns.

## How it works

1. Create an XML file like the `booklist_report_generator.xml` file provided. Required information:

    - filePath: relative path to folder containing one or more XML files to process.
    - itemContext: xpath to recurring element to report in rows.
    - xpathDefaultNamespace: namespace of the XML being processed.
    - delim1: character to use as tabular delimiter, e.g., a pipe (|) or tab character.
    - xpaths: list of xpath expressions which will form the columns.

2. Transform the data file against `report_metagenerator.xsl` and save the result. An example output is included as `booklist_report_generator_OUT.xsl`. This is an XSLT stylesheet that can be further customized and reused as needed.

3. Transform the outputted XSLT stylesheet against itself (i.e., as both input and transform doc). It will return a plain text file containing the tabular data.
