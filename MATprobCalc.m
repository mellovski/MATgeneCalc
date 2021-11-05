clear all
clc                 %limpa tudo
denovo =1;             %variavel para continuar dentro do while ou sair para terminar o programa
while(denovo ==1)
    disp('CALCULADOR DE PROBABILIDADES DE HERANÇA DA EMPRESA AKT: Agatha, Kauanne e Thays');  
    oquequercalcular = input('Digite 1 para saber somente os fenotipos e todas as suas probabilidades, ou digite 2 para saber todo o genotipo: ');
    while(oquequercalcular >2 | oquequercalcular <1);    %se oquequercalcular == 1, calculará as probabilidades, oquequercalcular ==2, os fenotipos
        oquequercalcular = input('Digite um valor valido: ');
    end

    if (oquequercalcular == 2)
    
        disp('...Calculando Fenotipos e Genotipos   ');
        %insercao de dados
        q = input('Quantidades de caracteristicas: ');      %vai pedir o numero de caracteristicas pra armazenar em Q
        while q <= 0                                        %nao existe quantidade de caracteristicas negativas, entao enquanto q menor que 0, pedirá um novo valor  
            q = input('Digite um valor valido! ');
        end
        for i = 1:q                %completará no vetor todos os nomes de caracteristicas. o limite do vetor é o valor de q
            c{i} = input('Digite uma caracteristica: ', 's');
        end
        for i = 1:q                %para cada caracteristica, será feito uma atribuicao de alelos para numeros nos vetores. a() é alelos maternos, b() alelos paternos
            disp('Legenda', '1-Heterozigoto (Aa)','2-Homozigoto Dominante (AA)', '3-Homozigoto Recessivo (aa)', c{i});
            a{i} = input('Sobre o alelo 1 (materno) da caracteristica: ');
            while (a{i} < 1 | a{i} >3)     %se nao valer os numeros da legenda, continuará no while até que um valor entre 1 e 3 seja atribuido
                a{i} = input('Digite um valor valido! ');
            end
            b{i} = input('Sobre o alelo 1 (paterno) da caracteristica: ');
            while (b{i} < 1 | b{i} >3)
                b{i} = input('Digite um valor valido! ');
            end
        end 

        for i = 1:q
            disp('Sobre os fenotipos dos genes que definem: ', c{i}, ' Digite sobre os fenotipos dos alelos: '); %para cada caracteristica atruibuida no vetor c(), completará também nos vetores o que cada combinacao significa. (este codigo é da agatha, kauanne e thays caso algum espertinho copie e nem leia todos os comentarios)
            FHH{i} = input('Heterozigotos: ', 's');   % o que Aa significa
            FHD{i} = input('Homozigoto Dominante: ', 's'); %o que AA significa
            FHR{i} = input('Homozigoto Recessivo: ', 's'); %o que aa significa
        end
%Fim da inserçao de dados
%Inicio do processamento e saida de dados
%Mostrando genotipos e fenotipos e guardando porcentagem
        for i = 1:q
            disp('Sobre a caracteristica ', c{i});    %calculará os pares de alelos para caracteristica q vezes
            if ((a{i} == 2 & b {i} == 3) | (b{i} == 2 & a{i} == 3))  %se ou o pai ou a mae forem homozigotos dominantes e ou pai ou mae forem homozigotos recessivos
                disp('4 Pares de alelos heterozigotos (Aa), para uma caracteristica o fenotipo é ', FHH{i});    %Aa   
        
       
        
            elseif ((a{i} == 2 & b{i} == 1) | (b{i}==2 & a{i} ==1)) %se ou pai ou a mae forem heterozigotos e ou pai ou mae forem homozigotos dominantes
                disp('2 pares de alelos heterozigotos (Aa) de fenotipo ', FHH{i}, 'e 2 pares de alelos homozigotos dominante (AA) de fenotipo', FHD{i}); % Aa ou AA
       
        
            elseif (a{i} ==2 & b{i} == 2) %se pai e mae forem homozigotos dominantes
                disp('4 pares de alelos homozigotos dominantes (AA) de fenotipo ', FHD{i}); %AA
     
        
            elseif (a{i} ==3 & b{i} ==3) %se pai e mae forem recessivos
                disp('4 pares de homozigotos recessivos (aa) do fenotipo ', FHR{i}); %aa
       
            elseif (a{i} ==1 & b{i} ==3) | (b{i} == 1 & a{i} ==3) %se pai ou mae forem recessivos e pai ou mae heterozigotos
                disp('2 pares de alelos heterozigotos (Aa) de fenotipo', FHH{i}, 'e 2 pares de alelos homizigotos recessivos (aa) de fenotipos', FHR{i}); %Aa ou aa
      
            elseif (a{i} ==1 & b{i} ==1) %pai e mae heterozigotos
                disp('2 pares de alelos heterozigotos (Aa) de fenotipo ', FHH{i}, '1 par de alelos homozigotos dominantes (AA) de fenotipo', FHD{i}, 'e 1 par de alelos homozigotos recessivos (aa) de fenotipo', FHR{i});
        %aa ou Aa ou AA
            else
                disp(' Algo nao esta bem '); %nunca deve chegar nesta ultima condicao
            end
        end
   
    elseif (oquequercalcular == 1)
 
        n = input('Quantas caracteristicas para as probabilidades? ');         

        for i = 1:n                                 %repete n vezes, que é o numero de caracteristicas
            c{i} = input ('Qual a caracteristica dominante? ', 's');       %PEDE OS NOMES DAS CARACTERISTICAS PRA ORGANIZAR DEPOIS
            r{i} = input ('Qual a caracteristica recessiva? ', 's');
            disp('INDIVIDUO 1');                                %PEDE OS PARES DE ALELOS
            disp('Digite 1 para homozigoto recessivo');
            disp('Digite 2 para homozigoto dominante');
            alelo1 = input('Digite 3 para heterozigoto: ');           %AQUI COMECAM AS CONTAS DAS PROBABILIDADES PROS ALELOS DE UMA CARACTERISTICA
            while (alelo1 > 3  | alelo1 < 1)
                disp('NUMERO INVALIDO');          %EH SO PRA DIGITAR UM NUMERO DE 1 A 3, se tiver algo diferente disso continua dentro do while
                alelo1 = input('Digite 3 para heterozigoto: ');
            end
        
            disp('INDIVIDUO 2');       %repete o mesmo para o segundo individuo
            disp('Digite 1 para homozigoto recessivo');
            disp('Digite 2 para homozigoto dominante');
            alelo2 = input('Digite 3 para heterozigoto: ');
            while (alelo2 > 3 | alelo2 < 1)
                disp('NUMERO INVALIDO');
                alelo2 = input('Digite 3 para heterozigoto: ');
            end
            if (alelo1 == 1)           %ALTAS CONTAS DE ALELOS E PROBABILIDADES. a(i) EH O VETOR QUE TEM AS PROBABILIDADES DE ALELOS RECESSIVOS APARECEREM. r(i) OS NOMES
                if (alelo2 == 1)
                    a(i) = 1.00;          %b(i) TEM AS PROBABILIDADES DOS ALELOS DOMINANTES APARECEREM (O NOME DAS CARACTERISTICAS ESTA NO VETOR c(i)
                    b(i) = 0.0;
                end
                if (alelo2 == 2)
                    a(i) = 0.0;
                    b(i) = 1.00;
            
                end
                if (alelo2 == 3)
                    a(i) = 0.50;
                    b(i) = 0.50;
            
                end
            end
            if (alelo1 == 2)
                if (alelo2 == 1)
                    a(i) = 0.0;
                    b(i) = 1.00;
                end
                if (alelo2 == 2)
                    a(i) = 0.0;
                    b(i) = 1.00;
            
                end
                if (alelo2 == 3)
                    a(i) = 0;
                    b(i) = 1.00;
            
                end
            end
            if (alelo1 == 3)
                if (alelo2 == 1)
                    a(i) = 0.50;
                    b(i) = 0.50;
                end
                if (alelo2 == 2)
                    a(i) = 0;
                    b(i) = 1.00;
            
                end
                if (alelo2 == 3)
                    a(i) = 0.25;
                    b(i) = 0.75;
            
                end
            end
            resultado = a(i)*100;
            porcentagem = ['Individualmente, porcentagem de ' num2str(resultado) '%' ' de chance de ser ', r{i}];
            disp(porcentagem);    
            disp('***********************************************');
  
    
    
        end

        disp('Maior probabilidade de aparecer as seguintes caracteristicas:');  %COMPARA TODAS AS PROBABILIDADES DOS ALELOS PRA VER A MAIS ALTA E MOSTRA PRO USUARIO
        for i = 1:n
 
    
            if (a(i) > b(i))
                disp(r{i});
      
            elseif (b(i) > a(i))
                disp(c{i});
      
            else
                disp(c{i}, ' ou ', r{i});
            end 
      
        end
        disp('***********************************************');
        disp('Menor probabilidade de aparecer as seguintes caracteristicas:');   %COMPARA TODAS AS PROBABILIDADES PRA VER AS MAIS BAIXAS
        for i = 1:n
 
    
            if (a(i) < b(i))
                disp(r{i});
                
            elseif (b(i) < a(i))
                disp(c{i});
      
            else
                disp(c{i}, ' ou ', r{i});
            end 
      
        end
        disp('***********************************************');
        resultado = 1;
        disp('Todas as probabilidades de caracteristicas:');    %Início. 
        
        for j = 1:(2^n)                  %ESSE FOR FAZ COM QUE O PROCESSO SE REPITA AS VEZES NECESSARIAS PRA COMPLETE TODAS AS COMBINACOES EXISTENTES E POSSIVEIS!!!!
            for i = 1:n                 %ESTE FOR FAZ COM QUE TODOS OS NUMEROS DOS VETORES ATE A POSICAO n SEJAM LIDOS E COMPARADOS PARA QUE TODAS AS COMBINACOES ACONTACAM ALGUMA HORA
                comparacao = int2bin((j-1),n);         %ISTO FAZ COM QUE O NUMERO J-1 SE CONVERTA PARA BINARIO EM UM VETOR DE N ESPACOS. VAI DAR 00 01 10 11 POR EXEMPLO
                if (comparacao(i) == 0)                %SE O NUMERO DO VETOR QUE ESTA NA POSICAO i EH 0, FAZ AS CONTAS DO RESULTADO PARA AS COMBINACOES COM GENE RECESSIVO
                    resultado = resultado*a(i);
                    disp(r(i));
                else
                    resultado = resultado*b(i);    %SE O NUMERO DO VETOR Q TA NA POSICAO i EH 1, AS CONTAS DO RESULTADO PRA COMBINACAO USA A PROBABILIDADE DO GENE DOMINANTE
                    disp(c(i));
                end
    
    
            end
            resultado = resultado*100;
            porcentagem = [num2str(resultado) '%'];
            disp(porcentagem());
            resultado = 1;
            disp('***********************************************');
        end                                   %A GISELLE TEM PEDRA NO RIM, EH SO POR ISSO, NAO TEM MUITO O QUE EXPLICAR
        
    end
    denovo = input('Gostaria de rodar denovo? Digite 1 se sim, ou aperte outra tecla para terminar. '); %se denovo nao for 1, sai do while e acaba o codigo
end