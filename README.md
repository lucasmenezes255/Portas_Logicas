# Portas Lógicas - Projeto 1 Nand to Tetris - Lógica Booleana
Este repositório contém 15 implementações de portas lógicas fundamentais para construção de hardware utilizando a porta *`NAND`* como porta primária.

## 🚀 Descrição do projeto
A ideia é utilizar a porta *`NAND`* como porta primitiva e a partir dela, gradativamente, construir portas lógicas mais complexas que compõem um computador.

A partir da porata *`NAND`*, foram desenvolvidas as abstrações necessárias para criação de chips de lógica computacional, seletores(Mux e DMux) e processamento de 16 bits 

### 🧰 Portas Implementadas
| Categoria | Chips |
| :--- | :---: |
| **Básicas** | `Not`, `And`, `Or`, `Xor` |
| **Seletores** | `Mux`, `DMux` |
| **Barramentos (16-bit)** | `Not16`, `And16`, `Or16`, `Mux16` |
| **Multi-vias** | `Or8Way`, `Mux4Way16`, `Mux8Way16`, `DMux4Way`, `DMux8Way` |

## Conceitos Importantes
- Lógica Booleana
  
  Sistema algébrico binário que utiliza somente **`0 e 1`** para representar valores e diferente da aritmética, utiliza *AND*, *OR* e *NOT* como operadores. Chamados de **Operadores lógicos**.

- Abstração

  Processo de descrição de problemas grandes e complexos em problemas menores e mais simples. De modo prático, vai descrever da forma simples, utilizando chips pequenos, o comportamento de um chip maior.

- Implementação

  Código escrito da abstração do problema. Descreve como o chip vai se comportar e como vai fazer o que foi criado para fazer.

- `HDL`

  (*Hardware Definition Language*) É a linguagem de definição de Hardware. A sintaxe usada para implementar os chips e interconectar seus pinos.

## ✅ Como Validar
  1. Abrir o <a href='https://nand2tetris.github.io/web-ide/chip' >Nand to Tetris </a>
  3. Carregar o arquivo *`.hdl`* da porta desejada
  4. Carregar o arquivo de testes *`.tst`* correspondente
  5. Executar o script
