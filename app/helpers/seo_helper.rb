module SeoHelper
  def page_title(title = nil)
    base_title = "Félix Korbendau - Développeur Full-Stack"
    title ? "#{title} | #{base_title}" : base_title
  end

  def page_description(description = nil)
    description || "Portfolio de Félix Korbendau, développeur Full-Stack spécialisé en Ruby on Rails, JavaScript et technologies modernes. Découvrez mes projets et compétences."
  end

  def page_keywords
    "développeur, full-stack, Ruby on Rails, JavaScript, portfolio, web development, programmer, Félix Korbendau, freelance, applications web"
  end

  def structured_data_person
    {
      "@context": "https://schema.org",
      "@type": "Person",
      "name": "Félix Korbendau",
      "jobTitle": "Développeur Full-Stack",
      "description": "Développeur Full-Stack spécialisé en Ruby on Rails, JavaScript et technologies modernes",
      "url": request.original_url,
      "sameAs": [
        "https://github.com/Bios-afk",
        "https://linkedin.com/in/felix-korbendau-713a63217"
      ],
      "knowsAbout": [
        "Ruby on Rails",
        "JavaScript",
        "HTML",
        "CSS",
        "Bootstrap",
        "PostgreSQL",
        "Git",
        "Figma"
      ],
      "address": {
        "@type": "PostalAddress",
        "addressLocality": "Paris",
        "addressCountry": "France"
      }
    }.to_json.html_safe
  end
end
