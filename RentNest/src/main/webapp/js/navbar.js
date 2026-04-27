const links = document.querySelectorAll(".nav-menu a");
 const currentPage = window.location.pathname.split("/").pop();

 links.forEach(link => {
   const linkPage = link.getAttribute("href").split("/").pop();

   if (currentPage === linkPage) {
     link.classList.add("active");
   } else {
     link.classList.remove("active");
   }
 });