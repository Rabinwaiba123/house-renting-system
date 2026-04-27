/**
 * 
 */
const links = document.querySelectorAll(".nav-option");
  const currentPage = window.location.pathname.split("/").pop();

  links.forEach(link => {
    const linkPage = link.getAttribute("href");

    if (linkPage === currentPage) {
      link.classList.add("active-option");
    } else {
      link.classList.remove("active-option");
    }
  });
  
  let menuicn = document.querySelector(".menuicn");
  let nav = document.querySelector(".navcontainer");

  menuicn.addEventListener("click", () => {
      nav.classList.toggle("navclose");
  })