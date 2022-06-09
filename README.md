# NMR-Assay-Ontology

This repository is makred as archived, as the work for it has been put on hold for now.

## [Actions Workflows](https://github.com/NFDI4Chem/NMR-Assay-Ontology/actions)
In order to start developing an NMR-Assay-Ontology based on the [draft T-box](https://app.diagrams.net/#G1QopwpmihR1fCKU0Szhjv2T94zCD0lOGR) we are establish a few automated github, mainly based on ROBOT.


### Robot - extract ontology terms

Extracts the terms from ontologies listed in `ontologies.txt` using [ROBOT](http://robot.obolibrary.org/) 
according to list of terms written in the ontology terms files (terms_*.txt)
using the `ROBOT extract` action with:
* `--method` (TOP, BOT, STAR) 
* `--intermediate` (all, minimal, none)

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

ontologies.txt file structure: `prefix uri --method_value --intermediate_value`

Example:
```
iao http://purl.obolibrary.org/obo/iao.owl BOT none
uo http://purl.obolibrary.org/obo/uo.owl TOP minimal
```

