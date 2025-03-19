# 解析命令行参数
vec.args <- commandArgs(trailingOnly = TRUE)

# 初始化参数
val.input_file <- NULL
val.output_file <- NULL
val.ukb_file <- NULL

# 遍历参数
i <- 1
while (i <= length(vec.args)) {
  val.arg <- vec.args[i]
  if (val.arg == "-i" || val.arg == "--input") {
    val.input_file <- vec.args[i + 1]
    i <- i + 1
  } else if (val.arg == "-o" || val.arg == "--output") {
    val.output_file <- vec.args[i + 1]
    i <- i + 1
  } else if (val.arg == "-u" || val.arg == "--ukb") {
    val.ukb_file <- vec.args[i + 1]
    i <- i + 1
  } else if (val.arg == "-h" || val.arg == "--help") {
    cat("用法:\n")
    cat("Rscript UKB.extrect.v2.R -i input.txt -o output.txt -u ukb.tab\n\n")
    cat("选项:\n")
    cat("  -i, --input <input.txt>  输入文件路径\n")
    cat("  -o, --output <output.txt>  输出文件路径\n")
    cat("  -u, --ukb  UKB.tab文件\n")
    cat("  -h, --help  显示帮助信息\n")
    q(status = 0)
  } else {
    cat("未知选项:", val.arg, "\n")
    q(status = 1)
  }
  i <- i + 1
}

# 检查必要参数是否提供
if (is.null(val.input_file) || is.null(val.output_file) || is.null(val.ukb_file)) {
  cat("错误: 必须提供 -i -o -u 参数\n")
  cat("用法: Rscript optain_script.R -i input.txt -o output.txt -u ukb.tab\n")
  q(status = 1)
}

# 提取代码
df.extrect <- read.table(file = val.input_file, sep = ",", h = F)
vec.col <- df.extrect[,1]
vec.col4awk <- vec.col + 1
vec.col4awk <- paste0("$", vec.col4awk)
str.col4awk <- paste(vec.col4awk, collapse = ", ")

# 生成awk代码
# val.input_file <- "Test.exp.csv"
# val.ukb_file <- "ukb675696.tab"
# val.output_file <- "test.tab"
str.awk <- paste0('awk -F"', '\t"', " '{print ", str.col4awk, "}' ", val.ukb_file, " > ", val.output_file)
system(str.awk)
q(status = 0)
