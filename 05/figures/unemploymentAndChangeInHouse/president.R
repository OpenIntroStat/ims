raw   <- read.delim("president.txt", TRUE)
Dim   <- dim(raw)
hold  <- as.character(raw$years)
hold  <- strsplit(hold, "-")
start <- rep(0, Dim[1])
end   <- rep(0, Dim[1])
for(i in 1:Dim[1]){
	start[i] <- as.numeric(hold[[i]][1])
	end[i]   <- as.numeric(hold[[i]][2])
}
executive <- data.frame(potus=raw$potus,
						start=start,
						end=end,
						party=raw$party,
						vpotus=raw$vpotus)
n     <- length(unique(executive$potus))
potus <- data.frame(potus=rep('', n), start=rep(0,n), end=rep(0,n))
potus$potus <- as.character(potus$potus)
for(i in 1:43){
	potus$potus[i] <- as.character(unique(executive$potus)[i])
	these          <- which(executive$potus == potus$potus[i])
	potus$start[i] <- min(executive$start[these])
	potus$end[i]   <- max(executive$end[these])
}

