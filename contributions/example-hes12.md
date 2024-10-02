# Contributing to the _Platynereis dumerilii_ genome annotation

#### Niko Papadopoulos, 2024-09-05

> [!TIP]
> This is intended to be a step-by-step walkthrough of **one** of the possible ways you could
> contribute. Use your sound scientific judgement and whatever equivalent tools you prefer. The part
> of this document that will probably always be relevant is the GitHub submission process.

> [!NOTE]
> There is a _lot_ to take into account when naming genes, and as of the writing of this document
> there is no consensus on how to do it for _Platynereis dumerilii_. This discussion, while very,
> very important, is beyond the scope of this document.

## 1. Find your gene(s) of interest

In this document I will be trying to annotate exactly one gene; I will go and take a published
_Platynereis_ sequence from a peer-reviewed journal, find it on the genome, and propose a name for
it. This is the easiest case, where someone else has done the hard work of calculating the
phylogenetic trees and actually proposing a name for the sequence. Here I will just make sure that
I find an XLOC that represents this known gene beyond reasonable doubt.

<details>

<summary>What is an XLOC? </summary>

> [!TIP]
> In order to facilitate precise communication and reproducibility, genes need to have unique
> identifiers. This is because gene names are ambiguous. For instance, he human gene
> [BRCA2](https://www.ensembl.org/Homo_sapiens/Gene/Summary?db=core;g=ENSG00000139618;r=13:32315086-32400268)
> has 7 synonyms (BRCC2, FACD, FAD, FAD1, FANCD, FANCD1, XRCC11), but they all refer to the same
> unique gene ID: ENSG00000139618. The program that annotated the _Platynereis_ genome also
> produced unique identifiers for all the gene models it predicted; these IDs come in the form
> `XLOC_XXXXXX`, where the `X`s after the underscore are digits.

</details>

I have a soft spot for _hes12_, a gene that (among other things) marks the [chaetoblast cells at the
base of the chaetal
sac](https://evodevojournal.biomedcentral.com/articles/10.1186/2041-9139-5-29/figures/14). I know
that there is an [excellent publication that includes this
gene](https://evodevojournal.biomedcentral.com/articles/10.1186/2041-9139-5-29), where the
phylogenetic work has already been done. All I need is to find the sequence of _hes12_ according to
Gazave _et al._ and find it on the genome.

The sequence was uploaded on GenBank, which means an NCBI search should do the trick:

![NCBI term search](../img/ncbi-search.png)

and [it does](https://www.ncbi.nlm.nih.gov/protein/529156849).

## 2. Find the gene on the genome

<details>
<summary>DIY: Making your own local sequence search server</summary>

If there is a type of search you do often, it might be worth setting up your own local sequence
search server. For this, I recommend the MMSeqs2 app. It is not maintained any more, but one of the
[latest releases](https://github.com/soedinglab/MMseqs2-App/releases/tag/v7-8e1704f) should still
work plenty well. If you download and install the app, you can then create a database out of any
FASTA file; for instance the pdum-v2.1 predicted proteome.

</details>

To do this you could build your local sequence search server, or you could just use the Jekely lab
[online BLAST tool](https://jekelylab.ex.ac.uk/blast/), which allows the v0.2.1 **transcriptome** to
be used as a reference. I will paste the sequence of _hes12_ into the query box and hit "BLAST".

> [!CAUTION]
> Picking the correct reference is important: if you choose the v0.2.1 _genome_ instead, your result
> will be one genomic region in the middle of some chromosome, which is not helpful. Picking either
> one of the _transcriptome assemblies_ will give results with a different set of gene IDs, not very
> useful either.

The results look good:

![BLAST result from Jekely lab server](../img/jekely-blast.png)

There is a clear most prominent hit for TCONS_00057998, which, according to the graphical view
belongs to XLOC_022167. This is then where I should be looking.

## 3. Verify the XLOC of interest

The _hes12_ sequence contains a lot of X's. To make sure that what we are seeing here is a real
protein that really is part of the hes/hey family, I will copy the XLOC_022167 sequence from the
alignment file (better still: get it from the predicted proteome) and BLAST it on NCBI. A quick
`blastp` later, I see that my fear was unfounded.

![NCBI BLAST results](../img/ncbi-blast.png)

The various _Platynereis_ sequences are top hits, followed by other annelids and further
lophotrochozoans. It is hard to say whether getting mostly Hes1/4 hits is good or bad, because the
phylogeny of the family is notably [fuzzy outside of
vertebrates](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3396596). If I were a real expert in this
topic, I might have strong opinions about this, or have done analyses to suggest /confirm/deny more.
As I am not, I will be happy that the sequence expertly identified as Hes12 for _Platynereis_ is
present in the genome, covered to 100%, and readily identified as a member of the family in the 
reverse search.

## 4. Find the gene in the GFF

The goal is to find the gene that has "XLOC_022167" as its unique identifier, and then append some
information about the gene to that particular line. There is no need to edit any other fields of the
gene/CDS/exon definition, as that would just be redundant. Most programs that interact with GFF3
files are smart enough to propagate info from the "gene" line to all the nested elements that come
below that.

Having made a fresh GitHub account, I will now go and find XLOC_022167.

First, I will navigate to the [pdum-genome repository](https://github.com/platy-org/pdum-genome).

Second, I will click on the "chunk_index.tsv" file...

![Open the chunk index](../img/github-landing.png)

...and then on "View raw", since the file is too big to display:

![View raw](../img/github-raw.png)

This file is simply a TSV table of all gene loci in the genome, as well as the file and line they
are in. A simple search (`Ctrl + F` on Windows/Linux, `Cmd + F` on MacOS) for "XLOC_022167" reveals
that we should be able to find it on line 5856 of file `scaffold_17.gff3` in the `chunks/`
directory.

## 5. Edit the GFF

Now comes the critical step: I will then navigate to chunks/scaffold_17.gff3 and press on the pencil
icon on the top right corner:

![Edit the GFF](../img/github-edit.png)

Since I am not a member of the repository, I will be prompted to fork it. I will do so (press the
green button, or maybe learn about forks first and then press the green button).

This will open an editor view of the file. I will scroll down to line 5856, where I see the
following line:

```
5856:scaffold_17	StringTie	gene	9598040	9601741	.	+	.	ID=XLOC_022167;gene_id=XLOC_022167;oId=TCONS_00057998;transcript_id=TCONS_00057998;tss_id=TSS46367
```

Great, we found it! Now I will add some more colon-separated fields at the end:

```
5856:scaffold_17	StringTie	gene	9598040	9601741	.	+	.	ID=XLOC_022167;gene_id=XLOC_022167;oId=TCONS_00057998;transcript_id=TCONS_00057998;tss_id=TSS46367;name=hes12;annotator=Nikolaos Papadopoulos/Wanninger lab
```

I have added two new fields: `name=hes12` and `annotator=Nikolaos Papadopoulos/Wanninger lab`. The
first one is the gene name, and should need no further explanation. The second one is the name of
the person who made the change (me) and their current affiliation (Wanninger lab), which is going to
be useful when we want to attribute changes to the genome to specific people.

> [!CAUTION]
> GFF files are mostly meant to be read by computers, not humans; hence, it is very important that
> we adhere to the formatting rules. For the "attributes" field, that we are currently editing, the
> rules are as follows:
> 
> - format is `key1=value1;key2=value2;...`; so, a key and a value separated by the equals sign, a
>   semi-colon, and then the next pair of key and value, and so on.
> - The keys are case-sensitive, so `Name=hes12` is _different_ from `name=hes12`.
> - Spaces are only allowed inside values: `name=hes12` is correct, `name = hes12` is not; similarly,
> 
> `ID=XLOC_022167;gene_id=XLOC_022167;`
> 
> is correct, but 
> 
> `ID=XLOC_022167; gene_id=XLOC_022167;`
> 
> (with a space between the first key/value pair and the second) is not. Spaces are permitted if
> they are part of the value, as in `annotator=Nikolaos Papadopoulos`.
> 
> - The last key/value pair in the attributes should not have a semi-colon at the end

## 6. Submit the pull request

After I'm done editing, I will press the green button on the top right "Commit changes...". This
will open a "Propose changes" dialogue, where I should write a brief description of what I did.

![propose changes GitHub](../img/github-propose.png)

After I press the "Propose changes" button, I am taken to another page where I can review what I
just did. The page shows the line I edited, highlighting the changes, and gives me one last chance
to correct mistakes. It also encourages me to "Create pull request".

![Create pull request](../img/github-pull-request.png)

Clicking this will take me to one final page where I can review my explanation. This gives me more
formatting options, such as including links (to the paper, to figures, to analysis results, etc.).
Here, it is preferable to include as much information as possible, similar to what I have outlined
to describe my process here. It is also a good idea to upload your analysis to a place where they
will be permanently accessible, such as [Zenodo](https://zenodo.org/) or
[Figshare](https://figshare.com/).

## 7. Discuss the pull request

Finally, you can find the completed Pull Request
[here](https://github.com/platy-org/pdum-genome/pull/2). Anybody with a GitHub account can comment
on that page, which means you can express your support for my analysis or your constructive
criticism of it. Eventually, the maintainers of the repository will decide whether to accept my
proposal ("merge" the pull request) or not; I might have to take some community suggestions and
improve my analysis before that happens.
