{Algoritmo do subvetor maximo em Pascal
Versao 4 - Programacao Dinamica, em tese}

program max_subarray;
Uses sysutils, DateUtils;

var
  n, i, soma_inicio, inicio, fim, soma, maxSoma : Longint;
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

  n := StrToInt(paramstr(1)); {Tamanho do vetor}
  SetLength(vet, n); {Seta o tamanho entre [0..n-1]}
  SetLength(aux, n);
  soma_inicio := 0;
  inicio      := 0;
  fim         := 0;

  assign(fp, paramstr(2)); {Associo o arquivo a variavel fp}
  reset(fp); {Abro o arquivo somente para leitura}
  i := 0;
  for i := 0 to n-1 do
  readln(fp, aux[i]); {Leio o que esta em fp e armazeno em aux}
  close(fp); {Fecho o arquivo}

  i := 0;
  for i := 0 to n-1 do {Passar a string p/ o vetor, convertendo}
    vet[i] := StrToIntDef(aux[i], 0);

  {Inicia as somas}
  soma    := vet[0];
  maxSoma := vet[0];

  crono1 := GetTickCount64; {Inicia o crono p/ saber o clock}
  t1     := TimeOf(Now); {Marco a hr atual aqui}

  {Encontrar o subvetor maximo}
  i := 0;
  for i := 1 to n-1 do {Inicia em 1 pelo fato de as somas ja iniciarem em 0}
    begin
      soma := soma + vet[i];
      if vet[i] > soma then {Se for verdade, soma nao e a maior soma}
        begin
          soma        := vet[i]; {Entao a maior soma inicia neste valor}
          soma_inicio := i;
        end;

      if soma > maxSoma then {Se soma for a maior soma}
        begin
          maxSoma := soma;
          inicio  := soma_inicio;
          fim     := i;
        end;
    end;

  crono2 := GetTickCount64;
  t2     := TimeOf(Now); {Marco hr atual aqui}

  {Mostrar o resultado}
  i := 0;
  for i := 0 to n-1 do
    writeln('Vet[', i, ']: ', vet[i]);

  writeln('Soma maxima: ', maxSoma);
  writeln('Inicio: ', inicio);
  writeln('Fim: ', fim);
  writeln('Tempo de CPU: ', FloatToStr((crono2-crono1)/1000));
  writeln('Tempo real: ', FloatToStr(((MilliSecondsBetween(t1,t2))/1000)));

  exit;
end.
