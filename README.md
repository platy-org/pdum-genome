# pdum-genome

A community-curated GFF file for the _Platynereis dumerilii_ genome. The idea is that each expert in the community can add, refine, or amend gene models and the corresponding metadata starting from the most current Ensembl Metazoa version of the genome.

# How to contribute

1. Find your gene(s) of interest on the genome, e.g. by a combination of BLAST/MMseqs2/DIAMOND searches and phylogenetic trees.
2. Make a fork of the repository.
3. Edit the GFF file to reflect your new insights (e.g. propose a name for an XLOC, improve the annotation of the 5' UTR for another locus), save, and commit.
4. Propose your commit as a pull request to the main repository.
5. In the pull request, try to explain how you arrived at the proposed change; try to upload any relevant results so that others can judge.
6. Wait for consensus to build; ideally your contribution is widely accepted. The pull request is merged, and the version of the genome goes up slightly.

Every once in a while (depending on NCBI/Ensembl Metazoa update cycles) a new GFF version will be uploaded. This will trigger a minor version bump.

Sweeping changes to the assembly (like re-assemblies or similar) will be communicated via appropriate channels (spiraliabase, Platy community meetings, lab emails?).

# How to use

The latest release will contain the consensus up-to-date version of the genome annotation. If this doesn't include your favorite gene feel free to use the version specified by the commit of the corresponding pull request. To avoid misunderstandings in publications, _always_ refer to the genome by full version string and commit ID.
