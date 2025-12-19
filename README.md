# Befit Technical Challenge - Flutter


## Parabéns por ter chegado até aqui!

Estamos muito felizes em ver seu interesse em fazer parte do time Befit. Agora começa a etapa do desafio técnico — um momento importante para entendermos como você estrutura soluções, toma decisões e transforma problemas reais de produto em experiências que encantam o usuário.

O desafio consiste em implementar uma versão simplificada do onboarding do app Befit. Essa etapa do aplicativo é extremamente estratégica: a maioria das assinaturas acontecem no onboarding, o que reforça o quanto a fluidez e personalização dessa jornada impactam diretamente o sucesso do produto. Por isso, buscamos continuamente evoluir essa experiência e esperamos ver como você aborda esse tipo de desafio.

<br>

## Escopo Esperado do Candidato

O candidato deverá implementar um fluxo funcional de onboarding, cobrindo desde o carregamento dinâmico da configuração até a apresentação de um resultado final consistente.

Espera-se que ele:
- Construa o fluxo de onboarding de ponta a ponta
- Modele corretamente os dados coletados ao longo do processo
- Demonstre domínio de organização, legibilidade e responsabilidade de código

A avaliação considera decisão técnica, não apenas funcionamento.

<br>

## Arquitetura e Organização de Código

O projeto já possui uma estrutura baseada em Clean Architecture, e o candidato deve respeitá-la.

Espera-se que ele:
- Separe claramente as camadas (`data`, `domain`, `presentation`)
- Utilize contratos (interfaces) para desacoplamento
- Centralize transformações, regras e validações em pontos previsíveis do código
- Utilize o padrão `Result` para tratamento de sucesso e falha nas operações assíncronas

Não é esperado reinventar a arquitetura, e sim operar corretamente dentro dela.

<br>

## Gerenciamento de Estado

O fluxo deve ser controlado por um único ponto de estado, responsável por:
- Progresso entre etapas
- Armazenamento dos dados coletados
- Validação antes de permitir o avanço
- Estado de finalização do onboarding

O uso de **BLoC** é esperado.

Boas decisões aqui incluem:
- Estados imutáveis
- Eventos claros e semanticamente objetivos
- Navegação e validação centralizadas no gerenciamento de estado

<br>

## Internacionalização

É esperado que o fluxo de onboarding esteja internacionalizado.

O candidato deverá:
- Implementar suporte a **português**, **espanhol** e **inglês**
- Garantir que textos exibidos ao usuário não estejam hardcoded
- Considerar a troca de idioma sem impacto estrutural no fluxo

<br>

## Tela de Resultados

A tela de resultados deve apenas apresentar informações já processadas, sem acoplar regras ou cálculos à UI.

O candidato deverá:
- Organizar as métricas de forma progressiva e legível
- Garantir coerência entre dados coletados e resultado exibido
- Demonstrar clareza visual mesmo sem referência de Figma

Mais importante que o layout é a consistência entre dados, regras e apresentação.

<br>

## Instruções de Implementação

### Objetivo

Exibir, de forma clara e progressiva, as seguintes métricas:
- IMC
- Faixa de Peso Saudável
- Nível de Treino
- Treinos Semanais
- Ingestão Calórica Diária
- Recomendação

<br>

## Regras de Cálculo e Exibição

### IMC (Índice de Massa Corporal)

- **Fórmula:** `peso / altura²`
- Exibir com **uma casa decimal**
- A **classificação textual é obrigatória**
- Nunca exibir apenas o valor numérico

**Classificação:**
- `< 18,5`: Abaixo do peso
- `18,5 – 24,9`: Normal
- `25 – 29,9`: Sobrepeso
- `≥ 30`: Obesidade

<br>

### Faixa de Peso Saudável

**Cálculo:**
- Mínimo: `18,5 × altura²`
- Máximo: `24,9 × altura²`

Regras:
- Deve ser exibida sempre como intervalo (**mínimo – máximo**)
- Independente de gênero

<br>

### Compatibilidade de Objetivo

A compatibilidade entre IMC e objetivo deve ser avaliada e refletida no resultado.

**Estados possíveis:**
- Recomendado
- Necessita Ajuste
- Não Recomendado

<br>

### Regras

**Ganhar peso**
- IMC `< 25`: Recomendado
- IMC `≥ 25`: Necessita Ajuste

**Perder peso**
- IMC `< 18,5`: Não Recomendado
- IMC `18,5 – 24,9`: Necessita Ajuste
- IMC `≥ 25`: Recomendado

**Manter peso**
- Qualquer IMC: Recomendado

<br>

### Recomendação de Treino

A frequência semanal de treinos deve ser exibida conforme o nível de experiência:
- **Iniciante:** 3 treinos por semana
- **Intermediário:** 4 a 5 treinos por semana
- **Avançado:** 5 a 6 treinos por semana

<br>

### Regras de Calorias

### Elegibilidade

Se a idade for menor que **18 anos**:
- O cálculo deve ser bloqueado
- O card de calorias **não deve ser exibido**

<br>

### Cálculo do BMR (Mifflin-St Jeor)

**Masculino:**
(10 × peso) + (6,25 × altura em cm) − (5 × idade) + 5

**Feminino:**
(10 × peso) + (6,25 × altura em cm) − (5 × idade) − 161

**Outro:**
Média entre as fórmulas masculina e feminina

<br>

### Fator de Atividade

- Iniciante: `1,3`
- Intermediário: `1,5`
- Avançado: `1,7`

<br>

### TDEE

- **Fórmula:** `BMR × fator de atividade`
- Arredondar para o **inteiro mais próximo**

<br>

### Ajuste por Objetivo

- Ganhar peso: `+300 kcal`
- Perder peso: `−300 kcal`
- Manter peso: `0 kcal`

**Regra de segurança:**
- Se o objetivo for perder peso e o valor final for inferior a **1200 kcal**:
  - Definir **1200 kcal**
  - Marcar o estado como **Necessita Ajuste**

<br>

## Texto de Recomendação

O texto de recomendação deve:
- Ter no máximo **três linhas**
- Não introduzir **novos números**
- Utilizar **linguagem não médica**
- Manter **tom consultivo**

A recomendação deve ser derivada exclusivamente de:
- Status do IMC
- Compatibilidade do objetivo
- Nível de experiência
- Gênero (apenas para ajuste de tom)

<br>

## Observações Finais

- A tela de resultados deve operar apenas como camada de apresentação
- A consistência entre regras, dados e exibição é critério central de avaliação
- O design visual não é objeto de avaliação nesta etapa

<br>

## Rastreamento de Eventos (Diferencial)

É considerado um diferencial implementar rastreamento de eventos ao longo do fluxo.

Especial atenção se o candidato:
- Disparar eventos a cada seleção do usuário
- Utilizar os identificadores definidos na configuração remota
- Utilizar ferramentas de tracking já implementadas no projeto

Isso demonstra maturidade em engenharia orientada a produto, não apenas execução técnica.

<br>

## O Que Será Avaliado Além do Funcional

- Capacidade de tomar decisões técnicas coerentes
- Clareza na separação de responsabilidades
- Disciplina arquitetural
- Leitura correta do problema, sem overengineering

Não é esperado um projeto “perfeito”, mas sim bem estruturado, previsível e consciente.

<br>

## Observações Importantes

- O fluxo deve ser carregado dinamicamente
- Não é permitido pular etapas
- Inputs devem ser validados antes de avançar
- O estado deve sobreviver a todo o onboarding
- A solução deve ser sustentável, não apenas funcionar

<br>

## Entregável

### Tempo para Entrega
- **48 horas** após receber este case para resolução

### Ao final você deverá entregar:
- Link para o repositório do projeto, contendo a implementação completa
- Arquivo **APK** gerado a partir da mesma versão do código enviado

<br>

## Links Importantes

- **Figma:**  
- **Github:**  
