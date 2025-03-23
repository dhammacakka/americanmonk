document.addEventListener('DOMContentLoaded', () => {
    const progressCircle = document.getElementById('progress-circle');
    const progressText = document.getElementById('progress-text');
    const mainContent = document.getElementById('main-content');

    if (!progressCircle || !mainContent) {
        console.error("Progress circle or main content not found!");
        return;
    }

    function updateProgress() {
        // 1) The top of main content
        const mainTop = mainContent.offsetTop;
        // 2) The total scrollable height of main content
        const mainHeight = mainContent.scrollHeight;
        // 3) The bottom of main content in terms of the page’s scroll coordinate
        const mainBottom = mainTop + mainHeight - window.innerHeight;

        // 4) Current scroll position from the top of the document
        const scrolled = window.scrollY;

        // If scrolled < mainTop, we’re above main content => 0%
        if (scrolled < mainTop) {
            progressCircle.style.background = "conic-gradient(#d48806 0%, #eee 0%)";
            progressText.innerText = "0%";
            return;
        }

        // If scrolled > mainBottom, we’re past main content => 100%
        if (scrolled > mainBottom) {
            progressCircle.style.background = "conic-gradient(#d48806 100%, #eee 100%)";
            progressText.innerText = "100%";
            return;
        }

        // Otherwise, calculate how far we are in the main content
        const contentScrolled = scrolled - mainTop;         // distance scrolled within main
        const contentScrollable = mainBottom - mainTop;     // total scrollable in main
        const progress = (contentScrolled / contentScrollable) * 100;

        // Update the circular gradient
        progressCircle.style.background =
            `conic-gradient(#d48806 ${progress}%, #eee ${progress}%)`;

        // Update the text
        progressText.innerText = Math.round(progress) + "%";
    }

    document.addEventListener('scroll', updateProgress);
    updateProgress(); // Initialize on page load
});
