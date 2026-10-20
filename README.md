# Simulación de movimiento browniano en 2D

Simulación en MATLAB del movimiento de una partícula grande inmersa en un
fluido de moléculas mucho más pequeñas, usando la ecuación de Langevin (1908):

    m · dv/dt = −b·v + F_b(t)

donde −b·v es la fuerza de rozamiento viscoso y F_b(t) es la fuerza aleatoria
debida a los choques con las moléculas del fluido.

## ¿Qué hace?

El script compara dos casos en los ejes X e Y:

- **Problema A (determinista):** se resuelve analíticamente la ecuación sin
  fuerza aleatoria. La partícula parte con una velocidad inicial y se frena por
  el rozamiento:
  `x(t) = x₀ − v₀·(m/b)·(e^(−b·t/m) − 1)`
- **Problema B (estocástico):** se integra numéricamente la ecuación
  (método de Euler) con una fuerza aleatoria en cada eje, de módulo uniforme
  entre `fbMin` y `fbMax` y signo aleatorio, reproduciendo la trayectoria
  errática característica del movimiento browniano.

Se generan cuatro gráficas: la trayectoria completa de cada caso y una
animación de la partícula recorriendo ambas trayectorias.

## Parámetros configurables

| Variable | Descripción |
|---|---|
| `secs` | Segundos de simulación |
| `tick` | Paso de tiempo entre eventos |
| `slowmo` | Factor de ralentización de la animación |
| `m`, `b` | Masa de la partícula y coeficiente de rozamiento |
| `fbMin`, `fbMax` | Rango de la fuerza aleatoria |
| `voax`, `voay` | Velocidad inicial en el problema A |
| `rangeOfVision` | Límites de los ejes de las gráficas |


## Notas

- La simulación está pensada como un caso concreto ("hardcode") para ilustrar
  el comportamiento general.
- Incluye una función opcional `crearcaja(d)`, comentada, para encerrar la
  partícula entre paredes imaginarias.

## Requisitos

Estable en MATLAB 2023b.
