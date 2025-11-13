function scrollToSection(id) {
  document.getElementById(id).scrollIntoView({ behavior: "smooth" });
}

document.querySelector("form").addEventListener("submit", (e) => {
  e.preventDefault();
  alert("ขอบคุณสำหรับข้อความของคุณ! We’ll get back to you soon.");
});

