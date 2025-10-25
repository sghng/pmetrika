thumbnail:
    cp template/main.typ tmp.typ
    sed -i '' '/^#import/s/"[^"]*"/"lib.typ"/' tmp.typ
    touch refs.bib
    typst compile -f png --pages 1 --ppi 250 tmp.typ thumbnail.png
    oxipng -o 4 --strip safe --alpha thumbnail.png
    rm tmp.typ refs.bib
