// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

/* Feito por Lucas Menezes;
Disciplina de Elementos de Sistemas Computacionais
Sistemas de Informação - UFRPE - 2026.1
*/

// A lógica para esse programa se baseia na transformação de multiplicação em soma
// Ex: 4 x 3 pode ser escrito como 4 + 4 + 4. 
// Percebe-se que é o mesmo que somar 4 a ele mesmo 3 vezes. A partir daí identifica-se o laço de repetição
// E utiliza o 3 como iterador desse laço. 
// A estratégia utilizada para interromper o LOOP foi reduzir uma unidade do iterador a cada iteração que ele faz.
// Isso garante que não haja somas a mais ou a menos

@mult           // Cria um espaço na RAM[16] com nome de variável mult 
M=0             // para armazenar o resultado da multiplicação

(LOOP)
    @R1
    D=M         // D = RAM[1] ( iterador do LOOP)
                // A lógica do iterador ocorre retirando 1 unidade da RAM[1] a cada iteração
    @LOOP_END  
    D;JEQ       // Caso RAM[1] == 0, o laço LOOP é interrompido

    @mult
    D=M         // Registrador D == RAM[mult] (onde o resultado está armazenado)
    @R0
    D=D+M       // Registrador D == RAM[mult] + RAM[0] ( resultado atualizado )
    @mult
    M=D         // Armazena o resultado atualizado em RAM[mult]

    @R1
    M=M-1       // É retirado 1 unidade de RAM[1] usado como iterador do LOOP
    @LOOP
    0;JMP

(LOOP_END)
@mult
D=M             // O registrador D recebe o resultado da multiplicação
@R2
M=D             // R2 recebe o resultado da multiplicação R0 * R1 que estava armazenado no RAM[mult]

(END)
@END            // Bloco responsável por finalizar o programa com o LOOP Infinito
0;JMP