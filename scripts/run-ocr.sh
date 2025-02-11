#!/bin/bash

# Define input and output directories
INPUT_DIR=~/linux-utils/office/ocr-input
OUTPUT_DIR=~/linux-utils/office/ocr-output

for pdf_file in "$INPUT_DIR"/*.pdf; do
    # Check if there are actually PDF files
    if [ -f "$pdf_file" ]; then
        # Get just the filename without the path
        filename=$(basename "$pdf_file")

        echo "Processing: $filename"

        # Run OCRmyPDF
        ocrmypdf \
            --skip-text \
            "$pdf_file" \
            "$OUTPUT_DIR/$filename"

        # Check if OCR was successful
        if [ $? -eq 0 ]; then
            echo "Successfully processed: $filename"
        else
            echo "Error processing: $filename"
        fi
    fi
done

echo "OCR processing complete!"
