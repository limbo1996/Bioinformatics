#!/usr/bin/env/python
import os
for line in open('C:/Users/Limbo/Desktop/result.CSV '):
    ID = line.split(',')[0]
    normal = line.split(',')[4]
    tumor = line.split(',')[2]
    fh = open('C:/data/%s.pbs '%ID,'a+')
    fh.writelines('#PBS -n %s_snp_result\n'%ID)
    fh.writelines('#PBS -l walltime=25:00:00\n#PBS -l nodes=1:ppn=1\n#PBS -S /bin/bash\n#PBS -q normal_3\n')
    fh.writelines('cd /public/home/liuxs/biosoft/nb_distribution\n')
    fh.writelines('ref_file=/public/home/wangshx/songmf/prad_exon_facets/hg38.snp.vcf.gz\n')
    fh.writelines('normal=%s'%normal)
    fh.writelines('tumor=%s\n'%tumor)
    fh.writelines('cd $PBS_WORKDIR\nsource activate R\n')
    fh.writelines('snp-pileup -g -q15 -Q20 -P100 -r25,0 /public/home/wangshx/songmf/prad_exon_facets/hg38.snp.vcf.gz\n\
    /public/home/wangshx/wx/snp_pbs/snp_output/%s.out.gz\n\
    %s\n\
    %s'%(ID,normal,tumor))
    fh.close()

