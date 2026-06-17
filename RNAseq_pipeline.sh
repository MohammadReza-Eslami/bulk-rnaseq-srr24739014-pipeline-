# =========================================
# Bulk RNA-seq Pipeline (SRR24739014)
# SRA → FASTQ → QC → Alignment → Counts
# =========================================

############################
# 1. Setup project
############################
mkdir -p myproject
cd myproject

############################
# 2. SRA Toolkit (v3.4.1)
############################
wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.4.1/sratoolkit.3.4.1-ubuntu64.tar.gz
tar -xvzf sratoolkit.3.4.1-ubuntu64.tar.gz

# add to PATH (session-level)
export PATH=$PWD/sratoolkit.3.4.1-ubuntu64/bin:$PATH

############################
# 3. Download SRA
############################
prefetch SRR24739014

############################
# 4. Convert SRA → FASTQ
############################
fastq-dump --split-files SRR24739014/SRR24739014.sra

############################
# 5. QC (FastQC v0.12.1)
############################
fastqc SRR24739014_1.fastq

############################
# 6. Trimming (Trimmomatic 0.39)
############################
java -jar /usr/share/java/trimmomatic-0.39.jar \
SE SRR24739014_1.fastq trimmed.fastq \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

############################
# 7. QC after trimming
############################
fastqc trimmed.fastq

############################
# 8. HISAT2 alignment (v2.2.1)
############################
hisat2 -x hg38/genome -U trimmed.fastq -S aligned.sam

############################
# 9. SAM → BAM → SORT
############################
samtools view -bS aligned.sam > aligned.bam
samtools sort aligned.bam -o aligned.sorted.bam

############################
# 10. Gene counting (HTSeq 2.0.9)
############################
htseq-count aligned.sorted.bam annotation.gtf > counts.txt