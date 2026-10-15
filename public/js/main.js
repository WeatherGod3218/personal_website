(() => {
  // <stdin>
  var root = document.documentElement;
  var savedTheme = null;
  try {
    savedTheme = localStorage.getItem("theme");
  } catch (e) {
  }
  var systemPrefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches;
  root.setAttribute("data-theme", savedTheme || (systemPrefersDark ? "dark" : "light"));
  document.getElementById("theme-toggle").addEventListener("click", () => {
    const next = root.getAttribute("data-theme") === "dark" ? "light" : "dark";
    root.setAttribute("data-theme", next);
    try {
      localStorage.setItem("theme", next);
    } catch (e) {
    }
  });
})();
//# sourceMappingURL=main.js.map
