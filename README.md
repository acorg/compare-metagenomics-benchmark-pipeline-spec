## COMPARE metagenomics benchmark pipeline spec

This repo contains a
[slurm-pipeline](https://github.com/acorg/slurm-pipeline) specification
file (`specification.json`) and associated scripts for processing a set of
reads for a [COMPARE](http://www.compare-europe.eu/) metagenomics
benchmark.

### Usage

```sh
$ git clone https://github.com/acorg/compare-metagenomics-benchmark-pipeline-spec
$ cd sample-dir
$ cp /your/data/*.fastq.gz .
$ make run
```

### Output

The scripts in `01-trim`, `02-map`, etc. are all submitted by sbatch for
execution under [SLURM](http://slurm.schedmd.com/). The final step,
`05-panel` leaves its output in `05-panel/out`.

### Cleaning up

```sh
$ make clean-1
```

Note that this throws away all the intermediate work done by the pipeline.
E.g., information about how many reads mapped to the human genome can be
found in the `03-find-unmapped/slurm-*.out`. These intermediate files will
be removed by `make clean`, so make sure you know what you're doing.

### Really cleaning up

```sh
$ make clean-3
```

Does a `make clean` and also removes the final output in `05-panel/out`.
