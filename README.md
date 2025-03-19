# UKB_tips
在使用UKB进行数据分析过程中编写的增加效率的脚本 Scripts written to increase efficiency during data analysis using UKB

## 1.从UKB总数居中提取想要的变量 extrect convariables from UKB.tab
本脚本需要环境中安装有任意版本的R语言和awk命令 This script requires any version of the R language and awk commands installed in the environment

### 1.1.step1 从UKB项目变量列表.html中复制你需要的变量对应的行 copy colnum of variables which u need from UKB.html
ukb.exp.html 示例的ukb.html文件 \
![image](https://github.com/user-attachments/assets/cfd2cdb1-072c-43ab-ae5d-6f77cea821f5) \
extrect.csv 示例的extrect.csv文件 \
![image](https://github.com/user-attachments/assets/5cee1f2c-8564-4f94-a1e9-30761c62ebe6) \

### 1.2.step2 使用脚本提取想要的变量 Use the Rscript to extract the desired variables
```bash
Rscript UKB.extrect.Rscript.vbeta.R \
  -i "/path/to/extrect/extrect.csv" \
  -o "/path/to/output/output.tab" \
  -u "/path/to/UKB.tab/UKB.tab"
```
