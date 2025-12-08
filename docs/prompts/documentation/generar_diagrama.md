# TAREA: Generar un Diagrama de Flujo Detallado

Actúa como un experto en visualización de procesos de software. Tu tarea es convertir la siguiente descripción de flujo en formato Markdown a un diagrama de flujo utilizando la sintaxis de **Mermaid.js**.

**Descripción del Flujo (Entrada):**
[Aquí se pegaría el contenido completo del archivo Markdown generado, como "TefTransferenciaTerceroPresenter_Flow.md"]

**Instrucciones para la Generación del Diagrama:**

1.  **Sintaxis:** Utiliza exclusivamente la sintaxis `graph TD` (Top-Down) de Mermaid.js.

2.  **Representación de Nodos:**
    *   **Inicio/Fin:** Usa nodos con bordes redondeados `(Texto)` para los puntos de inicio y fin del flujo.
    *   **Acciones del Sistema/Presenter:** Usa nodos rectangulares `[Texto]` para las acciones internas, como inicializaciones, procesamiento de datos o lógica interna.
    *   **Casos de Uso/Llamadas Externas:** Usa nodos con forma de base de datos `[(Texto)]` para representar llamadas a `UseCases`, `Repositories` o servicios externos.
    *   **Decisiones/Condiciones:** Usa nodos de rombo `{Texto}` para las bifurcaciones lógicas (ej. "¿Transferencia Duplicada?", "¿Validación OK?").
    *   **Interacciones del Usuario:** Usa nodos con forma de paralelogramo `[/Texto/]` para representar acciones directas del usuario, como "Clic en 'Transferir'" o "Cambia monto".
    *   **Resultado en UI:** Usa nodos hexagonales `{{Texto}}` para representar cambios visibles en la interfaz de usuario, como "Mostrar Loader", "Ocultar Loader" o "Mostrar Error en Pantalla".

3.  **Conexiones y Etiquetas:**
    *   Conecta los nodos con flechas para mostrar la secuencia del flujo.
    *   Para las flechas que salen de un nodo de decisión (rombo), etiqueta la conexión para indicar la condición. Ejemplo: `-->|Sí|` y `-->|No|`, o `-->|Éxito|` y `-->|Error|`.

4.  **Detalle y Claridad:**
    *   El diagrama debe reflejar todas las rutas principales descritas en el texto: el flujo de éxito, los flujos de error y las bifurcaciones condicionales.
    *   Asegúrate de que cada paso importante del documento Markdown tenga su correspondiente nodo en el diagrama.
    *   Agrupa visualmente las sub-rutinas si es posible, por ejemplo, usando `subgraph`. Por ejemplo, puedes crear un `subgraph "Validación de Transferencia"` que contenga todos los pasos de esa fase.
