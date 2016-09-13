library(openintro)
data(COL)

d = read.csv(file = "ProfEvaltnsBeautyPublic.csv", header = TRUE, stringsAsFactors = FALSE)

# Rename the two variables for convenience
beauty <- d$btystdave
eval <- d$courseevaluation
beauty_eval_lm = lm(eval ~ beauty)

# Make a scatterplot
pdf("beauty_eval.pdf", height = 5, width = 5)

plot(x = beauty, y = eval, xlab="beauty", ylab="teaching evaluation", pch = 19, col = fadeColor(COL[1],80), cex = 0.9, cex.lab = 1.5)

dev.off()

# residuals plot

pdf("beauty_eval_res.pdf", height = 5, width = 5)

plot(beauty_eval_lm$residuals ~ beauty, xlab = "beauty", ylab = "residuals", pch = 19, col = fadeColor(COL[1],80), cex.lab = 1.5)
abline(h = 0, lty = 3)

dev.off()

# normal residuals - histogram
pdf("beauty_eval_res_hist.pdf", height = 5, width = 5)

hist(beauty_eval_lm$residuals, xlab = "residuals", cex.lab = 1.5, cex.axis = 1.5, col = COL[1], main = "")

dev.off()

# 

pdf("beauty_eval_res_qq.pdf", height = 5, width = 5)

qqnorm(beauty_eval_lm$residuals, pch = 19, col = fadeColor(COL[1],80), cex.lab = 1.5, cex.axis = 1.5)
qqline(beauty_eval_lm$residuals)

dev.off()

#

pdf("beauty_eval_res_order.pdf", height = 5, width = 5)

plot(beauty_eval_lm$residuals, xlab = "order of data collection", pch = 19, col = fadeColor(COL[1],80), ylab = "residuals", cex.lab = 1.5, main = "", cex.lab = 1.5, cex.axis = 1.5)
abline(h = 0, lty = 3)

dev.off()