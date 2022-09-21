$( document ).ready(function() {
     $('.js-rangeslider:not(.js-rangeslider-enabled)').each((index, element) => {
      let el = $(element);

      // Add .js-rangeslider-enabled class to tag it as activated and init it
      $(element).addClass('js-rangeslider-enabled').ionRangeSlider({
        input_values_separator: ';',
        skin: el.data('skin') || 'round'
      });
    });
});
