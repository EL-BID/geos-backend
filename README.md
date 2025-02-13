# Guia Edutec Repository - Open Source

## Language Dictionaries

All Language Dictionaries were moved from the database to discrete JSON files located at `app/assets/lang-dictionaries/`. Do not use the dictionaries found in the database as they are deprecated/outdated. The files must be manually maintained and kept in sync between all languages.

`legacy/`: Contains the original language dictionaries moved from the database

`other directories/`: Keep new dictionaries contextually separated in directories.

### Endpoint: GET translation/:langCode/:dictionary?

The API's `GET translation/` endpoint was changed to respond these JSON files. It maintains its original signature (retro-compatible) but it adds a new optional `:dictionary` parameter for contextual dictionaries. If no `:dictionary` parameter is passed, it will default to the `legacy` dictionary.

## Back-end project

-   [Technical Documentation](https://github.com/EL-BID/geos-backend/blob/master/Documentaci%C3%B3n_T%C3%A9cnica_Guia_Edutec.pdf)

Access to other projects

-   [Front-end](https://github.com/EL-BID/geos-frontend)
-   [Database](https://github.com/EL-BID/geos-database)

---

Shield: [![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg

---

_The Guia Edutec was originally developed by CIEB. The process of opening the code has made possible by financial support of Fundación ProFuturo._
