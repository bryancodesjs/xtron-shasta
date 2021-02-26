#!/bin/bash

rm -fr asset-manifest.json
rm -fr favicon.ico
rm -fr fonts
rm -fr index.html
rm -fr js
rm -fr logo*.png
rm -fr manifest.json
rm -fr robots.txt
rm -fr static
rm -fr web.config

cp -fr ../trx-mlm-smart-contract-mobiloitte/build/* ./
