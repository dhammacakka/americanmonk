---
title: "Podcast"
description: "Listen to the American Monk Podcast — Dhamma talks by Bhante Subhūti"
---

<style>
.podcast-landing {
  max-width: 700px;
  margin: 0 auto;
  text-align: center;
  padding: 1rem;
}
.podcast-landing img.cover {
  width: 220px;
  height: 220px;
  border-radius: 16px;
  box-shadow: 0 8px 24px rgba(0,0,0,0.12);
  margin-bottom: 1.5rem;
  object-fit: cover;
}
.podcast-landing .sub-buttons {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 0.75rem;
  margin-bottom: 2.5rem;
}
.podcast-landing .sub-buttons a {
  display: inline-flex;
  align-items: center;
  color: #fff;
  text-decoration: none;
  padding: 0.7rem 1.3rem;
  border-radius: 8px;
  font-weight: 500;
}
.episode-card {
  background: #fafafa;
  border: 1px solid #e8e8e8;
  border-radius: 12px;
  padding: 1.25rem 1.5rem;
  margin-bottom: 1rem;
  text-align: left;
}
.episode-card .ep-date {
  font-size: 0.85rem;
  color: #999;
  margin: 0 0 0.25rem 0;
}
.episode-card .ep-title {
  font-size: 1.15rem;
  font-weight: 600;
  color: #2c2c2c;
  margin: 0 0 0.75rem 0;
}
.episode-card audio {
  width: 100%;
  height: 40px;
}
@media (max-width: 500px) {
  .podcast-landing {
    padding: 0.5rem;
  }
  .episode-card {
    padding: 1rem;
  }
}
</style>

<div class="podcast-landing">

<img class="cover" src="/images/podcast-cover.jpg" alt="American Monk Podcast Cover">

<h2 style="margin: 0 0 0.75rem 0; color: #2c2c2c;">The American Monk Podcast</h2>

<p style="font-size: 1.1rem; color: #555; line-height: 1.6; margin-bottom: 2rem;">
Dhamma talks and reflections from Bhante Subhūti, a Theravāda Buddhist monk.
</p>

<h3 style="margin: 2rem 0 0.75rem 0; color: #2c2c2c;">Join the Sunday Talks</h3>
<p style="font-size: 1.1rem; color: #555; line-height: 1.6; margin-bottom: 2.5rem;">
If you would like to participate in our live Sunday Dhamma discussions, please visit the <a href="/about/">Contact Page</a> to request the invitation link.
</p>

<h3 style="color: #4a4a4a; margin-bottom: 1.5rem;">Subscribe on Your Favorite Platform</h3>

<div class="sub-buttons" style="display: flex; flex-wrap: wrap; justify-content: center; align-items: center; gap: 1rem; margin-bottom: 2.5rem;">
<!-- Apple Podcasts -->
<a href="https://podcasts.apple.com/us/podcast/american-monk-podcast/id6788781522" target="_blank" rel="noopener noreferrer" style="display: inline-block; height: 40px;">
<img src="/images/Apple_Podcast_Listen_on_Badge_RGB_USGB-EN_CI_111825.svg" alt="Listen on Apple Podcasts" style="height: 40px; border-radius: 6px;">
</a>

<!-- Spotify -->
<a href="https://open.spotify.com/show/2ROj0YalYTpP9qb3YsI8Xz" target="_blank" rel="noopener noreferrer" style="display: inline-block; height: 40px;">
<img src="/images/spotify_badge.png" alt="Listen on Spotify" style="height: 40px; border-radius: 6px;">
</a>

<!-- Pocket Casts -->
<a href="https://pocketcasts.com/podcast/american-monk-podcast/f0d7eec0-537a-013e-2aa7-0affe10cf08b" target="_blank" rel="noopener noreferrer" style="display: inline-block; height: 40px;">
<img src="/images/pocketcasts_small_light@2x-g7_53-F9.png" alt="Listen on Pocket Casts" style="height: 40px; border-radius: 6px;">
</a>

<!-- RSS Feed -->
<a href="/podcast.xml" style="display: inline-flex; align-items: center; background: #F26522; color: #fff; text-decoration: none; padding: 0 1.2rem; border-radius: 6px; font-weight: 500; height: 40px; box-sizing: border-box; line-height: 40px;">
📡 RSS Feed
</a>
</div>

<hr style="border: none; border-top: 1px solid #ddd; margin: 2rem 0;">

<h3 style="color: #2c2c2c; margin-bottom: 1.25rem; text-align: left;">Recent Episodes</h3>

<div id="episodes-container">
<p style="color: #999;">Loading episodes...</p>
</div>

<p style="color: #888; font-size: 0.9rem; margin-top: 2rem;">
Subscribe to the RSS feed to get all episodes in your favorite podcast app.
</p>

</div>

<script>
(function() {
  fetch('/podcast.xml')
    .then(function(res) { return res.text(); })
    .then(function(xmlText) {
      var parser = new DOMParser();
      var xml = parser.parseFromString(xmlText, 'application/xml');
      var items = xml.querySelectorAll('item');
      var container = document.getElementById('episodes-container');
      container.innerHTML = '';

      var count = Math.min(items.length, 5);
      for (var i = 0; i < count; i++) {
        var item = items[i];
        var title = item.querySelector('title').textContent;
        var pubDate = item.querySelector('pubDate').textContent;
        var enclosure = item.querySelector('enclosure');
        var audioUrl = enclosure ? enclosure.getAttribute('url') : '';

        // Format the date nicely
        var d = new Date(pubDate);
        var months = ['January','February','March','April','May','June',
                      'July','August','September','October','November','December'];
        var dateStr = months[d.getMonth()] + ' ' + d.getDate() + ', ' + d.getFullYear();

        var card = document.createElement('div');
        card.className = 'episode-card';
        card.innerHTML =
          '<p class="ep-date">' + dateStr + '</p>' +
          '<p class="ep-title">' + title + '</p>' +
          (audioUrl
            ? '<audio controls preload="metadata"><source src="' + audioUrl + '" type="audio/mpeg"></audio>'
            : '');
        container.appendChild(card);
      }
    })
    .catch(function() {
      document.getElementById('episodes-container').innerHTML =
        '<p style="color:#999;">Could not load episodes.</p>';
    });
})();
</script>
