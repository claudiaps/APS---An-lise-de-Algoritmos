{Algoritmo do subvetor maximo em Pascal
Versao 1 - Iterativa}

program max_subarray;
Uses sysutils, DateUtils;

var
  n, i, soma, maxSoma, inicio, fim, j, k: Longint;
  vet : array of Longint;
  aux : array of string;
  fp : TextFile;
  t2, t1 : TDateTime;
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

  assign(fp, paramstr(2)); {Associo o arquivo a variavel de controle fp}
  reset(fp); {Abro o arquivo para leitura}
  i := 0;
  for i := 0 to n-1 do {Enquanto o arquivo nao estiver no fim}
    begin
      readln(fp, aux[i]); {Leio o que esta em fp e armazeno em aux}
    end;
  close(fp); {Fecho o arquivo}

  i := 0;
  for i := 0 to n-1 do {for para passar a string do arquivo para o vetor}
    begin
      vet[i] := StrToIntDef(aux[i], 0);
    end;

  maxSoma := vet[0];
  crono1  := GetTickCount64;   {Inicia o crono p/ saber o clock}
  t1      := TimeOf(Now); {Marco a hora atual aqui}

  {Encontrar o subvetor maximo.}
  for i := 0 to n-1 do {Valor inicial}
    for j := i to n-1 do {Valor final}
      begin
        soma := 0;
        for k := i to j do {Soma todos os valores entre i e j}
          soma := soma + vet[k];

        if(soma > maxSoma) then {Testa se 'soma' e a maior soma.}
          begin
            maxSoma := soma;
            inicio  := i;
            fim     := j;
          end;
      end;
  crono2 := GetTickCount64;
  t2     := TimeOf(Now); {Marco o que tenho de hora atual aqui}

  i:= 0;
  for i := 0 to n-1 do
    writeln('Vet[', i, ']: ', vet[i]);

  writeln('Soma maxima: ', maxSoma);
  writeln('Inicio: ', inicio);
  writeln('Fim: ', fim);
  writeln('Tempo de CPU: ', FloatToStr((crono2-crono1)/1000)); {Faz a diferena do clock ate aqui com o que tinha em crono}
  writeln('Tempo real: ', FloatToStr((MilliSecondsBetween(t1,t2))));  {Diferenca em ms das horas que marquei -> t1 e t2}

  exit;
end.
