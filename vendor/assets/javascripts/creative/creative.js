/*!
 * Start Bootstrap - Creative Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

$(document).ready(function(){

  (function($) {
      "use strict"; // Start of use strict

      // jQuery for page scrolling feature - requires jQuery Easing plugin
      $('a.page-scroll').bind('click', function(event) {
          var $anchor = $(this);
          $('html, body').stop().animate({
              scrollTop: ($($anchor.attr('href')).offset().top - 50)
          }, 1250, 'easeInOutExpo');
          event.preventDefault();
      });

      setTimeout(function() {
        $('#flash-alerts').fadeOut();
      }, 5000);

      // Closes the Responsive Menu on Menu Item Click
      $('.navbar-collapse ul li a:not(.dropdown-toggle)').click(function() {
          $('.navbar-toggle:visible').click();
      });

      // Fit Text Plugin for Main Header
      $("h1").fitText(
          1.2, {
              minFontSize: '35px',
              maxFontSize: '65px'
          }
      );

      // Offset for Main Navigation
      $('#mainNav').affix({
          offset: {
              top: 100
          }
      })

      // Initialize WOW.js Scrolling Animations
      new WOW().init();

      $("form").bind("keypress", function(e) {
        // ctrl+enter should always submit a form.
        if((e.which === 13 || e.which === 10) && e.ctrlKey) {
          // Find the submit button for this form and click it.
          // Note that we don't submit the form because that would bypass
          // any click listeners on the submit button.
          $(this).find('[type=submit]')[0].click();
        }
      });
      $("form.no-submit-on-enter").bind("keypress", function(e) {
        // We allow pressing enter inside textareas, because that only inserts
        // a newline, it doesn't submit the form.
        // Note that we let the keypress occur if ctrl is being held down, as
        // we still want ctrl+enter to submit the form.
        if(e.which === 13 && !e.ctrlKey && e.target.tagName !== "TEXTAREA") {
          e.preventDefault();
        }
      });

  })(jQuery); // End of use strict

})
