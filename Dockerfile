FROM ponylang/ponyc:release

COPY . /src/main/
WORKDIR /src/main
RUN ponyc
CMD ./main --ponythreads=4
