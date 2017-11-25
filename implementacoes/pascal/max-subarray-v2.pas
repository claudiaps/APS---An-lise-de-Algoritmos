{Algoritmo do subvetor maximo em Pascal
Versao 2 - Iterativa melhorada}

program max_subarray;
Uses sysutils, DateUtils;

var
  n, i, soma, maxSoma, inicio, fim, j: integer;
  vet : array of Longint;
  aux : array of string;
  fp : TextFile;
  t1, t2 : TDateTime;
  crono1, crono2 : cardinal;

begin
  if paramcount <> 2 then
    begin
      writeln('Uso: ./algoritmo tam_vetor arquivo');
      exit;
    end;

  n := StrToInt(paramstr(1)); {Tamanho de vetor}
  SetLength(vet, n); {Seta o tamanho entre [0..n-1]}
  SetLength(aux, n);

  assign(fp, paramstr(2)); {Associo o arquivo a variavel fp}
  reset(fp); {Abro o arquivo para leitura}
  i := 0;
  for i := 0 to n-1 do {Enquanto nao estiver no fim do arquivo}
    readln(fp, aux[i]); {Leio o que esta em fp e armazeno em aux}
  close(fp); {Fecho o arquivo}

  i := 0;
  for i := 0 to n-1 do {Passar a string p/ o vetor, convertendo}
    vet[i] := StrToIntDef(aux[i], 0);

  maxSoma := vet[0];
  i       := 0;
  crono1  := GetTickCount64; {Inicia o crono p/ saber o clock}
  t1      := TimeOf(Now); {Marco a hr atual aqui}

  {Encontrar o subvetor maximo.}
  for i := 0 to n-1 do
    begin
      soma := 0;
      for j := i to n-1 do
        begin
          soma  := soma + vet[j];
          if (soma > maxSoma) then {Testa todas as somas de i ate n e encontra a maior}
           begin
            maxSoma := soma;
            inicio  := i;
            fim     := j;
           end;
        end;
    end;

  crono2 := GetTickCount64;
  t2     := TimeOf(Now); {Marco o que tenho de hr atual aqui}

  i:= 0;
  for i := 0 to n-1 do
    writeln('Vet[', i, ']: ', vet[i]);

  writeln('Soma maxima: ', maxSoma);
  writeln('Inicio: ', inicio);
  writeln('Fim: ', fim);
  writeln('Tempo de CPU: ', FloatToStr((crono2-crono1)/1000));
  writeln('Tempo real: ', FloatToStr(((MilliSecondsBetween(t1,t2))/1000)));

  exit;
end.
