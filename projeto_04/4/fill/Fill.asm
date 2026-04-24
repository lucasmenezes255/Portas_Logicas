// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

/* Feito por Lucas Menezes;
Disciplina de Elementos de Sistemas Computacionais
Sistemas de Informação - UFRPE - 2026.1
*/

/* O Programa armazena em um ponteiro o endereço dos pixels da tela e verifica se alguma tecla do teclado foi digitada.
-> Se alguma tecla for digitada, pinta a tela de PRETO
-> Se nenhuma tecla for digitada, pinta a tela de BRANCO
Para pintar a tela, o programa: 
>> Acessa o ponteiro onde o endereço do pixel da tela está armazenado 
>> Modifica a cor do endereço do pixel
>> Atualiza o ponteiro com o endereço do pixel subsequente e repete esse processo até pintar toda a tela
*/

(RESTART)
@SCREEN
D=A
@tela_array     // Ponteiro que armazena o endereço dos pixels 16384 a 24575. RAM[tela_aray] == RAM[16]
M=D

@KBD
D=M             // D = Tecla digitada ou não digitada do teclado (tecla ou 0)
@SET_WHITE
D;JEQ           // Se nenhum tecla for digitada, seta a cor da tela para BRANCO - 0

@color          // Bloco executado se alguma tecla for digitada, setando a cor da tela para PRETO - (-1 considerando notação complementar a dois) 
M=-1
@DRAW           // Após a cor ser setada no RAM[color] o programa segue para a pintura da tela
0;JMP

(SET_WHITE)     // Bloco executado se nenhuma tecla for digitada, setando a cor da tela para BRANCO - 0
@color          
M=0
@DRAW           // Após a cor ser setada no RAM[color] o programa segue para a pintura da tela
0;JMP

(DRAW)
@tela_array     // Acessa o RAM[16] onde está armazenado como valor o endereço do pixel da tela
D=M             // Armazena no D o endereço do pixel
@KBD
D=D-A           // Verifica se a quantidade de pixels a ser pintada acabou. Se chegou no limite reservado na memória que é quando alcança o teclado
@RESTART        // Reinicia todo o programa caso todos os pixels tenha sido pintado
D;JEQ

@color          // Se ainda tem pixel pra pintar na tela, armazena a cor a ser pintada no D
D=M

@tela_array     // Acessa o endereço do pixel da tela que está armazenado no RAM[16]/RAM[tela_array]
A=M             // Armazena no A o endereço do pixel
M=D             // Atualiza a cor do pixel

@tela_array
M=M+1           // Atualiza o ponteiro RAM[tela_array], a partir daqui ele já aponta/armazena o endereço do pixel subsequente
@DRAW           // Volta para o LOOP de pintura
0;JMP