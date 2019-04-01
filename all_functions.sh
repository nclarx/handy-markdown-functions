#############################################
# Make Markdown into a PDF Book             #
#                                           #
# `mkPdfBk <outputFilename> <htmlTemplate>` #
#                                           #
# Create a formatted PDF book with a table  #
# of contents from markdown files in        #
# the current working directory.            #
#                                           #
# See `md_to_pdf_book` folder for docs      #
#                                           #
#############################################

function mkPdfBk() {
    outputFileName="$1"
    htmlTemplate="$2"

    pandoc -s *.md -f markdown -t html5 --template $htmlTemplate --section-divs --metadata-file meta.yaml -V current_date="$(date +%d-%m-%Y%n)" |
        wkhtmltopdf --outline --outline-depth '2' --margin-bottom '20' --footer-font-name 'HelveticaNeue-Regular' --footer-left '[doctitle] generated [date] at [time]' --footer-right 'Page [page] of [toPage]' --footer-font-size '8' --footer-spacing '5' toc --xsl-style-sheet './toc.xsl' - $outputFileName
}

#########################################
# Make a PDF from any text file         #
#                                       #
# `mkPdf <inputFile> <outputFile>`      #
#                                       #
# Creates a pdf from any text file.     #
#                                       #
# See `md_to_pdf_book` folder for docs  #
#                                       #
#########################################

function mkPdf() {
    inputFile=$1
    outputFile=$2
    pandoc $inputFile -t HTML5 |
        wkhtmltopdf - $outputFile
}
