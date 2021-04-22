#############ROC curve####################
tr <- tribble(
  ~marker,~tummor_positive,~tummor_negtive,~normal_positive,~normal_negtive,
  "CA15-3",40,20,30,10,
  "Hsp90a",38,22,25,15,
  "OPN",30,30,16,24,
  "SLPI",25,35,15,25
)

tr <- read_csv("./plotROC.csv",skip = 1,col_names = c("Patients",	"CA15-3(u/ml)",	"HSP90A(u/ml)","OPN(pg/ml)",	"SLPI(pg/ml)"))
rm(tr1,tr2)
tr <- tr %>% mutate(condition = c(rep(1,60),rep(0,40)))

library(plotROC)
base_roc <- tr %>% gather(2:5,key = "Model",value = "Value") %>% 
  ggplot( aes(m = Value,d = condition,colour = Model)) + 
  geom_roc()

calc_auc(base_roc)$AUC

tr %>% gather(2:5,key = "Model",value = "Value") %>% 
  ggplot( aes(m = Value,d = condition,colour = Model)) + 
  geom_roc(n.cuts = 0) +style_roc(theme = theme_prism, xlab = "1 - Specificity")+  ggsci::scale_color_npg() + geom_abline(slope = 1,intercept = 0,linetype = 2,color = "grey")
##proc
library(pROC)
tr
rm(rocobj1,rocobj2,aSAH)

rocobj1 <- roc(tr$condition, tr$`CA15-3(u/ml)`, percent=TRUE)
rocobj2 <- roc(tr$condition, tr$`HSP90A(u/ml)`, percent=TRUE)
rocobj3 <- roc(tr$condition, tr$`OPN(pg/ml)`, percent=TRUE)
rocobj4 <- roc(tr$condition, tr$`SLPI(pg/ml)`, percent=TRUE)
plot(rocobj1,
     legacy.axes = TRUE,
     col="grey",
     main="ROC曲线最佳阈值点",
     thresholds="best", # 基于youden指数选择roc曲线最佳阈值点
     print.thres="best",
     smooth=T,
     print.auc=TRUE,print.auc.x=80,print.auc.y=20) # 在roc曲线上显示最佳阈值点

plot.roc(rocobj2,add=T,col="red", print.auc=TRUE,print.auc.x=70,print.auc.y=30,smooth = T,print.thres = T)
plot.roc(rocobj3,add=T,col="blue",print.auc=TRUE,print.auc.x=60,print.auc.y=35,smooth = T,print.thres = T)
plot.roc(rocobj4,add=T,col="green",print.auc=TRUE,print.auc.x=50,print.auc.y=40,smooth = T,print.thres = T)

