# 简洁中文学术报告模板
Simple Chinese Academic Report Template

## 简介

这是一个基于浙江大学 zjuthesis 模板简化而来的中文学术报告模板，适用于课程论文、学术报告、技术文档等场景。

## 文件结构

```
simple-chinese-template/
├── bib/                       # 参考文献文件夹
│   └── references.bib         # 参考文献数据库示例
├── figs/                      # 图片文件夹
│   └── performance.png        # 性能对比图
├── simple-chinese-report.tex  # 主模板文件
├── compile-simple.sh          # Linux/Mac 编译脚本（特定文件）
├── compile-simple.bat         # Windows 编译脚本（特定文件）
├── compile-any.sh             # Linux/Mac 通用编译脚本
├── compile-any.bat            # Windows 通用编译脚本
├── simple-latexmkrc           # LaTeXmk 配置文件
├── .gitignore                 # Git 忽略文件
└── README.md                  # 本说明文件
```

## 快速开始

### 方法1: 使用编译脚本

#### 编译特定文件
**Linux/Mac:**
```bash
./compile-simple.sh
```

**Windows:**
```cmd
compile-simple.bat
```

#### 编译任意文件（推荐）
**Linux/Mac:**
```bash
./compile-any.sh 文件名.tex
```

**Windows:**
```cmd
compile-any.bat 文件名.tex
```

清理辅助文件：
```bash
./compile-any.sh 文件名.tex clean
```
或
```cmd
compile-any.bat 文件名.tex clean
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
- 使用 BibTeX 进行参考文献管理
- 支持标准引用格式
- 示例参考文献数据库 (bib/references.bib)
- 自动生成和排序参考文献
- 专为 JabRef 用户优化，支持 .bib 文件和 PDF 文件在同一目录管理

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

#### 图片使用
模板已预置图片文件夹 `figs/`，包含以下图片文件：

- `performance.png` - 性能对比图

**注意：** 当前模板中的其他图片文件为文本格式的占位符，需要替换为实际的图片文件。

**替换为实际图片：**
1. 将您的图片文件放入 `figs/` 文件夹
2. 在 LaTeX 代码中更新图片路径：

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.6\textwidth]{figs/your-image.png}
    \caption{图片标题}
    \label{fig:your-label}
\end{figure}
```

**支持的图片格式：** PNG, JPG, PDF

#### 表格使用
```latex
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
在 `bib/references.bib` 文件中添加新的参考文献条目：

```bibtex
@article{your-cite-key,
  title={文献标题},
  author={作者姓名},
  journal={期刊名称},
  volume={卷号},
  number={期号},
  pages={页码},
  year={年份},
  publisher={出版社}
}

@book{another-cite-key,
  title={书名},
  author={作者姓名},
  year={年份},
  publisher={出版社}
}
```

**JabRef 用户提示：** 您可以将相关的 PDF 文件也放在 `bib/` 目录中，JabRef 会自动关联 .bib 文件和对应的 PDF 文件。

然后在正文中引用：
```latex
如文献\cite{your-cite-key}所述...
```

模板会自动处理参考文献的生成和排序。

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