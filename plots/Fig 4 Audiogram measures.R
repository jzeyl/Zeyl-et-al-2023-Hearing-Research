#Re-run sections of 'Set up data_scl.R' & 'Audiograms linked to anatomy.R'
#to obtain cutoffs at 35 and 60 dB

#limits35<-limits
#now remove objects re-run the analysis to get the limits at 60 dB, changing the cutoff
#rm(list = setdiff(ls(),c("limits35")))
#limits60<-limits
# to plot, the 'fig1' and 'limits'
#dataframe comes from the 'Audiograms linked to anatomy.R' script

library(ggtext)

#######plotting metrics on audiogram########
aas<-function(d){

  set60<-limits60[d,]
  bestsensitivity60<-set60$bestsensitivity
  bestHz60<-set60$besthz
  highHz60<-set60$HighHzlimit
  lowHz60<-set60$LowHzlimit

  set35<-limits35[d,]
  bestsensitivity35<-set35$bestsensitivity
  bestHz35<-set35$besthz
  highHz35<-set35$HighHzlimit
  lowHz35<-set35$LowHzlimit

  ggplot(fig1[fig1$Species==set60$Species,], aes(x = Hz, y = Threshold, factor = Species))+
    geom_line(aes(x = Hz, y = Threshold), size = 1)+

    scale_x_log10(labels = scales::comma, limits = c(10, NA))+
    ylim(c(0,85))+
  #Hz axis lines
    geom_segment(aes(x = lowHz60, y = -Inf, xend = lowHz60, yend = 60), linetype = "dotted")+
    geom_segment(aes(x = lowHz35, y = -Inf, xend = lowHz35, yend = 35), linetype = "dotted")+
    geom_segment(aes(x = highHz60, y = -Inf, xend = highHz60, yend = 60), linetype = "dotted")+
    geom_segment(aes(x = highHz35, y = -Inf, xend = highHz35, yend = 35), linetype = "dotted")+
    geom_segment(aes(x = bestHz60, y = -Inf, xend = bestHz60, yend = bestsensitivity60), linetype = "dotted")+


#y axis lines (cutoffs, best sensitivity)
    geom_segment(aes(x = 0, y = 35,
                     xend = lowHz35, yend = 35), linetype = "dotted")+
    geom_segment(aes(x = 0, y = 60,
                     xend = lowHz60, yend = 60), linetype = "dotted")+
    geom_segment(aes(x = highHz35, y = 35,
                     xend = Inf, yend = 35), linetype = "dotted")+
    geom_segment(aes(x = highHz60, y = 60,
                     xend = Inf, yend = 60), linetype = "dotted")+
    geom_hline(yintercept = bestsensitivity60, linetype = "dotted")+


    #yaxis labels
    geom_richtext(aes(x = 10, y = 60, label = "60 dB cut-off"), hjust = 0)+
    geom_richtext(aes(x = 10, y = 35, label = "35 dB cut-off"), hjust = 0)+
    geom_richtext(aes(x = 10, y = bestsensitivity60, label = "Best sensitivity"), hjust = 0)+

  #hz limit labels


    #bottom on lines option
    #geom_richtext(aes(x = lowHz35, y = 0, label = "Low frequency limit"), angle = 90, hjust = 0)+#, vjust = 1
    #geom_richtext(aes(x = lowHz60, y = 0, label = "Low frequency limit"), angle = 90,hjust = 0)+#, , vjust = 1
    #geom_richtext(aes(x = highHz35, y = 0, label = "High frequency limit"), angle = 90, hjust = 0)+#,vjust = 0
    #geom_richtext(aes(x = highHz60, y = 0, label = "High frequency limit"), angle = 90, hjust = 0)+

    #
    #geom_segment(aes(x = -Inf, y = 35,
    #                 xend = lowHz35,
    #                 yend = 35), col = "black", linetype = "solid")+
    theme_classic()+
    theme(axis.text = element_text(color = "black"))+
    coord_cartesian(clip = "off")+
    ylab("Threshold (dB SPL)")+
    xlab("Frequency (Hz)")+
    annotation_logticks(sides = "b")+
    annotate(geom = "path", x = c(lowHz60,lowHz60,lowHz35, lowHz35), y = c(60,70,70,35), arrow = arrow(angle = 20, length = unit(0.15, "inches"),
                                                                                               ends = "both", type = "closed"))+
    annotate(geom = "path", x = c(highHz35,highHz35,highHz60, highHz60), y = c(35,70,70,60),arrow = arrow(angle = 20, length = unit(0.15, "inches"),
                                                                                                          ends = "both", type = "closed"))+
    annotate(geom = "path", x = c(bestHz60,bestHz60), y = c(25,bestsensitivity60),arrow = arrow(angle = 20, length = unit(0.15, "inches"),
                                                                                                          ends = "last", type = "closed"))+

    geom_richtext(aes(x = bestHz60, y = 25, label = "Best frequency"), angle = 0, hjust = 0.5)+

    geom_richtext(aes(x = sqrt(lowHz35*lowHz60), y = 70, label = "Low frequency limits"), angle = 0, hjust = 0.5)+#, vjust = 1
    geom_richtext(aes(x = sqrt(highHz35*highHz60), y = 70, label = "High frequency limits"), angle = 0, hjust = 0.5)#, vjust = 1


#print(bestsensitivity60)
  }
aas(16)

