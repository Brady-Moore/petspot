// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "@popperjs/core";
import "bootstrap";

function resetSearchOffcanvas() {
  // Remove any backdrops Bootstrap may have left
  document.querySelectorAll(".offcanvas-backdrop").forEach((el) => el.remove());

  // Unlock body scrolling/styles
  document.body.classList.remove("offcanvas-backdrop", "modal-open");
  document.body.style.overflow = "";
  document.body.style.paddingRight = "";

  // Ensure the offcanvas element is hidden and not "show"ing
  const el = document.getElementById("searchOffcanvasBottom");
  if (!el) return;

  // If Bootstrap instance exists, hide it
  const inst = window.bootstrap?.Offcanvas?.getInstance?.(el) || window.bootstrap?.Offcanvas?.getOrCreateInstance?.(el);
  try {
    inst?.hide?.();
  } catch (_) {
    /* no-op */
  }

  el.classList.remove("show");
  el.setAttribute("aria-hidden", "true");
  el.removeAttribute("aria-modal");
  el.removeAttribute("style");
}

// 1) Before Turbo caches the current page snapshot
document.addEventListener("turbo:before-cache", resetSearchOffcanvas);
