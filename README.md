# 简洁中文学术报告模板
Simple Chinese Academic Report Template

## 简介

这是一个基于浙江大学 zjuthesis 模板简化而来的中文学术报告模板，适用于课程论文、学术报告、技术文档等场景。

## 文件结构

```
simple-chinese-template/
├── simple-chinese-report.tex  # 主模板文件
├── references.bib             # 参考文献数据库示例
├── compile-simple.sh          # Linux/Mac 编译脚本
├── compile-simple.bat         # Windows 编译脚本
├── simple-latexmkrc           # LaTeXmk 配置文件
├── .gitignore                 # Git 忽略文件
└── README.md                  # 本说明文件
```

## 快速开始

### 方法1: 使用编译脚本

**Linux/Mac:**
```bash
./compile-simple.sh
```

**Windows:**
```cmd
compile-simple.bat
```

### 方法2: 使用 LaTeXmk

```bash
# 使用默认配置
latexmk -pdf -xelatex simple-chinese-report.tex

# 或使用自定义配置
latexmk -r simple-latexmkrc simple-chinese-report.tex
```

### 方法3: 手动编译

```bash
# 第一次编译
xelatex -synctex=1 -interaction=nonstopmode simple-chinese-report.tex

# 第二次编译（解决交叉引用）
xelatex -synctex=1 -interaction=nonstopmode simple-chinese-report.tex
```

## 模板特性

### 中文支持
- 使用 XeLaTeX 引擎
- 支持中文标点和排版
- 自动处理中文字体

### 学术格式
- 标准学术报告结构
- 包含标题页、摘要、目录、正文、参考文献、致谢
- 支持图表、公式、算法等学术元素
- 专业页面布局和页眉页脚

### 参考文献
- 手动参考文献管理
- 支持标准引用格式
- 示例引用条目

## 自定义模板

### 修改个人信息
编辑 `simple-chinese-report.tex` 文件中的以下部分：

```latex
% 标题页信息
{\zihao{1}\bfseries 报告标题\\}
{\zihao{3} 副标题（可选）\\}

% 作者信息
作者： & 姓名 \\
学号： & 12345678 \\
专业： & 专业名称 \\
学院： & 学院名称 \\
指导教师： & 教师姓名 \\
日期： & \today
```

### 添加内容章节
在正文部分添加新的章节：

```latex
\section{新章节标题}

这里是新章节的内容...

\subsection{小节标题}

这里是小节内容...
```

### 添加图表
```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.6\textwidth]{your-image.png}
    \caption{图片标题}
    \label{fig:your-label}
\end{figure}

\begin{table}[htbp]
    \centering
    \caption{表格标题}
    \label{tab:your-label}
    \begin{tabular}{ccc}
        \toprule
        列1 & 列2 & 列3 \\
        \midrule
        数据1 & 数据2 & 数据3 \\
        \bottomrule
    \end{tabular}
\end{table}
```

### 添加参考文献
在 `thebibliography` 环境中添加新的参考文献：

```latex
\bibitem{your-cite-key} 作者. 文献标题[文献类型]. 出版信息, 年份.
```

然后在正文中引用：
```latex
如文献\cite{your-cite-key}所述...
```

## 系统要求

- **TeX 发行版**: TeX Live 2020+ 或 MiKTeX
- **引擎**: XeLaTeX
- **字体**: 系统需安装中文字体（Windows 自动支持）

## 故障排除

### 编译错误
- 确保使用 XeLaTeX 而非 pdfLaTeX
- 检查所有文件编码为 UTF-8
- 确认所有依赖包已安装

### 字体问题
- Windows: 通常自动支持
- Linux/Mac: 可能需要安装额外中文字体包

### 清理编译文件
```bash
./compile-simple.sh clean
```
或
```cmd
compile-simple.bat clean
```

## 许可证

基于 MIT 许可证开源。

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个模板。