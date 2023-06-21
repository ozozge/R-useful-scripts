
txt_files <- list.files(path = ".", pattern = "*.SCH")

new_row<-as.data.frame(paste("REM ",Sys.Date()))
colnames(new_row) <- c('V1')

for (i in 1:length(txt_files)) {
  filename=txt_files[i]
  df1<-read.delim2(filename,header=FALSE, sep="\n")
  df1$ind <- seq_len(nrow(df1))
  df1 <- rbind(df1,data.frame(V1 =new_row ,ind=1))
  df1 <- df1[order(df1$ind),]
  df2<-as.data.frame(df1$V1)
  write.table(df2,filename,quote=FALSE,row.names=FALSE,col.names =FALSE)
}

#rm(list = ls())

