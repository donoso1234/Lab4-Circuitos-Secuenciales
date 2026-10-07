# Laboratorio 4 - Circuitos Secuenciales

**Pontificia Universidad Javeriana**  
**Facultad de Ingeniería**  
**Ingeniería Electrónica**  
**Asignatura:** Diseño de Sistemas Digitales  
**Profesor:** Sebastián Mariño  

## Integrantes

- Sebastián Donoso
- Sara Martínez
- Juan Felipe González

## Descripción

Este repositorio contiene los archivos VHDL desarrollados para el **Laboratorio No. 4: Circuitos Secuenciales - Flip-Flops**.

La práctica se enfocó en el diseño, simulación e implementación de contadores digitales de 4 bits sobre una tarjeta Terasic DE0. Se trabajó con un contador ascendente, un contador descendente y un contador con valor máximo configurable mediante interruptores.

## Implementaciones realizadas

- Flip-flop tipo D con `reset` y `enable`.
- Contador binario ascendente de 4 bits.
- Testbench para simulación del contador ascendente en ModelSim.
- Decodificador hexadecimal a display de 7 segmentos.
- Implementación física del contador ascendente en la DE0.
- Contador binario descendente de 4 bits.
- Implementación física del contador descendente en la DE0.
- Contador con valor máximo configurable mediante `SW[3:0]`.
- Implementación física del contador configurable en la DE0.

## Archivos principales

| Archivo | Descripción |
|---|---|
| `01_my_dff.vhd` | Implementación del flip-flop tipo D con `reset` y `enable`. |
| `02_counterGates.vhd` | Contador ascendente síncrono de 4 bits construido a partir de flip-flops D. |
| `03_tb_counterGates.vhd` | Testbench utilizado para verificar el contador ascendente en ModelSim. |
| `04_hex7seg.vhd` | Decodificador hexadecimal de 4 bits a display de 7 segmentos. |
| `05_top_counter.vhd` | Módulo superior para implementar el contador ascendente en la DE0. |
| `06_counterDown.vhd` | Contador descendente de 4 bits. |
| `07_top_counter_down.vhd` | Módulo superior para implementar el contador descendente en la DE0. |
| `09_counterMax.vhd` | Contador ascendente con valor máximo configurable. |
| `10_top_counter_max.vhd` | Módulo superior del contador con máximo configurable. |

## Funcionamiento general

### Contador ascendente

El contador recorre los valores:

`0 → 1 → 2 → ... → E → F → 0`

Cada pulsación utilizada como reloj produce un nuevo estado del contador.

### Contador descendente

El contador recorre:

`F → E → D → ... → 2 → 1 → 0 → F`

El estado inicial después del `reset` es `F`.

### Contador con máximo configurable

Los interruptores `SW[3:0]` permiten definir el valor máximo de conteo. Por ejemplo, si se selecciona:

`SW = 0100`

el contador realiza la secuencia:

`0 → 1 → 2 → 3 → 4 → 0`

También se probaron otros valores máximos como `1`, `2` y `F`.

## Simulación

El testbench genera una señal de reloj de **10 ns de periodo** y mantiene el `reset` activo durante los primeros **20 ns**.

Después de desactivar el `reset`, el contador empieza a incrementar su salida en cada flanco ascendente del reloj.

## Evidencia experimental

El funcionamiento de los diferentes contadores implementados sobre la tarjeta Terasic DE0 puede consultarse en el siguiente video:

https://www.youtube.com/shorts/R4m93gQP3-g

## Nota

El código correspondiente a un módulo duplicado en el archivo original del laboratorio no se incluye nuevamente en este repositorio, ya que corresponde a la misma entidad `top_counter_down`.

---

**Laboratorio 4 - Diseño de Sistemas Digitales**  
Pontificia Universidad Javeriana  
2026
