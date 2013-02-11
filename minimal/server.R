library(shiny)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(GenomicFeatures)
library(biovizBase)
library(ggbio)

data(hg19IdeogramCyto)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
trx <- exonsBy(txdb, by="tx", use.names=TRUE)

shinyServer(function(input, output) {

  output$summary <- reactivePrint(function() {
    paste0("Vous êtes ici ", input$chr, ":", input$start, "-", input$end)
  })

  output$tracks <- reactivePlot(function() {
	# GRange of the browser current view 
	region <- GRanges(seqnames=Rle(input$chr), IRanges(start=input$start, end=input$end))
    # Subset trx to the browser view
	trx_track <- subsetByOverlaps(trx, region)
    # global view on a chromosome, highlighting of the current view on a chromosome doesn't look nice
	# only massive chunks of chromosome gets visible once highlighting i.e. try increasing view 
	# until you can see selected region (chr7 36572905-47643080)
    t0 <- plotSingleChrom(hg19IdeogramCyto, subchr=input$chr, color="darkred", fill="darkred", zoom.region=c(input$start, end=input$end), aspect.ratio=1/50, xlabel=TRUE)
    t1 <- autoplot(trx_track)
    print(tracks("Ideogram"=t0,
              "Known Genes"=t1,
              heights=c(1.5, 5)))
  })
})