# pdum-genome

A community-curated GFF file for the _Platynereis dumerilii_ genome. The idea is that each expert in
the community can add, refine, or amend gene models and the corresponding metadata starting from the
most current Ensembl Metazoa version of the genome.

## Why this repository?

A GFF file is, first and foremost, a text file; and annotation consists of changing what certain
lines of this file say ("this gene should be named hox3 instead of hox5"), or, in more extreme
cases, adding or removing lines ("there exists a gene between positions A and B on this chromosome",
or "this predicted gene is an algorithmic artifact and should be deleted"). To curate this as a
community, we need a way to synchronously edit this file, discuss the proposed changes, perhaps vote
on them, and, very importantly, keep track of them.

Git is a version control system that is very good at keeping track of changes to text files. GitHub
is a platform designed specifically so people can collaborate on editing text files online. This is
a match made in heaven.

## How to contribute

Prerequisites: a GitHub account, a text editor, and some knowledge of the GFF format.

Contributing is easy:

1. Find your gene(s) of interest on the genome, e.g. by a combination of BLAST/MMseqs2/DIAMOND
   searches and phylogenetic trees.
2. Make a fork of the repository.
3. Edit the GFF file to reflect your new insights (e.g. propose a name for an XLOC, improve the
   annotation of the 5' UTR for another locus), save, and commit.
4. Propose your commit as a pull request to the main repository.
5. In the pull request, try to explain how you arrived at the proposed change; try to upload any
   relevant results so that others can judge.
6. Wait for consensus to build; ideally your contribution is widely accepted. The pull request is
   merged, and the version of the genome goes up slightly.

Every once in a while (depending on NCBI/Ensembl Metazoa update cycles) a new GFF version will be
uploaded. This will trigger a minor version bump.

Sweeping changes to the assembly (like re-assemblies or similar) will be communicated via
appropriate channels (spiraliabase, Platy community meetings, lab emails?).

## How to use

The latest release will contain the consensus up-to-date version of the genome annotation. If this
doesn't include your favorite gene feel free to use the version specified by the commit of the
corresponding pull request. To avoid misunderstandings in publications, _always_ refer to the genome
by full version string and commit ID.

For technical reasons, the GFF file is split up into multiple files - one for the first 30
scaffolds, one for the rest of the scaffolds, and one for the mitochondrial genome. To create a full
GFF file, simply concatenate these files. In a UNIX-based system:

<details>
<summary>In a UNIX system (Linux, MacOS):</summary>

```bash
$ cd /path/to/pdum-genome
$ cd chromosomes
$ cat *.gff3 > pdum-genome.gff3
```

To create a GFF without the mitochondrial genome:

```bash
$ cat scaffold*.gff3 > pdum-genome-no-mt.gff3
$ cat unplaced.gff3 >> pdum-genome-no-mt.gff3
```
</details>

<details>
<summary>In a Windows system:</summary>

_(I did not test this, please let me know if it works/doesn't!)_

```bash
$ chdir path\to\pdum-genome
$ chdir chromosomes
$ type *.gff3 pdum-genome.gff3
```

To create a GFF without the mitochondrial genome:

```bash
$ type scaffold*.gff3 pdum-genome-no-mt.gff3
$ type unplaced.gff3 >> pdum-genome-no-mt.gff3
```

</details>

## Changelog

Recent changes to the genome/repository are documented in the [changelog](CHANGELOG.md).

## TODO

- [ ] Find official GTF/GFF.
- [ ] Add a DOI to the repository.
- [ ] Tutorial on how to make changes.
- [ ] Automate version bumping.
- [ ] Automate DOI generation upon new release (zenodo?).
- [ ] Link to other resources:
    - [ ] SpiraliaBase
    - [ ] Ensembl Metazoa
    - [ ] NCBI
    - [ ] [platynereis.com](https://www.platynereis.com)
