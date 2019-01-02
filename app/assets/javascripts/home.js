
window.onload = function() {
  flatpickr("#calendar", {
    enableTime: true,
    time_24hr: true,
    minDate: "today",
    disableMobile: "true"
  });
}
