TEXC = pdflatex
OUTPUT_DIRECTORY = tex-output
TEXFLAGS = --output-directory=./$(OUTPUT_DIRECTORY)
VIEWER = xdg-open

report.pdf: report.tex verilog/*
	
	# make directory for pdflatex output if it doesn't already exist
	if [ ! -d "$(OUTPUT_DIRECTORY)" ]; then mkdir $(OUTPUT_DIRECTORY); fi

	# compile the pdf to the output directory
	$(TEXC) $(TEXFLAGS) report.tex
	# 
	cp ./$(OUTPUT_DIRECTORY)/report.pdf ./report.pdf

.PHONY: pdf
pdf: 
	make report.pdf

.PHONY: view
view: report.pdf
	# open report with the pdf viewer
	$(VIEWER) report.pdf

.PHONY: clean
clean: 
	# remove the pdf file in the toplevel directory
	if [ -f "report.pdf" ]; then rm report.pdf; fi

.PHONY: purge
purge: 
	# remove the pdf file in the toplevel directory
	if [ -f "report.pdf" ]; then rm report.pdf; fi
	# remove the output files in the output directory
	if [ -d "$(OUTPUT_DIRECTORY)" ]; then rm $(OUTPUT_DIRECTORY)/*; fi
