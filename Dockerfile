FROM miktex/miktex:next

WORKDIR /tex

CMD ["pdflatex", "./src/main.tex"]
