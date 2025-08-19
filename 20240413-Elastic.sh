#!/bin/zsh
#!/usr/bin/bashj
#!java

declare -a PotentialArray=("M2" "M3" "M2R" "M3R" "BMD192" "BMD192R") # "M3R2" "M2" "M2R2" "BMD192" "BMD192R"


for P in ${PotentialArray[@]}
	do
		mkdir $P
		cd $P

		echo Potential: $P
		cp ../{20240413-Elastic.lammpstemp,20240413-Displace.lammpstemp,20240413-Potential.lammpstemp,20240413-Init.lammpstemp,20240413-Elastic.job} .
		sed	-e 's/PotentialTemp/'$P'/g' 20240413-Elastic.lammpstemp> 20240413-Elastic.lammpsin
		sed	-e 's/PotentialTemp/'$P'/g' 20240413-Displace.lammpstemp> 20240413-Displace.lammpsin
		sed	-e 's/PotentialTemp/'$P'/g' 20240413-Init.lammpstemp> 20240413-Init.lammpsin
		sed	-e 's/PotentialTemp/'$P'/g' 20240413-Potential.lammpstemp> 20240413-Potential.lammpsin
		sbatch 20240413-Elastic.job
		Direction=$((Direction+1))
		cd ..
done