# Datos estructurados (Schema LocalBusiness) — VPH Vassallo Premoldeados

Esto le dice a Google, Bing y a las IA (ChatGPT, Gemini) **qué es tu empresa, dónde está y qué fabrica**, en un formato que las máquinas entienden. Es uno de los pilares para que te encuentren y te citen.

> **Estado:** versión final lista para publicar (sin datos inventados). Claude la cargó en Wix → Configuración → Código personalizado, en el Head, todas las páginas.

---

## 1. Versión publicada (código que se cargó en Wix)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "@id": "https://www.vpremoldeados.com/#empresa",
  "name": "VPH Vassallo Premoldeados",
  "alternateName": "Vassallo Premoldeados de Hormigón",
  "description": "Fábrica de premoldeados de hormigón en Toledo, Córdoba, Argentina. Especialistas en losetas cribadas, green block, topes de estacionamiento y cordones para ingreso a cocheras, estacionamientos, veredas y patios. Empresa familiar fundada en 2010 por el ingeniero civil Marcelo Vassallo.",
  "url": "https://www.vpremoldeados.com",
  "telephone": "+5493517605362",
  "email": "vpremoldeados@gmail.com",
  "taxID": "30-71784004-2",
  "priceRange": "$$",
  "currenciesAccepted": "ARS",
  "foundingDate": "2010",
  "founder": {
    "@type": "Person",
    "name": "Marcelo Vassallo",
    "jobTitle": "Ingeniero Civil - Fundador y Director"
  },
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "Toledo",
    "addressRegion": "Córdoba",
    "addressCountry": "AR"
  },
  "areaServed": [
    { "@type": "City", "name": "Córdoba" },
    { "@type": "AdministrativeArea", "name": "Provincia de Córdoba" },
    { "@type": "Country", "name": "Argentina" }
  ],
  "openingHoursSpecification": [
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday","Tuesday","Wednesday","Thursday","Friday"],
      "opens": "09:00",
      "closes": "17:00"
    }
  ],
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.8",
    "reviewCount": "150",
    "bestRating": "5"
  },
  "knowsAbout": [
    "losetas cribadas",
    "green block",
    "piso para cochera",
    "piso para estacionamiento",
    "topes de estacionamiento",
    "cordones y listones de hormigón",
    "premoldeados de hormigón",
    "hormigón armado"
  ],
  "makesOffer": [
    {
      "@type": "Offer",
      "itemOffered": {
        "@type": "Product",
        "name": "Loseta Cribada Rectangular",
        "description": "Piso de hormigón armado de diseño (60x40x6 cm, hierro 4,2 mm) para ingreso a cocheras y estacionamientos. La loseta se integra con el césped.",
        "material": "Hormigón armado",
        "brand": { "@type": "Brand", "name": "VPH Vassallo Premoldeados" }
      }
    },
    {
      "@type": "Offer",
      "itemOffered": {
        "@type": "Product",
        "name": "Loseta Cribada Cuadrada",
        "description": "Loseta cribada de hormigón armado 40x40x7 cm, hierro 4,2 mm, para ingresos y estacionamientos integrados al césped.",
        "material": "Hormigón armado",
        "brand": { "@type": "Brand", "name": "VPH Vassallo Premoldeados" }
      }
    },
    {
      "@type": "Offer",
      "itemOffered": {
        "@type": "Product",
        "name": "Losetas Green (Block, Rombo y Círculo)",
        "description": "Losetas de diseño 35x35x6 cm para ingresos con más estilo, integradas al césped.",
        "material": "Hormigón",
        "brand": { "@type": "Brand", "name": "VPH Vassallo Premoldeados" }
      }
    },
    {
      "@type": "Offer",
      "itemOffered": {
        "@type": "Product",
        "name": "Topes de Estacionamiento",
        "description": "Topes de hormigón para ordenar y dar seguridad a espacios de estacionamiento. Medidas de 50 cm y 100 cm.",
        "material": "Hormigón",
        "brand": { "@type": "Brand", "name": "VPH Vassallo Premoldeados" }
      }
    },
    {
      "@type": "Offer",
      "itemOffered": {
        "@type": "Product",
        "name": "Cordones y Listones",
        "description": "Cordones de confinamiento y listones de hormigón para terminaciones y bordes.",
        "material": "Hormigón",
        "brand": { "@type": "Brand", "name": "VPH Vassallo Premoldeados" }
      }
    }
  ]
}
</script>
```

---

## 2. Datos confirmados (del sitio + ficha de la empresa)

- Horarios: **Lunes a Viernes 9:00–17:00**
- CUIT: **30-71784004-2** (Responsable Inscripto)
- Teléfono: **+54 9 351 760-5362** · Email: **vpremoldeados@gmail.com**
- Calificación: **4,8 ⭐ / 150 reseñas en Google**
- Fundación: **2010**, por Marcelo Vassallo (ing. civil) · Planta en **Toledo, Córdoba**

## 3. Mejoras opcionales para enriquecerlo más adelante

Cuando los tengas, sumamos al schema: **dirección exacta** (calle/número/CP), **coordenadas** de Google Maps, **logo** y **foto**, **link de la ficha de Google Maps**, y **redes** (Facebook/Instagram) en el campo `sameAs`. Hoy se omitieron para no cargar datos inventados.

---

## 4. Por qué ayuda con ChatGPT y Gemini

- **Gemini** usa Google y **ChatGPT** usa Bing: el mismo schema lo leen ambos al rastrear tu sitio.
- Las IA prefieren citar negocios con información **clara, estructurada y consistente**.
- Tu 4,8 con 150 reseñas es una señal de confianza fuerte, ahora legible para las máquinas.

**Verificación:** Test de Resultados Enriquecidos de Google → https://search.google.com/test/rich-results (pegar `https://www.vpremoldeados.com`).

**Próximos pilares:** Bing Places + Bing Webmaster Tools, NAP consistente en directorios, y sección de Preguntas Frecuentes con schema `FAQPage`.
