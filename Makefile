all: 
	make sync r-ver rstudio tidyverse verse

r-ver: .PHONY 
	make -C r-ver/ latest
rstudio: .PHONY
	make -C rstudio/ latest
tidyverse: .PHONY 
	make -C tidyverse/ latest
verse: .PHONY 
	make -C verse/ latest

sync:
	make -C r-ver/ sync 
	make -C rstudio/ sync
	make -C tidyverse/ sync
	make -C verse/ sync

.PHONY:
	echo "Building Rocker versioned images locally...\n"


clean::
	make -C r-ver/ clean 
	make -C rstudio/ clean
	make -C tidyverse/ clean
	make -C verse/ clean


