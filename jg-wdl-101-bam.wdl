version 1.0
workflow samtoolsIdxstats {
  input {
    File bamfile
  }
  call idxstats {
    input: 
      bamfile = bamfile
      idxfile = idxfile
  }
  output {
    File results = idxstats.idxstats
  }
}

task idxstats {
  input {
    File bamfile
    idxfile = idxfile
  }
  command <<<
    samtools idxstats ~{bamfile} ~{idxfile} > idxstats.txt
  >>>
  output {
    File idxstats = "idxstats.txt"
  }
  runtime {
    docker: 'jacobog02/cov3ma_search:v3'
  }
}
