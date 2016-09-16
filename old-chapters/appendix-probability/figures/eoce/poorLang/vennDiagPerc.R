library(VennDiagram)

venn.diagram.perc = function (x, filename, height = 3000, width = 3000, resolution = 500, 
    units = "px", compression = "lzw", na = "stop", main = NULL, 
    sub = NULL, main.pos = c(0.5, 1.05), main.fontface = "plain", 
    main.fontfamily = "serif", main.col = "black", main.cex = 1, 
    main.just = c(0.5, 1), sub.pos = c(0.5, 1.05), sub.fontface = "plain", 
    sub.fontfamily = "serif", sub.col = "black", sub.cex = 1, 
    sub.just = c(0.5, 1), category.names = names(x), ...) 
{
    options(warn = -1)
    if (na == "none") {
        x <- x
    }
    if (na == "stop") {
        for (i in 1:length(x)) {
            if (length(x[[i]][is.na(x[[i]])]) > 0) {
                stop("NAs in dataset", call. = FALSE)
            }
        }
    }
    if (na == "remove") {
        for (i in length(x)) {
            x[[i]] <- x[[i]][!is.na(x[[i]])]
        }
    }
    if (length(x) == 0 | length(x) > 4) {
        stop("Incorrect number of elements.", call. = FALSE)
    }
    if (length(x) == 1) {
        list.names <- category.names
        if (is.null(list.names)) {
            list.names <- ""
        }
        grob.list <- VennDiagram::draw.single.venn(length(x[[1]])/100, 
            list.names, ind = FALSE, ...)
        if (!is.null(sub)) {
            grob.list <- add.title(gList = grob.list, x = sub, 
                pos = sub.pos, fontface = sub.fontface, fontfamily = sub.fontfamily, 
                col = sub.col, cex = sub.cex)
        }
        if (!is.null(main)) {
            grob.list <- add.title(gList = grob.list, x = main, 
                pos = main.pos, fontface = main.fontface, fontfamily = main.fontfamily, 
                col = main.col, cex = main.cex)
        }
    }
    else if (length(x) == 2) {
        a <- x[[1]]
        b <- x[[2]]
        intersect <- intersect(a, b)
        list.names <- category.names
        if (length(a) < length(b)) {
            list.names <- rev(list.names)
        }
        grob.list <- VennDiagram::draw.pairwise.venn(length(a)/1000, 
            length(b)/1000, length(intersect)/1000, list.names, ind = FALSE, 
            ...)
        if (!is.null(sub)) {
            grob.list <- add.title(gList = grob.list, x = sub, 
                pos = sub.pos, fontface = sub.fontface, fontfamily = sub.fontfamily, 
                col = sub.col, cex = sub.cex)
        }
        if (!is.null(main)) {
            grob.list <- add.title(gList = grob.list, x = main, 
                pos = main.pos, fontface = main.fontface, fontfamily = main.fontfamily, 
                col = main.col, cex = main.cex)
        }
    }
    else if (length(x) == 3) {
        a <- x[[1]]
        b <- x[[2]]
        c <- x[[3]]
        list.names <- category.names
        nab <- intersect(a, b)
        nbc <- intersect(b, c)
        nac <- intersect(a, c)
        nabc <- intersect(nab, c)
        grob.list <- VennDiagram::draw.triple.venn(length(a)/100, 
            length(b)/100, length(c)/100, length(nab)/100, length(nbc)/100, length(nac)/100, 
            length(nabc)/100, list.names, ind = FALSE, list.order = 1:3, 
            ...)
        if (!is.null(sub)) {
            grob.list <- add.title(gList = grob.list, x = sub, 
                pos = sub.pos, fontface = sub.fontface, fontfamily = sub.fontfamily, 
                col = sub.col, cex = sub.cex)
        }
        if (!is.null(main)) {
            grob.list <- add.title(gList = grob.list, x = main, 
                pos = main.pos, fontface = main.fontface, fontfamily = main.fontfamily, 
                col = main.col, cex = main.cex)
        }
    }
    else if (length(x) == 4) {
        a <- x[[1]]
        b <- x[[2]]
        c <- x[[3]]
        d <- x[[4]]
        list.names <- category.names
        n12 <- intersect(a, b)
        n13 <- intersect(a, c)
        n14 <- intersect(a, d)
        n23 <- intersect(b, c)
        n24 <- intersect(b, d)
        n34 <- intersect(c, d)
        n123 <- intersect(n12, c)
        n124 <- intersect(n12, d)
        n134 <- intersect(n13, d)
        n234 <- intersect(n23, d)
        n1234 <- intersect(n123, d)
        grob.list <- VennDiagram::draw.quad.venn(area1 = length(a)/100, 
            area2 = length(b)/100, area3 = length(c)/100, area4 = length(d)/100, 
            n12 = length(n12)/100, n13 = length(n13)/100, n14 = length(n14)/100, 
            n23 = length(n23)/100, n24 = length(n24)/100, n34 = length(n34)/100, 
            n123 = length(n123)/100, n124 = length(n124)/100, n134 = length(n134)/100, 
            n234 = length(n234)/100, n1234 = length(n1234)/100, category = list.names, 
            ind = FALSE, ...)
        if (!is.null(sub)) {
            grob.list <- add.title(gList = grob.list, x = sub, 
                pos = sub.pos, fontface = sub.fontface, fontfamily = sub.fontfamily, 
                col = sub.col, cex = sub.cex)
        }
        if (!is.null(main)) {
            grob.list <- add.title(gList = grob.list, x = main, 
                pos = main.pos, fontface = main.fontface, fontfamily = main.fontfamily, 
                col = main.col, cex = main.cex)
        }
    }
    else {
        stop("Invalid size of input object")
    }
    if (!is.null(filename)) {
        current.type <- getOption("bitmapType")
        options(bitmapType = "cairo")
        tiff(filename = filename, height = height, width = width, 
            units = units, res = resolution, compression = compression)
        grid.draw(grob.list)
        dev.off()
        options(bitmapType = current.type)
        return(1)
    }
    return(grob.list)
}