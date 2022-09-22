window.addEventListener("DOMContentLoaded", (event) => {
  const sidebarToggle = document.body.querySelector("#sidebarToggle");
  if (sidebarToggle) {
    sidebarToggle.addEventListener("click", (event) => {
      event.preventDefault();
      document.body.classList.toggle("sb-sidenav-toggled");
      localStorage.setItem(
        "sb|sidebar-toggle",
        document.body.classList.contains("sb-sidenav-toggled")
      );
    });
  }
});

$(document).ready(function () {
  $("#clear-btn").click(function (e) {
    $("#q_created_at_eq").val("");
    $("#q_updated_at_gteq").val("");
    $("#q_updated_at_lteq").val("");
    $("#q_user_name_cont").val("");
  });
});
