{Algoritmo do subvetor maximo em Pascal
Versao 3 - Divisao e Conquista}

program max_subarray;
Uses sysutils, DateUtils;

type
  sub_max = record
    inicio : Longint;
    fim    : Longint;
    soma   : Longint;
  end;
var
  subvetor : sub_max;

{Verifica se o subvetor maximo esta no meio do vetor}
function max_cross(vet : array of Longint; inicio, meio, fim : Longint) : sub_max;
var
  e_soma, d_soma, soma, e_max, d_max, i : Longint;
  maxSubVetor : sub_max;
begin
  soma   := 0;
  e_soma := vet[0];
  d_soma := vet[0];
  for i := meio downto inicio do {Vai do meio p/ o lado esquerdo}
    begin
      soma := soma + vet[i];
      if(e_soma < soma) then {Encontra a maior soma do meio indo p/ o lado esquerdo}
        begin
          e_soma := soma;
          e_max  := i;
        end;
    end;

    soma := 0;
    i    := 0;
    for i := meio+1 to fim do {Vai do meio p/ o lado direito}
      begin
        soma := soma + vet[i];
        if(soma > d_soma) then {Encontra a maior soma do meio indo p/ o lado direito}
          begin
            d_soma := soma;
            d_max  := i;
          end;
      end;

      {Cria o subvetor de retorno}
      maxSubVetor.inicio := e_max;
      maxSubVetor.fim    := d_max;
      maxSubVetor.soma   := (e_soma + d_soma);

      max_cross := maxSubVetor; {Retorna o subvetor}
end;

function subvetor_maximo(vet : array of Longint; inicio: Longint; fim: Longint) : sub_max;
var
  maxSubVetor, e_maxSubVetor, m_maxSubVetor, d_maxSubVetor : sub_max;
  m : real;
  meio : Longint;
begin
  if(inicio = fim) then {Caso base}
    begin   {Cria o subvetor de retorno}
      maxSubVetor.inicio := inicio;
      maxSubVetor.fim    := fim;
      maxSubVetor.soma   := vet[inicio];
      subvetor_maximo    := maxSubVetor; {Retorno o subvetor}
      exit;
    end
  else
    begin
        m    := (inicio + fim) / 2;
        meio := Trunc(m);

        e_maxSubVetor := subvetor_maximo(vet, inicio, meio); {Testa se o subvetor esta a esquerda}
        d_maxSubVetor := subvetor_maximo(vet, meio+1, fim);  {Testa se o subvetor esta a direta}
        m_maxSubVetor := max_cross(vet, inicio, meio, fim);  {Testa se o subvetor esta no meio}

        if(e_maxSubVetor.soma >= d_maxSubVetor.soma) and (e_maxSubVetor.soma >= m_maxSubVetor.soma) then {Testa se o maior subvetor e o da esquerda}
                subvetor_maximo := e_maxSubVetor
        else if(d_maxSubVetor.soma >= e_maxSubVetor.soma) and (d_maxSubVetor.soma >= m_maxSubVetor.soma) then {Testa se o maior subvetor e o da direita}
                subvetor_maximo := d_maxSubVetor
        else  {Do contrario, o maior subvetor e o do meio}
                subvetor_maximo := m_maxSubVetor;
    end;
end;


var
  n, j: Longint;
  maxSubVetor : sub_max;
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

  assign(fp, paramstr(2)); {Associo o arquivo a variavel fp}
  reset(fp); {Abro o arquivo somente para leitura}
  j := 0;
  for j := 0 to n-1 do
    readln(fp, aux[j]); {Leio o que esta em fp e armazeno em aux}
  close(fp); {Fecho o arquivo}

  j := 0;
  for j := 0 to n-1 do {Passar a string p/ o vetor, convertendo}
    vet[j] := StrToIntDef(aux[j], 0);

  crono1 := GetTickCount64; {Inicia o crono p/ saber o clock}
  t1     := TimeOf(Now); {Marco a hr atual aqui}

  maxSubVetor := subvetor_maximo(vet, 0, n-1); {Encontra o subvetor maximo}

  crono2 := GetTickCount64;
  t2     := TimeOf(Now); {Marco o que tenho de hr atual aqui}
  j      := 0;

  for j := 0 to n-1 do {Mostra os resultados}
    writeln('Vet[', j, ']: ', vet[j]);

  writeln('Soma maxima: ', maxSubVetor.soma);
  writeln('Inicio: ', maxSubVetor.inicio);
  writeln('Fim: ', maxSubVetor.fim);
  writeln('Tempo de CPU: ', FloatToStr((crono2-crono1)/1000));
  writeln('Tempo real: ', FloatToStr(((MilliSecondsBetween(t1,t2))/1000)));

  exit;
end.
