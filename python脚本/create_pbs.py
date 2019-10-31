#!/usr/bin/env/python
import os
for line in open('/home/wx/APOBEC/test/APOBEC_HLA/apobec_hla.tsv'):
    ID = line.split('\t')[0]
    HLA = line.split('\t')[1]
    HLA = HLA.strip('\n')
    fh = open('/home/wx/APOBEC/test/pbs/%s.pbs'%ID,'a+')
    fh.write('#PBS -N neo_%s\n'%ID)
    fh.write('#PBS -l walltime=05:00:00\n#PBS -l nodes=1:ppn=9\n#PBS -S /bin/bash\n#PBS -q normal_3\n#PBS -j oe\n')
    fh.write('\n')
    fh.write('\n')
    fh.write('source activate neo\n')
    fh.write('\n')
    fh.write('vcf=/public/home/wangshx/wx/APOBEC/vcf_file/APOBEC/annoated_vcf/vcf\n')
    fh.write('out_dir=/public/home/wangshx/wx/APOBEC/neos\n')
    fh.write('\n')
    fh.write('pvacseq run \\\n')
    fh.write('$vcf/%s.annoated.vcf \\\n'%ID)
    fh.write('%s \\\n'%ID)
    fh.write('%s \\\n'%HLA)
    fh.write('NetMHCpan NNalign NetMHC PickPocket SMM align \\\n')
    fh.write('$out_dir \\\n')
    fh.write('-e 8,9,10')
    fh.close()
