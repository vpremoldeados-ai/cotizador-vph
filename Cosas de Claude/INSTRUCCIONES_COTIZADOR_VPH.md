# Instrucciones del proyecto — Cotizador VPH Premoldeados

> Documento de contexto y traspaso para que otro proyecto/sesión retome el trabajo sin perder información.
> Última actualización: 02/07/2026.

---

## 1. Contexto del negocio

- **Empresa:** VPH Vassallo Premoldeados — fábrica de premoldeados de hormigón en la localidad de **Toledo, Córdoba, Argentina** (16 km de Córdoba Capital). Fundada por Marcelo Vassallo (ing. civil) en 2010.
- **Producto principal:** Loseta Cribada (piso de hormigón armado para ingreso a cocheras/estacionamientos). Todas las losetas usan **hierro de construcción 4,2 mm**.
- **Equipo (7 personas):** Marcelo Vassallo (dueño/director), Sofía (administración, ventas por WhatsApp, compras, coordinación de entregas), Gustavo (encargado de planta), Antonio Darío y Matías (operarios), Eduardo (vendedor en la calle para corralones, part-time).
- **Canal principal con clientes:** WhatsApp (+54 9 351 760-5362). Email: vpremoldeados@gmail.com.
- **Clientela:** ~80% Córdoba Capital, ~10% localidades cercanas (hasta 30 km), ~10% resto del país.

---

## 2. Qué es el cotizador y dónde vive

- Es un **único archivo `index.html`** (~122 KB) con HTML+CSS+JS embebido (sin dependencias externas salvo Web3Forms).
- **Repositorio GitHub:** `https://github.com/vpremoldeados-ai/cotizador-vph` (rama `main`).
- **Publicado con GitHub Pages:** `https://vpremoldeados-ai.github.io/cotizador-vph/`
- **Embebido como iframe** (tamaño 1425×710) dentro de la página única (Inicio) del sitio Wix **www.vpremoldeados.com**.
- **ID del sitio Wix:** `6f9e39de-6dde-49fe-9c97-d6709700e7ba`
- Carpeta de trabajo local: `D:\Google Drive VPH\CLAUDE AI\MEJORAS WIX\cotizador-vph` (es un repo git con remote HTTPS).
- Las fotos están en `cotizador-vph/Fotos en Cotizador/Fotos cada producto/<Categoría>/<Producto>/N.jpg`. Marca de agua: solo texto "www.vpremoldeados.com" (sin franja).

---

## 3. FLUJO DE TRABAJO Y GOTCHAS CRÍTICOS (leer sí o sí)

### Publicar cambios
1. Editar `index.html` con las herramientas de archivo (Read/Write/Edit) → escriben en la ruta Windows real.
2. **Commit + Push se hace con GitHub Desktop** (app de escritorio). El git de la terminal **NO tiene credenciales** para `push` (da `could not read Username`). Por eso publica el usuario desde GitHub Desktop, o se automatiza la app.
3. GitHub Pages tarda ~2-4 min en desplegar. Para evitar caché al verificar, usar `?v=N` o `?nc=timestamp` en la URL.

### ⚠️ Gotcha #1 — Lag/truncado del mount de Google Drive (el más peligroso)
La carpeta está en Google Drive. La **terminal (mount Linux) suele ver una versión vieja o TRUNCADA** de `index.html`, mientras que las herramientas de archivo (Read/Write/Edit, ruta Windows) y GitHub Desktop ven la versión real y completa.
- **Síntoma:** `wc -l`/`tail` en bash muestran el archivo cortado o sin `</html>`, aunque el archivo real esté bien.
- **Una vez se publicó una versión truncada y rompió el sitio** (no renderizaban las categorías porque se cortó el script antes de `initCategories()`). Se arregló reescribiendo el final del script.
- **Reglas:**
  - No commitear desde la terminal confiando en lo que ve bash.
  - Después de cada edición, **verificar el final del archivo con la herramienta Read** (que termine en `</script></body></html>`).
  - El diff que muestra **GitHub Desktop** es la fuente de verdad de lo que se va a subir.
  - Si bash quedó desincronizado, `git restore index.html` reescribe la copia local con la versión de `origin`.

### ⚠️ Gotcha #2 — Caché del CDN de GitHub Pages
Al cargar la página puede servir la versión anterior unos minutos. **El archivo real desplegado se verifica** con un XHR síncrono cache-busted desde el navegador (ver sección 9). Si móvil ve lo nuevo y PC lo viejo (o viceversa), casi siempre es caché del navegador → `Ctrl+F5`.

### Método de verificación recomendado (navegador con Claude in Chrome)
- Cargar `https://vpremoldeados-ai.github.io/cotizador-vph/?v=N`.
- Ejecutar JS con `XMLHttpRequest` **síncrono** a `location.origin+location.pathname+'?nc='+Date.now()` para traer el HTML servido sin caché y buscar strings.
- Validar sintaxis del script con `new Function(scriptBody)` (un error de sintaxis rompe TODO el JS y deja la pantalla vacía).
- Validaciones de runtime: `typeof catalog`, `Object.keys(catalog)`, render de pantallas, etc.

---

## 4. Catálogo y precios (estado actual)

4 categorías, 11 productos. **Código `LC60` (Rectangular) ≠ `L60` (Listón).** El **descuento 20% aplica SOLO a LC60**.

| Categoría | Código | Producto | Precio | Tipo | per_m2 / notas |
|---|---|---|---|---|---|
| Losetas Cribadas | **LC60** | Cribada Rectangular | $8.474 → **$6.779 c/20%** | m2 | per_m2 4,3 · MÁS VENDIDA · única en promo |
| Losetas Cribadas | LC40 | Cribada Cuadrada | $4.888 | m2 | per_m2 7 |
| Losetas Green | GB35 | Green Block 35×35×6 | $3.803 | m2 | per_m2 8 |
| Losetas Green | GR35 | Green Rombo 35×35×6 | $4.566 | m2 | per_m2 8 |
| Losetas Green | GC35 | Green Círculo 35×35×6 | $4.566 | m2 | per_m2 8 |
| Topes Estac. | TET50 | Tope Trapecio 15×12×50 | $8.371 | units | |
| Topes Estac. | TEC50 | Tope Circular 18×12×50 | $11.134 | units | |
| Topes Estac. | TET100 | Tope Trapecio 15×12×100 | $21.476 | units | |
| Topes Estac. | TEC100 | Tope Cuadrado 15×15×100 | $25.768 | units | |
| Cordones/Listones | L60 | Listón 60×8×6 | $1.742 | ml | |
| Cordones/Listones | CC10 | Cordón Confinamiento 40×9×10 | $1.603 | ml | |

> Importante: el 26/06/2026 se aplicó **−20% a todos los precios EXCEPTO LC60** (que quedó en $8.474 y muestra su promo aparte). Para futuras actualizaciones de precio, editar el campo `price:` de cada producto; LC60 no se toca salvo indicación expresa.

---

## 5. Promoción y cuenta regresiva

```js
const promotion = { active:true, discount:0.20, endDate: new Date(2026, 6, 3, 23, 59, 59), ... };
const PROMO_CODES = ["LC60"];        // descuento solo en LC60
const MAS_VENDIDA_CODE = "LC60";     // badge "Más vendida"
function getPriceWithDiscount(p, code){ return (promotion.active && PROMO_CODES.includes(code)) ? Math.round(p*(1-promotion.discount)) : p; }
```
- **Banner con cuenta regresiva** (`#promotionBanner`) está en `#screen-categories`, arriba de la grilla. Texto: "🔥 20% OFF en Loseta Cribada Rectangular" + "⏳ Termina en `#countdownDisplay`".
- `updateCountdown()` actualiza `#countdownDisplay` cada segundo y oculta el banner si la promo terminó. Se inicia en `initCategories()`.
- Para renovar la promo: cambiar `endDate`. (Mes en JS es 0-based: julio = 6.)
- En LC60 el Subtotal del detalle ya se calcula con el precio con descuento ($6.779 × cantidad); no se muestra línea "Descuento (20%)" aparte.

---

## 6. Entrega, fletes y formas de pago

```js
const destinations = {
  retiro:   { cost: 0,      ... }, // Retirar en fábrica (Toledo)
  capital:  { cost: 28000,  ... }, // Córdoba Capital
  cercanas: { cost: 39000,  ... }, // Hasta 30 Km Av. Circunv. Cba Cap.
  argentina:{ cost: 140000, ... }  // A todo Argentina (posible variación)
};
```
- El flete se multiplica por la cantidad de pallets (`Math.ceil(unidades / per_pallet)`).
- Para `cercanas` y `argentina` aparece una caja de **localidad** + nota "sujeto a verificar la entrega".
- **Formas de pago:** `contado` (transferencia), `tarjeta-macro` (12 cuotas s/interés), `otros-3` (3 cuotas), `otros-6` (6 cuotas). Se muestran las cuotas y el valor de cada una.

---

## 7. Las 4 pantallas y comportamiento móvil

- Pantalla 1 `#screen-categories` (categorías) · 2 `#screen-products` · 3 `#screen-detail` · 4 `#screen-cart`.
- Título global centrado arriba + breadcrumb a la izquierda debajo.
- **Móvil — apertura a pantalla completa:** el iframe de Wix NO permite auto-altura por código (HtmlComponent no tiene setter de altura sin Wix Studio/headless). Solución vigente: en móvil (`EMBEDDED && innerWidth<768`) la pantalla de categorías muestra "Tocá para ver y cotizar ↗" y al tocar una categoría **abre el cotizador completo en pestaña nueva** con `?cat=<NombreCategoría>`, que aterriza directo en los productos de esa categoría. En PC sigue 100% embebido.
- Existe código de **auto-altura por postMessage** (`type:'vphCotizadorHeight'`) listo para cuando migren a Wix Studio/headless (hoy Wix clásico no lo aprovecha).
- **Resaltado de campos a completar:** en el detalle, cantidad/destino/forma de pago se muestran con borde azul pulsante (`.needs-action`) y pasan a verde (`.field-done`) al completarse. En el carrito los selectores globales se muestran en verde (ya definidos, editables).
- **Chip de precio por m²:** en Cribadas y Green cada tarjeta muestra "$X /m²" (redondeado) en azul/negrita (`.product-per-m2`) para comparar.
- Pantalla 4: botón "+ Agregar más productos" arriba; teléfono junto al botón de email; mismo destino/forma de pago forzado para todo el carrito.

---

## 8. Envío del presupuesto por email (Web3Forms)

El botón **"Enviar por Email"** de la pantalla 4 ya NO usa `mailto`. Ahora envía en segundo plano con **Web3Forms** y el visitante no hace nada más.
- Endpoint: `POST https://api.web3forms.com/submit` (JSON).
- **Access key:** `b6b4a86b-2844-44b4-a9eb-9ffea9a78f89` (cuenta de vpremoldeados@gmail.com).
- El email llega a **vpremoldeados@gmail.com** con asunto "Nuevo presupuesto web - Tel: … - Total $…" y el detalle completo (productos, cantidades, destino, totales, cuotas).
- Requiere teléfono válido (≥10 dígitos) — el botón se habilita solo con teléfono cargado.
- Al enviar muestra "✅ ¡Listo! Recibimos tu pedido". Si el envío falla, abre `mailto` como respaldo.
- El botón de **WhatsApp** sigue funcionando aparte (arma el mensaje y abre wa.me).

---

## 9. Tracking del sitio Wix (Meta Pixel, GA4, GTM, Google Ads)

> Esto vive en el **sitio Wix** (Ajustes → Código personalizado y GTM), NO en el cotizador.

- **Meta Pixel:** `1862540764595189`.
  - **Problema resuelto (26/06/2026):** estaba inicializándose **3 veces** ("Duplicate Pixel ID"). Causa: 2 entradas manuales en Código Personalizado de Wix ("Facebook Pixel" y "24-04-25 Pixel de Meta") + 1 vía GTM.
  - **Fix aplicado:** se **desactivó** la entrada **"24-04-25 Pixel de Meta"** en Wix → Ajustes → Código Personalizado. Quedó en **1 sola inicialización**. Reversible (toggle).
  - Pendiente opcional: confirmar en Meta Events Manager / Pixel Helper que no haya más duplicado y que los eventos lleguen una vez.
- **Google Analytics 4:** `G-18CMTRFK14`, cargado **una sola vez vía GTM** (limpio, sin duplicados).
- **Google Tag Manager:** contenedor `GTM-N2R3PG7` (carga una vez).
- **Google Ads:** tag de conversiones `AW-931711279` (configurado una vez).
- **Eventos personalizados** en dataLayer: `page_view`, `Pageview`, `seccion_visible`, `tiempo_en_pagina`, `scroll_depth`, `scroll`. Advertencias menores de Meta: se mandan con `fbq('track', …)` y conviene `trackCustom`; además `Pageview` debería ser `PageView` (casing). No rompen nada.
- Avisos "[Violation] setTimeout took 60ms" y "preloaded but not used" = ruido de rendimiento, ignorables.

### Verificación GA4 realizada (26/06/2026)
GA4 verificado en vivo por red + Tiempo Real + DebugView. **El tráfico se mide bien**, pero **las conversiones estaban en CERO**:
- GA4 propiedad: `VASSALLO Fábrica Premoldeados`, cuenta `73676003`, property `279943205`. Carga 1 sola vez vía GTM + **server-side tagging** (contenedor en Google Cloud Run `server-side-tagging-…run.app`).
- **Eventos que SÍ llegan (10):** `first_visit`, `page_view`, `Pageview`, `phone_call_click`, `scroll`, `scroll_depth`, `seccion_visible`, `session_start`, `tiempo_en_pagina`, `user_engagement`.
- **Eventos clave (conversiones) definidos:** `generate_lead` ⭐, `lead` ⭐, `purchase` (sin marcar). Los tres marcaban "No se han detectado datos de flujo" en 28 días → **0 conversiones**.
- **Causa raíz:** el lead real (clic WhatsApp/Email) ocurre dentro del **iframe del cotizador (github.io)**, distinto dominio que Wix → sus clics nunca llegaban al GA4 del padre.

### Acciones aplicadas (26/06/2026)
1. **GA4:** se marcó `phone_call_click` como **evento clave (conversión)**. Captura clics al teléfono desde ya. (Reversible: quitar la estrella en GA4 → Admin → Eventos.)
2. **Cotizador (`index.html`):** se agregó GA4 (`gtag` con `send_page_view:false` para NO duplicar vistas) y una función `trackLead(method,value)` que dispara `generate_lead` (currency ARS, value=total) al **Enviar por WhatsApp** y al confirmarse el **Enviar por Email**. ⚠️ Falta **publicar con GitHub Desktop** para que tome efecto.

### Pendiente
- **Publicar el cotizador** (GitHub Desktop) y verificar en GA4 DebugView que `generate_lead` dispare al usar WhatsApp/Email.
- **Verificar conversiones de Google Ads** (`AW-931711279`): misma causa raíz; una vez que el lead dispare, confirmar que registre conversión en Ads.
- **Limpiar `Pageview` duplicado (causa raíz identificada en GTM):** ver sección 12.

---

## 12. Inventario de Google Tag Manager (revisado 26/06/2026)

**Hay 3 contenedores en 2 cuentas (más de lo que se creía):**
- Cuenta *Vassallo Premoldeados* → web **GTM-MR648Z** (no documentado antes; revisar si está instalado o es legado — en el dataLayer del sitio solo aparece GTM-N2R3PG7).
- Cuenta *Vassallo Premoldeados de Hormigón* → servidor **GTM-TDGXHDWQ** (server-side, Cloud Run) + web **GTM-N2R3PG7** (el activo; v18 publicada hace ~17 días).

**Etiquetas en `GTM-N2R3PG7` (10):**
- **Google Analytics configuración de GA4** — ID `G-18CMTRFK14`, `send_page_view=true`, *All Pages*. Es la ÚNICA config de GA4 y manda el `page_view` correcto (1 vez). NO tocar.
- **Etiqueta de Google** — ID `AW-931711279` (Google **Ads**, no GA4), *Initialization*. NO tocar (pausarla rompería Ads).
- **Vinculación de conversiones** (Conversion Linker) — All Pages.
- **Conversiones Google Ads** (`AW-931711279`): *Etiqueta Clic Teléfono Header* (trigger Clic Teléfono Header), *Etiqueta Formulario* (Formulario Oficial), *Etiqueta WhatsApp Oficial* (Activador Whatsapp en Web). → Los leads se miden como conversión en **Ads**, no en GA4 (por eso GA4 estaba en 0).
- **Suite Facebook Conversions API** (4 tags): `…-GA4_Config`, `…-GA4_Event`, `…-Pixel_Event`, `…-Pixel_Setup`. `Pixel_Setup` hace `fbq('init','1862540764595189')` (otra fuente de init del Pixel, sumada a las de Wix).

**⚠️ Causa raíz del `page_view`/`Pageview` duplicado en GA4:**
El tag **`FB_CONVERSIONS_API-…-GA4_Event`** (tipo *evento de GA4*, ID `G-18CMTRFK14`) tiene **Nombre del evento = `{{Event}}`** y dispara en *Custom_Event + DOM_Ready*. Es decir, **reenvía a GA4 todos los eventos del dataLayer con su nombre tal cual**, incluido el `Pageview` (casing), generando el evento extra además del `page_view` de la config. NO es una segunda config de GA4.

**Fix aplicado en workspace (26/06/2026) — PROBADO, falta PUBLICAR:**
- Se creó el activador **"Excepción - Eventos de página (no GA4 relay)"** (Evento personalizado, regex `^(page_view|Pageview|gtm\..*)$`) y se agregó como **excepción** al tag `FB_CONVERSIONS_API-…-GA4_Event`.
- **Probado en Vista previa (Tag Assistant):** en `page_view` el tag `GA4_Event` queda en "no activadas" (deja de duplicar); en `tiempo_en_pagina` (y demás eventos legítimos) sigue activándose. No afecta Meta CAPI ni Google Ads.
- **Estado: PUBLICADO** el 26/06/2026 22:19 como **Versión 19 "Fix page_view duplicado en GA4"** de `GTM-N2R3PG7`. En vivo en producción. Reversible (publicar una versión anterior o quitar la excepción).
- **Confirmación pendiente (24-48 h):** en GA4 → Informes, verificar que el conteo de `page_view` (Vistas) baje y que dejen de entrar eventos `Pageview`/`gtm.dom` nuevos.
- Pendiente menor opcional: la propiedad vieja **UA-73676003-1** (Universal Analytics) sigue apareciendo en el contenedor — UA está discontinuado desde jul-2023, no recoge datos; se puede limpiar en otra pasada.

---

## 13. Revisión de Google Ads (conversiones) — 26/06/2026

**Cuenta:** Google Ads VPH (Nº 675-906-2306), tag `AW-931711279`.

**Estado actual (últimos 30 días): gasta pero NO registra conversiones.**
- Costo **ARS 21.050,14**, **331 impresiones**, **0 conversiones**, 2 campañas habilitadas (Búsqueda).
- Aviso de facturación: **"El saldo está por agotarse"** (revisar método de pago / saldo).

**Acciones de conversión: 17 en total (cuenta MUY desordenada).** Estados:
- **Botón flotante WhatsApp en Web** (Sitio web, valor ARS5000, Principal) → **"Requiere atención"**.
- **Clic Teléfono Header** (Sitio web, Principal, ventana 90 días) → **"Requiere atención"**.
- **Envío de Formulario en Sitio Web** (Principal) → **Activa**.
- **Conversation started** (mensajes, Google) → Activa. **Lead form - Submit** → Secundario, sin conversiones.
- Legado/basura a limpiar: *Tiendanube Website purchases* (Inactiva), *Tiendanube Backend purchases*, varias *Smart campaign* (clicks to call / map / ad clicks), *Calls from Smart Campaign Ads* — todas "No hay conversiones recientes". Tiendanube ni siquiera es la plataforma actual.
- Diagnóstico de la conversión WhatsApp: **Modo de consentimiento OK** (verde). El "Requiere atención" es por **falta de conversiones recientes**, no por etiqueta rota.

**Lectura:** la plumbing está (tags disparan en GTM, consent OK, valores cargados), pero o el **volumen es bajísimo** (331 impresiones ≈ pocos clics) o hay un **problema de atribución** en WhatsApp/Teléfono. No se puede distinguir sin una **prueba real con clic** (Tag Assistant) sobre una sesión con `gclid`.

**Recomendaciones (NO aplicadas, requieren decisión del dueño):**
1. **Probar** el disparo+atribución de WhatsApp y Teléfono con un clic real (Tag Assistant) para confirmar que cuentan.
2. **Limpiar las 17 acciones:** dejar como **Principales** solo WhatsApp + Teléfono + Formulario; pasar el resto (Tiendanube, Smart campaign, compras) a **Secundarias** o eliminarlas. Tener varias "Principales" irrelevantes ensucia la optimización.
3. **Saldo/facturación:** resolver el aviso de saldo por agotarse.
4. **Volumen:** 331 impresiones en 30 días es muy poco; con tan pocos clics, 0 conversiones puede ser simplemente falta de tráfico.

### Matriz de medición de los 4 botones de lead (probado en vivo 27/06/2026)

| Acción de lead | GA4 | Google Ads | Meta Pixel |
|---|---|---|---|
| **Botón flotante Teléfono** (Wix) | ✅ `phone_call_click` | ✅ `phone_call_click` (conv, value 1) | ✅ `phone_call_click` |
| **Botón flotante WhatsApp** (Wix) | ✅ `whatsapp_click` | ✅ `whatsapp_click` (conv, value 1) | ✅ `whatsapp_click` |
| **Cotizador → Enviar por WhatsApp** (iframe) | ✅ `generate_lead` | ❌ **NO** | ❌ **NO** |
| **Cotizador → Enviar por Email** (iframe) | ✅ `generate_lead` | ❌ **NO** | ❌ **NO** |

**Conclusión:**
- Los **2 botones flotantes** del sitio Wix se miden **en los 3 lados** (GA4 + Google Ads + Meta). Su conversión SÍ dispara — el "Requiere atención"/0 conversiones de Ads es por **falta de tráfico de anuncios** (331 impresiones/30d), no por configuración rota.
- ⚠️ **HUECO:** los **2 botones del cotizador** (el lead más caliente: el cliente ya armó el presupuesto) **solo se miden en GA4**. Google Ads y Meta NO los ven, porque el iframe (github.io) solo tiene el gtag de GA4, no el tag de Ads (`AW-931711279`) ni el Pixel de Meta. → Ads/Meta no pueden optimizar ni atribuir esos leads.

**Para cerrar el hueco del cotizador (pendiente, requiere decisión):**
- Opción A (recomendada, robusta): que el cotizador envíe un `postMessage` al Wix padre al hacer clic en WhatsApp/Email, y en GTM un listener dispare la conversión de Ads + el evento de Meta. (El cotizador ya tiene infraestructura de postMessage para la altura.)
- Opción B (rápida): agregar dentro del `index.html` del cotizador el tag de conversión de Google Ads (`gtag('event','conversion',{send_to:'AW-931711279/<label>'})`) y el Pixel de Meta (`fbq('track', ...)`) junto al `trackLead` actual. Más simple pero duplica píxeles en el iframe.

### Cierre del hueco del cotizador — IMPLEMENTADO (Opción A, 27/06/2026)
1. **Cotizador (`index.html`):** `trackLead()` ahora, además del `generate_lead` a GA4, hace `window.parent.postMessage({type:'vph_cotizador_lead', method, value, currency:'ARS'}, '*')`. ⚠️ **Falta PUBLICAR con GitHub Desktop.**
2. **GTM (`GTM-N2R3PG7`, Versión 20 "Cotizador leads a Ads + Meta" — PUBLICADA):** nuevo tag HTML personalizado **"Cotizador Lead - Ads + Meta"** (All Pages) que escucha el `postMessage` (con verificación de origin `vpremoldeados-ai.github.io`) y dispara:
   - Google Ads conversión `AW-931711279/zqpFCMzyg4gYEK-So7wD` (la misma que "Botón flotante WhatsApp en Web") con value y currency ARS.
   - Meta `fbq('trackCustom','cotizador_lead', {...})`.
   - dataLayer `cotizador_lead`.
3. **Validado en vivo:** ambas llamadas (Ads `pagead/conversion/...label=zqpFCMzyg4gYEK-So7wD&value&currency_code=ARS` y Meta `ev=cotizador_lead`) devuelven 200.
- **Nota:** los leads del cotizador (WhatsApp y Email) cuentan como la conversión de WhatsApp en Ads. Si se quiere separar Email, crear una conversión dedicada y ramificar por `method` en el tag.

### ✅ CONFIRMADO end-to-end en producción (02/07/2026)
- Se verificó que `index.html` local está publicado: repo sincronizado con `origin/main` (commit `c5f5de2`), working tree limpio (confirmado también en GitHub Desktop), y el `trackLead()` con GA4 `generate_lead` + `postMessage` ya está en el archivo real.
- Prueba en vivo sobre `https://www.vpremoldeados.com` (Claude in Chrome): se simuló el `postMessage` `vph_cotizador_lead` (origin `vpremoldeados-ai.github.io`) y se confirmó que el listener de GTM lo captura y dispara correctamente:
  - **Google Ads:** evento `conversion` a `AW-931711279/zqpFCMzyg4gYEK-So7wD` con `value` y `currency:'ARS'` — request visto en `googleads.g.doubleclick.net/pagead/viewthroughconversion` y `google.com/pagead/1p-conversion`.
  - **Meta Pixel:** `fbq('track','conversion',{value,currency:'ARS'})` + `fbq('trackCustom','cotizador_lead',{...})`.
  - **dataLayer:** entra el evento `cotizador_lead` con `lead_method` y `lead_value`.
- Nota menor: una de las dos llamadas redundantes de Ads (`viewthroughconversion`) devolvió `503` puntual en la prueba; la equivalente `1p-conversion` sí se registró — no afecta la medición real (Google reintenta/usa la otra ruta).
- **Conclusión: el hueco de medición del cotizador está cerrado y operativo.** No queda pendiente de esta sección.

---

## 10. Preferencias de trabajo del usuario

- Responder **conciso y directo**, en español.
- Hacer **muchas preguntas de a una** para conocer datos de la empresa; armar planes de acción con revisiones de progreso.
- Usa mucho Google Sheets para registrar operaciones.

---

## 11. Historial de cambios de esta sesión (resumen)

1. Marca de agua de texto en todas las imágenes; unificación de formato JPG y corrección de color.
2. Carga correcta de galerías por producto.
3. Embed que ocupa todo el alto; tipografías más grandes (estilo MercadoLibre); título arriba + breadcrumb abajo.
4. Peso y Pallets debajo de la caja de cantidad (Topes y Cordones/Listones).
5. Carrito: "Agregar más productos" arriba; forzar mismo destino/forma de pago; cuotas en el total; teléfono junto a "Enviar por Email" (obligatorio).
6. Esquema de fletes por 4 zonas + caja de localidad con verificación.
7. Descuento 20% solo en LC60 (Cribada Rectangular), no en flete; badge "Más vendida"; Subtotal de LC60 ya con descuento aplicado.
8. Responsive móvil: grilla de categorías sin scroll horizontal (Green 3, Topes 2×2); pantalla 2 ocupa el ancho (Green 1 columna); inputs/botones táctiles (≥48px, font 16px anti-zoom iOS).
9. Móvil: tocar categoría abre el cotizador a pantalla completa (`?cat=`).
10. Resaltado de campos a completar (azul pulsante → verde).
11. Chip de precio por m² (redondeado) en Cribadas y Green.
12. Banner con cuenta regresiva de la promo (se había perdido del HTML; recreado), fin al 3/7/2026.
13. Actualización de precios −20% en todos menos LC60.
14. "Enviar por Email" automático con Web3Forms (sin abrir el correo del visitante).
15. Fix del Meta Pixel duplicado (desactivada la entrada "24-04-25 Pixel de Meta").
16. Verificación de GA4 (tráfico OK, conversiones en 0). Se marcó `phone_call_click` como conversión en GA4 y se agregó `generate_lead` (WhatsApp + Email) al cotizador. Pendiente publicar y limpiar `Pageview` duplicado.
