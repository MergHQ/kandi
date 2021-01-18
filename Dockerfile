FROM miktex/miktex:next

WORKDIR /tex

RUN mpm --update-db

CMD ["pdflatex", "./src/main.tex"]
