document.addEventListener("click", function (e) {
  const btn = e.target.closest(".video-card-thumb");
  if (!btn) return;

  const card = btn.closest(".video-card");
  const videoId = btn.dataset.videoId;
  const embedDiv = card.querySelector(".video-card-embed");

  // Hide thumbnail
  btn.style.display = "none";

  // Inject player
  embedDiv.innerHTML = `
    <div class="video-card-iframe-wrapper">
      <iframe
        src="https://www.youtube.com/embed/${videoId}?autoplay=1"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen
      ></iframe>
    </div>
  `;
});
