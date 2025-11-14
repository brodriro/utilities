# 🧠 Construcción de Agentes Efectivos y Patrones de Diseño con LLMs

> Curso práctico sobre agentes inteligentes, flujos de trabajo y orquestación de modelos de lenguaje a gran escala (LLMs).  

---

Resumen rápido
- Un agente IA (agentic AI) es un programa en el que las salidas de un LLM controlan el flujo de trabajo: toma decisiones, usa herramientas y planifica acciones.
- Dos familias de diseño: flujos de trabajo (workflows) —ruta fija y predecible— y sistemas agénticos —dinámicos, abiertos y adaptativos—.
- Patrones clave: prompt chaining, routing, parallelization, orchestrator-worker, evaluator-optimizer.
- Usa recursos (contexto/memoria) y herramientas (APIs/acciones) para que el agente actúe.
- Monitorización y guardarraíles son imprescindibles.

---

## 1. ¿Qué es un agente IA?
Definición práctica: programas donde las salidas de un LLM controlan el flujo de trabajo y la interacción con herramientas externas.

Cinco características clave:
1. Múltiples llamadas al LLM (iteración / razonamiento paso a paso).  
2. Capacidad de usar herramientas (APIs, DBs, ejecutores).  
3. Entornos que coordinen varios LLM.  
4. Planificadores que crean y ajustan subtareas.  
5. Autonomía operativa (mínima intervención humana).

Ejemplo breve: agente de reservas de viaje
- Usuario: "Quiero un vuelo a Lima el 20 de diciembre, prefiero mañana".
- Flujo: LLM analiza → usa buscador → consulta disponibilidad → reserva asiento → confirma.
- Aquí hay múltiples llamadas, herramientas y autonomía.

---

## 2. Patrones esenciales de diseño (qué son y cuándo usarlos)

### 1) Encadenamiento de prompts (Prompt Chaining)
Propósito: descomponer problemas complejos en pasos secuenciales manejables.  
Ejemplo: Generar un informe — LLM A crea índice → LLM B redacta secciones → LLM C revisa estilo.

Imagen (preview):
![Prompt Chaining - ejemplo visual](https://miro.medium.com/v2/resize%3Afit%3A2000/1%2APhqVAVg77D3K4XCtfkXN0w.png)

### 2) Enrutamiento (Routing)
Propósito: un LLM decide qué modelo/componente especializado manejará una petición.  
Ejemplo: Enrutador LLM clasifica consultas en "soporte técnico", "facturación", "ventas".

Imagen (preview):
![Routing - diagrama de enrutamiento](https://www.shutterstock.com/image-vector/ai-routing-workflow-shows-input-600w-2623383451.jpg)

### 3) Paralelización (Parallelization)
Propósito: dividir trabajo en subtareas que corren simultáneamente para mejorar throughput.  
Ejemplo: Análisis de sentimiento de 1.000 comentarios dividido en lotes.

> Nota: usa este patrón cuando la tarea sea fácilmente *shardable* y la combinación de resultados sea sencilla.

### 4) Orquestador–Trabajador (Orchestrator–Worker)
Propósito: un LLM orquestador descompone y asigna tareas a varios "trabajadores" (LLMs o servicios).  
Ejemplo: Orquestador define subtareas: investigar, escribir, validar; trabajadores ejecutan.

Imagen (preview):
![Orchestrator - Worker](https://bootcamptoprod.com/wp-content/uploads/2025/06/Orchestrator-Workers-Workflow-Pattern-Flow.jpg)

### 5) Evaluador–Optimizador (Evaluator–Optimizer)
Propósito: ciclo de generación y evaluación para mejorar exactitud y estilo.  
Ejemplo: Generador produce texto → Evaluador revisa coherencia/factualidad → Optimizer reescribe.

Imagen (preview):
![Evaluator - Optimizer](https://thumbs.dreamstime.com/b/el-flujo-de-trabajo-optimizador-evaluador-ia-muestra-proceso-con-iconos-para-del-y-salida-generador-entrada-diagrama-esquema-379289567.jpg)

¿Por qué usar patrones?
- Modularidad, mantenibilidad, escalabilidad y facilidad para depurar.

---

## 3. Patrones de agentes vs. patterns de workflow (comparativa)
- Workflows:
  - Camino fijo, predecible; ideal para tareas conocidas y repetitivas (ej. generar informe mensual).
- Agentes:
  - Camino no definido de antemano; auto-adaptativos; mejor para tareas abiertas e inciertas (ej. monitor de mercado que decide trades).
- Riesgos de agentes: coste impredecible, variabilidad en calidad/latencia.  
  Mitigación: guardarraíles, métricas, monitorización y límites de ejecución.

Imagen (preview) — comparación:
![Agente vs Workflow 1](https://miro.medium.com/v2/resize%3Afit%3A1400/0%2ATmrYdy5fYlzQn8DY.png)
![Agente vs Workflow 2](https://cdn-uploads.huggingface.co/production/uploads/65a7901f3bb0e70b41c48805/2JbnTRtSaOz12onm-cyg9.png)

---

## 4. Orquestación de múltiples LLMs (cómo y por qué)
Modelos y roles sugeridos:
- GPT‑4: razonamiento complejo y verificación.  
- Claude (Anthropic): revisión, seguridad y explicabilidad.  
- Gemini: borradores rápidos / coste-efectivo en ciertos límites.  
- DeepSeek: opciones de bajo coste y despliegue local.  
- Grok: inferencias rápidas.  
- Oyama: plataforma para ejecutar modelos locales.

Ejemplo de orquestación de contenido:
1. Gemini genera primer borrador.  
2. Claude Sonet revisa estilo y añade referencias.  
3. GPT‑4 valida datos sensibles (ej. clínicos).

Imagen (preview):
![Comparativa de modelos](https://www.cursor-ide.com/blog/gpt-41-guide-2025/model-comparison.png)

Consideraciones clave:
- Coste vs rendimiento.  
- Latencia y requisitos en tiempo real.  
- Especialización por rol.  
- Compatibilidad de APIs, límites legales y privacidad.  
- Usar modelos locales si la regulación/datos lo requieren.  
- Consultar leaderboards como Bellum AI para benchmarking.

---

## 5. Recursos vs Herramientas (diferencia práctica)
- Recursos: contexto, memorias, documentos (mejoran la calidad de respuestas).  
- Herramientas: acciones ejecutables (consultar API, enviar email, ejecutar código).

Flujo típico agente+herramienta:
1. LLM decide acción.  
2. Sistema ejecuta la herramienta.  
3. Resultado vuelve al LLM.  
4. LLM produce respuesta final.

Ejemplo (chatbot de inventario):
- Recurso: catálogo actualizado (RAG).  
- Herramienta: `ConsultaInventario(productoID)`.  
- Resultado: "Quedan 42 unidades".

Imagen (preview):
![Recursos vs Herramientas](https://lollypop.design/wp-content/uploads/2025/06/AutoGen-Popular-AI-Agent-Framework.webp)

---

## 6. Marcos (frameworks): simplicidad vs. potencia
- Sin marco: llamadas directas a APIs (control total).  
- Marcos ligeros: OpenAI Agents SDK (ligero), Cray (low-code).  
- Marcos avanzados: Landgraf, Autogen (más potencia, curva de aprendizaje mayor).

Imagen (preview OpenAI Agents SDK):
![OpenAI Agents SDK](https://humanloop.com/blog/openai-agents-sdk/image-2.png)

Recomendaciones:
- Equipo pequeño / comienzo: API directo o marco ligero.  
- Proyecto grande: considerar frameworks robustos.  
- Entender el "código bajo el capó" del framework.

---

## 7. Diseño práctico y checklist para desarrolladores/integradores
Antes de construir:
- Define la meta del agente.  
- Decide: workflow fijo o agente autónomo.  
- Identifica herramientas y recursos.  
- Selecciona modelos por rol.  
- Prototipo: mínimo agente viable (MAV).

Durante implementación:
- Límites (timeouts, max pasos, token budgets).  
- Monitorización: coste, latencia, tasa de errores, métricas de calidad.  
- Logs estructurados y salidas estandarizadas (JSON).  
- Evaluación automática y humana para casos críticos.

Despliegue y operación:
- Guardarraíles: validaciones de factualidad, filtros de seguridad.  
- Fallbacks: rutas alternativas si falla un modelo/herramienta.  
- Auditoría y trazabilidad: registrar acciones del agente.

Consejos rápidos:
- Documenta prompts, versiones de modelos y patrones.  
- Itera con pruebas A/B para tradeoffs coste/precisión.

---

## 8. Mini-ejemplo práctico (resumido)
Objetivo: Chatbot de inventario  
- Recurso: BD de productos (RAG).  
- Herramienta: `ConsultaInventario(productoID)`.  
- Patrón: Orquestador–Trabajador + Evaluador–Optimizador.  
- Flujo: Usuario → enrutador → ejecuta herramienta → LLM genera → evaluador comprueba → responde.

---

## 9. Conclusión y siguiente paso en el curso
- Empieza con workflows, añade herramientas y luego autonomía controlada.  
- Siguiente sesión: laboratorio práctico sobre integración de herramientas y orquestación multi-LLM; crearás un "alter ego digital".
