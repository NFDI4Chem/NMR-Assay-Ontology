# NMR-Assay-Ontology



## [Actions Workflows](https://github.com/NFDI4Chem/NMR-Assay-Ontology/actions)
In order to start developing an NMR-Assay-Ontology based on the [draft T-box](https://app.diagrams.net/#G1QopwpmihR1fCKU0Szhjv2T94zCD0lOGR) we are establish a few automated github, mainly based on ROBOT.


### Robot - extract ontology terms
* action: `.github/workflows/robot_extract.yml`
* directory: `.github/workflows/robot_extract.yml`
* [action in github](https://github.com/NFDI4Chem/NMR-Assay-Ontology/actions/workflows/robot_extract.yml)
* artifact: extracted_terms.zip
    * extracted_bfo.ttl       
    * extracted_chebi.ttl      
    * extracted_chmo.ttl      
    * extracted_iao.ttl       
    * extracted_obi.ttl       
    * extracted_ro.ttl        
    * extracted_uo.ttl        
    * merged.ttl     

Extracts the terms from ontologies listed in `ontologies.txt` using [ROBOT](http://robot.obolibrary.org/) 
according to list of terms written in the ontology terms files (terms_*.txt)
using the `ROBOT extract` action with:
* `--method` (TOP, BOT, STAR) 
* `--intermediate` (all, minimal, none)

**ontologies.txt file strcture**:
`prefix uri --method_value --intermediate_value`

Example:

```
iao http://purl.obolibrary.org/obo/iao.owl BOT none
uo http://purl.obolibrary.org/obo/uo.owl TOP minimal
```


### workflow 1: extract external ontology terms 
* all ontologies from which terms will be imported in: `workflows/1_extract_ext_terms/ontologies.txt`
   * format: `prefix uri` 
* all terms to be extracted from ontologies in `workflows/1_extract_ext_terms/terms_prefix.txt`files
* script `workflows/1_extract_ext_terms/extract_terms.sh`
    * downloads ontologies owl files
    * extracts terms
    * merges terms into single TTL: `workflows/1_extract_ext_terms/merged.ttl`

**Run:** 
`cd workflows/1_extract_ext_terms/`
`./extract_terms.sh`

**Query all merged terms**:
`cd workflows/1_extract_ext_terms/`
`arq --query=query_merged_terms.rq --data=merged.ttl --results=CSV > merged_terms.csv`

**TODO:** 
* include CHEBI terms in  extract_chebi.txt
