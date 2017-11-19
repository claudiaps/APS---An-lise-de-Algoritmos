{Algoritmo do subvetor maximo em Pascal
Versao 4 - Programacao Dinamica, em tese}

program max_subarray;
Uses sysutils, myBib;

var
  n, i, soma_inicio, inicio, fim, soma, maxSoma : integer;
  vet : array of Longint;
begin
  if paramcount <> 1 then
    begin
      writeln('Uso: ./algoritmo tam_vetor');
      exit;
    end;

  n := StrToInt(paramstr(1)); {Tamanho do vetor}
  SetLength(vet, n); {Seta o tamanho entre [0..n-1]}
  Randomize;
  soma_inicio := 0;
  inicio      := 0;
  fim         := 0;

  for i := 0 to n-1 do {Inicia  o vetor com numeros pseudoaleatorios}
    vet[i] := ((myRand() mod 200) - 100);

  {Inicia as somas}
  soma    := vet[0];
  maxSoma := vet[0];

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

  {Mostrar o resultado}
  i := 0;
  for i := 0 to n-1 do
    writeln('Vet[', i, ']: ', vet[i]);

  writeln('Soma maxima: ', maxSoma);
  writeln('Inicio: ', inicio);
  writeln('Fim: ', fim);

  exit;
end.
