# Projeto de Controle e Simulação de Quadricóptero 6DOF

Este projeto foi desenvolvido como exame final da disciplina **CMC-12: Sistemas de Controle Contínuos e Discretos**. O objetivo é simular e controlar um drone (quadricóptero) em 6 graus de liberdade (6DOF), utilizando controladores PID, com visualização 3D e análise dos resultados.

## Contexto

O controle de veículos aéreos não tripulados (VANTs), como quadricópteros, é um tema clássico e desafiador em Engenharia de Controle. Este projeto implementa, em MATLAB/Simulink, a modelagem, projeto de controladores, simulação e visualização de um quadricóptero, permitindo a análise do desempenho dos controladores em diferentes cenários de referência.

## Estrutura do Projeto

- **main/**: scripts principais para rodar as simulações.
- **dinamica/**, **modelos/**, **controladores/**, **simulacao/**: funções auxiliares para modelagem, controle e simulação.
- **visualizacao/**: scripts para animação 3D e geração de gráficos.
- **resultados/**: onde são salvos os vídeos e gráficos gerados.

## Como executar uma Simulação

1. **Abra o MATLAB** e navegue até a pasta principal do projeto (main/).

2. **Execute o script principal** passando a letra do experimento desejado (de `'a'` a `'h'`):

   ```matlab
   executarSimulacao('f')
   ```

   Isso irá:
   - Projetar os controladores para o drone.
   - Simular o experimento escolhido.
   - Gerar uma animação 3D do voo.
   - Gerar gráficos de trajetória, ângulos, forças e torques.

   Todos os resultados (vídeos `.avi` e gráficos `.png`) serão salvos automaticamente na pasta `resultados/`.

## Experimentos Disponíveis

Cada experimento (de `'a'` a `'h'`) corresponde a um cenário de referência diferente:

| Letra | Descrição                                                                             |
|-------|---------------------------------------------------------------------------------------|
| a     | Decola e mantém posição fixa em (0, 0, 1)                                             |
| b     | Sobe até Z=1 e depois se desloca até (1, 1, 1)                                        |
| c     | Sobe até Z=1 e depois segue uma referência que se desloca em linha reta               |
| d     | Mantém (0, 0, 1) com perturbação em Z (empurrão para baixo)                           |
| e     | Igual ao c, mas com uma perturbação contrária ao trajeto                              |
| f     | Segue uma figura de Lissajous no plano Z=1                                            |
| g     | Movimento circular no plano XY enquanto Z oscila em forma de senoide                  |
| h     | Segue uma espiral circular em X, Y, subindo em Z                                      |

Consulte o código da função `simularExperimentoMulticoptero` para detalhes matemáticos de cada referência.

## Requisitos

- MATLAB (recomenda-se versão 2020a ou superior)
- Simulink
- (Opcional) Toolboxes adicionais, caso utilize recursos gráficos avançados

## Créditos

- **Autores:** Artur Dantas Ferreira da Silva, Guilherme Eiji Moriya, Arthur Rocha e Silva
- **Professor:** Marcos Ricardo Omena de Albuquerque Maximo 
- **Disciplina:** CMC-12: Sistemas de Controle Contínuos e Discretos
- **Ano/Semestre:** 2025/1

---
