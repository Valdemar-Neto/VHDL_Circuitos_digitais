# CD-Pessoal-2024.2

Este repositório contém materiais e projetos relacionados ao curso de CD (Computação Distribuída) para o semestre 2024.2.

## Conteúdo

- **Projetos**: Implementações práticas desenvolvidas durante o curso.
- **Materiais de Estudo**: Anotações, slides e outros recursos úteis.
- **Diagramas**: Representações visuais de arquiteturas e fluxos de dados.

## Diagrama do Multiplicador-Bloco

Abaixo está o diagrama do multiplicador-bloco:

![Multiplicador-Bloco](Multiplicador/Diagrama/multiplicador-bloco.drawio.svg)

## Resultados

### Com Truncamento

Os resultados da multiplicação com truncamento são armazenados nos 8 bits menos significativos do vetor de saída. O bit de carry out armazena o resto do truncamento.

#### O truncamento foi necessário, pois o sistema só tem 8 bits

![Com-Truncamento](Multiplicador/results/com_truncamento.jpg)

### Sem Truncamento

Os resultados da multiplicação sem truncamento são armazenados em um vetor de 16 bits, representando o valor completo da multiplicação.

![Sem-Truncamento](Multiplicador/results/sem_truncamento.jpg)

## Diagrama Manuscrito do Multiplicador-Bloco

Abaixo está o diagrama manuscrito do multiplicador-bloco:

![Multiplicador-Bloco-Manuscrito](Multiplicador/Diagrama/multiplicador-bloco-manuscrito.jpg)

