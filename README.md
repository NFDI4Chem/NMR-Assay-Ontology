# NMR-Assay-Ontology

## Workflow
In order to start developing an NMR-Assay-Ontology based on the [draft T-box](https://app.diagrams.net/#G1QopwpmihR1fCKU0Szhjv2T94zCD0lOGR) we are establish a few automated workflows, main based on ROBOT, Protege (with MIREOT extension).

### workflow 1: extract external ontology terms 
* all ontologies from which terms will be imported in: `workflows/1_extract_ext_terms/ontologies.txt`
   * format: `prefix uri` 
* all terms to be extracted from ontologies in `workflows/1_extract_ext_terms/terms_prefix.txt`files
* script `workflows/1_extract_ext_terms/extract_terms.sh`
    * downloads ontologies owl files
    * extracts terms
    * merges terms into single TTL (TODO) 

**TODO:** 
* include all terms in respective extract_*.txt files
* instruct robot to merge the `workflows/1_extract_ext_terms/extracted_*.ttl` files into a single file