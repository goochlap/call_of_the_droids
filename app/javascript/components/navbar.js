const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-default');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 100) {
        navbar.classList.add('navbar-default-black');
      } else {
        navbar.classList.remove('navbar-default-black');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
