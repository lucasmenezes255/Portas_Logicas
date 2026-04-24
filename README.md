<a name="topo"></a> 
# 🧮 Nand to Tetris: Construindo um computador a partir do NAND
Este repositório documenta minha jornada através do projeto Nand2Tetris, que tem como objetivo utilizar a porta *`NAND`* como porta primitiva e, gradativamente, construir portas lógicas mais complexas até compor um computador **Hack** com hardware e software funcionais.

## 🚀 Progresso dos módulos
- [x] **Projeto 1** - *Lógica booleana*
- [x] **Projeto 2** - *Aritmética booleana*
- [x] **Projeto 3** - *Memória*
- [x] **Projeto 4** - *Linguagem de máquina*
- [ ] **Projeto 5** - *Arquitetura computacional*
- [ ] **Projeto 6** - *Assembler*

[![Status P1](https://img.shields.io/badge/Projeto%201-Conclu%C3%ADdo-2E7D32?style=flat-square&labelColor=343A40)](./projeto_01)
[![Status P2](https://img.shields.io/badge/Projeto%202-Conclu%C3%ADdo-2E7D32?style=flat-square&labelColor=343A40)](./projeto_02)
[![Status P3](https://img.shields.io/badge/Projeto%203-Conclu%C3%ADdo-2E7D32?style=flat-square&labelColor=343A40)](./projeto_03/)  
[![Status P4](https://img.shields.io/badge/Projeto%204-Conclu%C3%ADdo-2E7D32?style=flat-square&labelColor=343A40)](./projeto_04/4/)
[![Status P5](https://img.shields.io/badge/Projeto%205-Em%20Andamento-6F42C1?style=flat-square&labelColor=343A40)](#topo)
[![Status P6](https://img.shields.io/badge/Projeto%206-N%C3%A3o%20Iniciado-007ACC?style=flat-square&labelColor=343A40)](#topo)
## 📦 Projeto 1 - Portas Lógicas
A partir da porata *`NAND`*, foram desenvolvidas as abstrações necessárias para criação de chips de lógica computacional, seletores e processamento de 16 bits, implementadas por 15 portas lógicas fundamentais dentro de um hardware. 

*Os arquivos `.hdl` das portas lógicas estão dispostos na pasta de [Portas Lógicas](./projeto_01), assim como um ***arquivo .ZIP*** com todas as portas compactadas.*

### 🧰 Portas Implementadas
| Categoria | Chips |
| :---: | :---: |
| **Básicas** | `Not`, `And`, `Or`, `Xor` |
| **Seletores** | `Mux`, `DMux` |
| **Barramentos (16-bit)** | `Not16`, `And16`, `Or16`, `Mux16` |
| **Multi-vias** | `Or8Way`, `Mux4Way16`, `Mux8Way16`, `DMux4Way`, `DMux8Way` |

### 📘 Conceitos Importantes
- **Lógica Booleana**
  
  Sistema algébrico binário que utiliza somente **`0 e 1`** para representar valores que diferente da aritmética, utiliza *AND*, *OR* e *NOT* como operadores, chamados de **Operadores lógicos**.

- **Abstração**

  Processo de descrição de problemas grandes e complexos em problemas menores e mais simples. De modo prático, vai descrever da forma simples, utilizando chips pequenos, o comportamento de um chip maior.

- Implementação

  Código escrito da abstração do problema. Descreve como o chip vai se comportar e como vai fazer o que foi criado para fazer.

- **`HDL`**

  (*Hardware Definition Language*) É a linguagem de definição de Hardware. A sintaxe usada para implementar os chips e interconectar seus pinos.

[***↑ VOLTAR AO TOPO***](#topo)

## 📦 Projeto 2 - Aritmética booleana
A partir das portas construídas no projeto 1 é possível construir operadores aritméticos utilizando bits. Nesse projeto 2 foram implementados somadores aritméticos individuais e um somador de 16 bits, além de um incrementador de 16 bits e uma ULA (Unidade Lógica Aritmética).

*Os arquivos `.hdl` das implementações do projeto 2 estão dispostas na pasta de [Aritmética Booleana](./projeto_02), assim como o **arquivo .ZIP** com todas as 5 implementações compactadas.*

### 🧰 **Implementações do Projeto 2**
  | Tipo | Função |
  | :--- | :--- |
  |**HalfAdder** | *Retorna a soma `sum` de 2 bits e um `carry` (conhecido como "vai um" de uma soma)* |
  | **FullAdder** | *Caluca a soma de 2 bits com o carry. Recebe 3 bits, sendo 2 números e o outro sendo um carry de entrada `carry_in` e retorna a soma `sum` e um carry de saída `carry_out`* |
  | **Add16** | *Somador que utiliza `FullAdder` encadeados para calcular a soma de 2 bus de 16 bits* |
  | **Inc16** | *Operador que soma 1 unidade a um barramento de 16 bits de entrada* |
  | **ULA** | *Unidade Lógica Aritmética, também chamada de ALU (acrônimo em inglês), que opera em 16 bits em notação complemento à 2 e executa uma de 18 funções definidas a partir de um conjunto de funções lógicas e aritméticas pré-definidas sobre 2 valores de entrada e retorna além da saída `out`, 2 valores `zr` para caso a saída seja 0 e `ng` para caso a saída seja um número negativo* |

[***↑ VOLTAR AO TOPO***](#topo)

## 💾 Projeto 3 - Memória
A partir desse ponto do projeto, o tempo passa a ser uma unidade relevante. As portas e somadores construídos anteriormente, possuem uma arquitetura lógica chamada de lógica combinacional, onde os valores de saída dependem única e exclusivamente das entradas fornecidas. A partir do projeto 3, passa-se a utilizar o conceito de **lógica sequencial** e **conservação de um estado** na memória. 

Nesse projeto 3 foram implementados Registrador de 1-bit (BIT), Registrador de 16-bits, Memória RAM de 8, 64, 512, 4K e 16K endereços e um PC *(Program Counter)*

*Os arquivos `.hdl` das implementações do projeto 3 estão dispostas na pasta de [Memória](./projeto_03), assim como o **arquivo .ZIP** com todas as 8 implementações compactadas.*

### 🧰 **Implementações do Projeto 3**
  | Tipo | Função |
  | :-: | :- |
  | BIT | Porta sequencial, átomo das portas sequenciais capaz de manter 1 bit com um valor estável - *0 ou 1* - ao longo de um tempo $t$|
  | Registrador 16 bits | Um conjunto de 16 registradores de 1 bit para armazenar uma *palavra* de bits |
  | RAM8 | Agrupamento de 8 registradores dentro da memória, onde podem ser acessados e/ou alterados seguindo um **endereço** determinado por uma lógica de *DMux* e *Mux* |
  | RAM64 | Agrupamento de **8 memórias RAM8** que é capaz de armazenar 64 registros/endereços |
  | RAM512 | Agrupamento de **8 memórias RAM64** que é capaz de armazenar 512 registros/endereços |
  | RAM4K | Agrupamento de **8 memórias RAM512** que é capaz de armazenar 4096 registros/endereços |
  | RAM16K | Agrupamento de **4 memórias RAM4K** que é capaz de armazenar 16384 registros/endereços |
  | PC | **Registrador inteligente** que é capaz de controlar a próxima instrução a ser feita. Suportando *reset, load de registrador e incrementador*. |

[***↑ VOLTAR AO TOPO***](#topo)

## **`>_`** Linguagem de Máquina
Nesse projeto, explorei a linguagem de máquina do computador Hack, tendo contato com a famosa linguagem **Assembly** para construção da lógica de chips e manipulação de dados em memória. Para o projeto 4 foram implementados 2 algoritmos simples. Um **algoritmo algébrico** utilizando somas sucessivas e um **algoritmo interativo** que possui um funcionamento simples onde preenche a tela de preto se uma tecla for pressionada e preenche a tela de branco caso nenhuma tecla for pressionada.

A partir desse módulo, o projeto passa a tratar das instruções que o processador recebe e como ele tratas essas instruções e de onde elas vem.

| RAM | ROM |
| :-: | :-: |
| Memória de Acesso Randômico *(Random Acess Memory)*, parte da memória do sistema computacional utilizada para armazenar os dados | Memória Apenas de Leitura *(Read Only Memmory)*, parte na memória do sistema computacional reservada apenas para armazenar as instruções que o processador deve executar. Diferente da RAM, as informações da ROM não podem ser modificadas ou alteradas

### Registradores
- **Registrador Tipo A:** Registrador próximo da CPU capaz de armazenar tanto endereços quanto dados
- **Registrador Tipo D:** Registrador também próximo a CPU capaz de armazenar somente dados
- **Registrador Tipo M:** Registrador virtual que representa o valor referenciado pelo registrador A na memória RAM. **M = RAM[A]**

### Instruções
A CPU do Hack sabe qual a próxima instrução a ser executada por conta do PC que referencia o código que a CPU deve executar referente ao que está na ROM. As instruções de uma CPU são sequenciais, seguem a ordem que foi escrita. Existem 2 tipos de instruções:
- **Instrução Tipo A:** Atribui ao registrador A o valor de $value$
```
  @value
```
- **Instrução Tipo C:** Computa uma operação $(comp)$, armazena um resultado $(dest)$ e é capaz de saltar para uma instrução no endereço **ROM[A]**
```
  dest = comp; jump
```

### Mapeamento de Memória
A memória do Hack é mapeada da seguinte forma
- **RAM[0] -> RAM[16383]:** Espaço de memória reservado para dados
- **RAM[16384] -> RAM[24575]:** Espaço de memória reservado para a tela 512x255 *(SCREEN)* 
- **RAM[24576]:** Espaço de memória reservado para o teclado *(KBD)*. O código das teclas seguem a **Tabela ASCII**
### 🔣 Algoritmo Algébrico
Consiste em realizar uma multiplicação simples de números nos endereços RAM[0] e RAM[1] e armazenar o resultado no endereço RAM[2].
$$R2 = R0 * R1$$
Esse algoritmo pode ser solucionado através de sucessivas somas e em seguida armazenar o resultado no endereço da RAM[2]

### 🎨 Algoritmo Interativo
Consiste uma interação do teclado e da tela do computador processados pela CPU, onde no caso de alguma tecla do teclado estiver pressionada, todos os pixels da tela são pintados na cor **PRETO** e no caso de nenhuma tecla estiver pressionada, os pixels da dela são pintados na cor **BRANCO**. Sendo utilizados **ponteiros** para percorrer os endereços dos pixels da tela.

[***↑ VOLTAR AO TOPO***](#topo)

## ✅ Como Testar
  1. Abrir o [Nand to Tetris](https://nand2tetris.github.io/web-ide/chip)
  2. Selecionar o projeto desejado *(Caso queira testar o Projeto 4, acesse a aba CPU Emulator ou acesse [CPU](https://nand2tetris.github.io/web-ide/cpu))*
  3. Carregar o arquivo *`.hdl`*
  4. Carregar o arquivo de testes *`.tst`* correspondente
  5. Executar o script

[***↑ VOLTAR AO TOPO***](#topo)
