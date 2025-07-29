// ===================================
// NAVIGATION ACTIVE ET SMOOTH SCROLL
// ===================================

document.addEventListener("DOMContentLoaded", function () {
  const navLinks = document.querySelectorAll('.list-link a[href^="#"]');
  const sections = document.querySelectorAll("[id]");

  // Fonction pour mettre à jour le lien actif
  function updateActiveLink() {
    let current = "";

    sections.forEach((section) => {
      const sectionTop = section.offsetTop;
      const sectionHeight = section.clientHeight;

      if (window.pageYOffset >= sectionTop - 200) {
        current = section.getAttribute("id");
      }
    });

    navLinks.forEach((link) => {
      link.classList.remove("active");
      if (link.getAttribute("href") === `#${current}`) {
        link.classList.add("active");
      }
    });
  }

  // Écouter le scroll pour mettre à jour le lien actif
  window.addEventListener("scroll", updateActiveLink);

  // Initialiser le lien actif au chargement
  updateActiveLink();

  // Améliorer le smooth scroll avec un offset pour la navbar
  navLinks.forEach((link) => {
    link.addEventListener("click", function (e) {
      e.preventDefault();

      const targetId = this.getAttribute("href").substring(1);
      const targetSection = document.getElementById(targetId);

      if (targetSection) {
        const offsetTop = targetSection.offsetTop - 80; // Offset pour la navbar

        window.scrollTo({
          top: offsetTop,
          behavior: "smooth",
        });
      }
    });
  });
});
