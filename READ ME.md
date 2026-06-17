
# Bulk RNA-seq Processing Pipeline (SRA → Count Matrix): Single-Sample Demonstration Using SRR24739014

## 1. Project Overview
This project implements a complete Bulk RNA-seq data processing pipeline starting from raw SRA data and ending with a gene-level count matrix.
The analysis is performed on a single publicly available sequencing run (SRR24739014) as a technical and educational demonstration of an end-to-end RNA-seq workflow.
The primary objective is to practice and document standard bioinformatics steps used in transcriptomic data processing, rather than to perform biological inference or differential expression analysis.

## 2. Dataset Information
- GEO Project: GSE233458 
- SRA Project: PRJNA976301 
- Selected Sample: SRR24739014 
- Source: NCBI SRA Database:  https://www.ncbi.nlm.nih.gov/sra 

## 3. Pipeline Overview
The following standard RNA-seq processing workflow was implemented:
1.	Download raw sequencing data (SRA Toolkit – prefetch) 
2.	Convert SRA to FASTQ format (fastq-dump) 
3.	Quality control of raw reads (FastQC) 
4.	Adapter trimming and quality filtering (Trimmomatic) 
5.	Post-trimming quality control (FastQC) 
6.	Alignment to reference genome (HISAT2, hg38 index)
7.	Conversion of SAM to BAM format (Samtools) 
8.	Sorting and indexing BAM files (Samtools) 
9.	Gene-level quantification (HTSeq-count with GTF annotation) 

## 4. Tools and Software
The pipeline was implemented in a Linux (VirtualBox-based) environment using the following tools:
- SRA Toolkit (3.4.1)
- FastQC (0.12.1)
- Trimmomatic (0.39)
- HISAT2 (2.2.1)
- Samtools (1.22.1)
- HTSeq (2.0.9)
- Operating Environment: Ubuntu 26.04 LTS (VirtualBox)

## 5. Important Notes and Limitations
- This project is based on a single RNA-seq sample (no biological replicates). 
- Therefore, differential expression analysis was not performed. 
- The purpose of this workflow is pipeline practice and reproducibility training, not biological interpretation. 
- Some steps were executed in a constrained computing environment (VirtualBox), which influenced file handling and storage decisions. 

## 6. Output
The pipeline generates:
- Cleaned FASTQ files 
- QC reports (FastQC)
- Aligned BAM files 
- Sorted BAM files 
- Gene-level count matrix (countfile.txt) 

## 7. Reproducibility
All steps were executed in a Linux-based virtual environment using command-line tools. The workflow is fully reproducible given access to the same tools and reference genome (hg38).
