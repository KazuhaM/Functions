### ライブラリ読み込み　###
library(vegan) 
library(labdsv) #indval用

### 分割数設定　任意の数に変更してください　###
gnum_st<-4 ##地点
gnum_sp<-4　##種

### データ読み込み　###

d<-read.csv("SpCom.csv",row.names=1)
d[is.na(d)]<-0
d<-t(d)
#d<-t(d)
col<-ncol(d)
row<-nrow(d)
is.numeric(d)
d

# DCAの場合
d.mds<-decorana(d)

#MDSの場合
d.mds<-metaMDS(d,zerodist="add") ##### zerodist="add" を追加
stressplot(d.mds) # Shepard diagram を描く。
d.mds

summary(d.mds)
plot(d.mds, type="t")
biplot(d.mds, scaling=1)