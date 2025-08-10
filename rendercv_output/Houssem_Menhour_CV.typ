
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Houssem Menhour"
#let locale-catalog-page-numbering-style = context { "Houssem Menhour - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Aug 2025"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.8em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 20pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 1.5cm
#let design-page-bottom-margin = 1.5cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 1.5cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Houssem Menhour

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)00210 Helsinki, Finland],
  [#box(original-link("mailto:husmen93@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)husmen93\@gmail.com])],
  [#box(original-link("tel:+358-46-9999999")[#fa-icon("phone", size: 0.9em) #h(0.05cm)+358 46 9999999])],
  [#box(original-link("https://husmen.xyz/")[#fa-icon("link", size: 0.9em) #h(0.05cm)husmen.xyz])],
  [#box(original-link("https://linkedin.com/in/husmen")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)husmen])],
  [#box(original-link("https://github.com/husmen")[#fa-icon("github", size: 0.9em) #h(0.05cm)husmen])],
)
#connections(connections-list)



== Personal Statement


#one-col-entry(
  content: [SW engineer with 5 years in computer vision and applied research; MSc in Computer Science & Engineering \(completing Aug 2025\).  Passionate about building production-grade and highly optimized imaging and ML systems across machine vision, computed tomography, and robotics.  Seeking senior ML\/SW engineering roles in remote sensing to drive R&D and deliver measurable impact.
]
)


== Experience


#two-col-entry(
  left-content: [
    #strong[Detection Technology], Algorithms Engineer
  ],
  right-content: [
    Jan 2023 – present
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Designing and deploying Image Quality Assessment \(IQA\) and enhancement algorithms for X-ray detectors across R&D and production.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed a self-supervised deep learning denoising model for cone-beam CT \(CBCT\)],[Redesigned the architecture and expanded the functionality of our internal X-ray Image Quality Assessment library],[Optimized performance through parallelization and out-of-core processing],[Improved user and developer experience \(DX\) through CI\/CD automation and modern tooling],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[ERG Controls], Software Engineer
  ],
  right-content: [
    May 2022 – Oct 2022
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developed a GUI and REST API around one of the company's DL models for deployment on Jetson Nano boards with near real-time inference])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Visiomex], Computer Vision Engineer
  ],
  right-content: [
    Jul 2020 – Aug 2022
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Researched and developed custom machine vision solutions])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Computer-vision-based quality control for the automotive and home appliances industries, applying a statistical approach to optimizing their parameters],[3D reconstruction and inspection using a laser profiling technique and a robotic arm achieving a scanning resolution of 100 µm],[Anomaly detection \(CAE, PaDiM\) for steel-sheet defects],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Kocaeli University], Research Intern
  ],
  right-content: [
    Jun 2018 – Dec 2018
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Contributed to ongoing research at the Image Processing Laboratory])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Computer Vision for Autonomous Driving Vehicles],[OCR and Image Classification and Analysis],)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming:] #strong[Python], C\#\/.NET, C\/#strong[C++], Go; backend dev \(#strong[FastAPI], ASP.NET\), desktop dev \(#strong[Qt], WPF\)]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Data & Analytics:] SQL, NoSQL, PyData Stack, ELK Stack, #strong[Kafka], #strong[Spark]]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Computer Vision and Machine Learning:] #strong[OpenCV], MVTec Halcon, #strong[PyTorch], TensorFlow, XGBoost]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Tools & Technologies:] Linux, Bash, Git, #strong[Docker], Kubernetes, CI\/CD, #strong[ROS], MATLAB, #strong[CUDA], OpenCL]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] Arabic \(native\), English \(fluent, TOEFL: 111\/120\), Turkish \(fluent, TÖMER: C1\), French \(intermediate\)]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Soft Skills:] Analytical thinking, Adaptability, Self-motivated, Team player]
)


== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[MSc]],
  middle-content: [
    #strong[University of Oulu], Computer Science & Engineering
  ],
  right-content: [
    Sep 2022 – Aug 2025
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([AI specialization, with focus on Machine Learning and Machine Vision],[Thesis on #link("https://oulurepo.oulu.fi/handle/10024/53316")[Deep Learning Based Denoising for CBCT Projection Data]],[Coursework includes Biosignal Processing, Deep Learning, Multiprocessor Programming],)
  ],
  inset: (
    left: design-entry-types-education-entry-degree-column-width + design-entries-horizontal-space-between-columns + design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[Kocaeli University], Computer Engineering
  ],
  right-content: [
    Sep 2015 – Jun 2020
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([Coursework includes Algorithm Analysis, Design Patterns, Distributed Systems, Embedded Systems],[Contributed to 3 peer-reviewed research papers, earning me the Engineering Faculty Achievement Award],)
  ],
  inset: (
    left: design-entry-types-education-entry-degree-column-width + design-entries-horizontal-space-between-columns + design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [],
  middle-content: [
    #strong[TÖMER, Kocaeli University], Turkish Language Preparatory Class
  ],
  right-content: [
    Sep 2014 – Jun 2015
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Preparatory Class for Foreign Students])], column-gutter: 0cm)
  ],
  inset: (
    left: design-entry-types-education-entry-degree-column-width + design-entries-horizontal-space-between-columns + design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [],
  middle-content: [
    #strong[IGEE, Boumerdes University], Electrical & Electronics Engineering
  ],
  right-content: [
    Sep 2012 – Jun 2014
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([Picked up my passion for computer science and engineering through C programming and digital design classes; left after 2 years for a full scholarship abroad],)
  ],
  inset: (
    left: design-entry-types-education-entry-degree-column-width + design-entries-horizontal-space-between-columns + design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Publications


#one-col-entry(
  content: [- H. Menhour, et al., #link("https://doi.org/10.1177/01655515211000642")[#emph[Searchable Turkish OCRed historical newspaper collection 1928–1942]], J. Inf. Sci., Mar 2021],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- S. Eken, et al., #link("https://doi.org/10.1177/002072092090787")[#emph[A Reproducible Educational Plan to Teach Mini Autonomous Race Car Programming]], IJEEE, Feb 2020],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- S. Eken, et al., #link("https://doi.org/10.1109/ACCESS.2019.2930339")[#emph[DoCA: A Content-based Automatic Classification System for Digital Documents]], IEEE Access, Jul 2019],
)


== Projects


#two-col-entry(
  left-content: [
    #strong[Bachelor's Graduation Project]
  ],
  right-content: [
    Sep 2019 – May 2020
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Spatio-temporal logistics data stream processing, in collaboration with CEVA Logistics])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Built a dockerized infrastructure for a geo data pipeline, including real-time OBD & GPS data ingestion, stream processing with Apache #strong[Kafka] and #strong[Spark]],[The rest of the team built on this groundwork for their #link("https://doi.org/10.1016/j.eswa.2021.115755")[real-time anomaly detection research]],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://github.com/fourplusone41")[#strong[FourPlusOne]]
  ],
  right-content: [
    Jun 2018 – May 2019
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Led a team representing Kocaeli University at the OpenZeka MARC autonomous driving competition])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Built a complex robotic system for the Jetson TX2 platform using #strong[ROS]],[Applied Deep Learning to lane tracking \(CNN in TF\) and traffic signs detection \(YOLO\)],[Implemented sensor fusion and Kalman filter for reliable localization and PID controller],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://github.com/husmen/DoCA_GUI")[#strong[DOCA]]
  ],
  right-content: [
    Jun 2018 – Sep 2018
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Havelsan Open Innovation Competition \(PARDUS DoSA\)])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed a program for automatic document classification and analysis covering text, images, audio and video file types.],[Won 1st place at Havelsan Open Innovation Competition \(PARDUS DoSA\)],)
  ],
)



== Certificates


#one-col-entry(
  content: [- Fundamentals of Accelerated Computing with Modern #strong[CUDA] #strong[C++], #link("https://learn.nvidia.com/certificates?id=HLe92NvRToqjiZRHjbV3Cw")[NVIDIA], May 2025],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Data Analyst Nanodegree, #link("https://confirm.udacity.com/HGLG9QD6")[Udacity], Jun 2020],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Fundamentals of Deep Learning for Computer Vision Certificate, #link("https://courses.nvidia.com/certificates/bf9082c5fb5c42c7b735a20b5dc577f8")[NVIDIA], Feb 2019],
)


== Accomplishments


#one-col-entry(
  content: [- 2nd place at AçıkHack NLP Hackathon, Nov 2019],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- 1st place at Havelsan's Open Innovation Competition \(PARDUS DoSA\), Aug 2018],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Fully funded Turkey Scholarships Program, Aug 2014],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Baccalaureate Exam with First Class Honours, Jun 2012],
)


== Extracurricular Activities


#one-col-entry(
  content: [- IT Manager at ESN Oulu, Jan 2023 - Dec 2023],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Team Leader at FourPlusOne, Sep 2018 - Sep 2019],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- IT Manager at IAESTE Kocaeli, Sep 2017 - Sep 2018],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- IEEEXtreme Turkey Competitive Programming, Jan 2017 - Sep 2018],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Project Manager at Inelectronics Student Club, Jan 2013 - Jun 2014],
)


== Hobbies


#one-col-entry(
  content: [- Ongoing endeavor to self-host privacy-respecting services on my homelab],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- A little of everything in nature; travel, hiking, camping, sailing],
)


