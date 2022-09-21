$( document ).ready(function() {

    $('.js-select2:not(.js-select2-enabled)').each((index, element) => {
      let el = $(element);

      // Add .js-select2-enabled class to tag it as activated and init it
      $(element).addClass('js-select2-enabled').select2({
        placeholder: el.data('placeholder') || false,
        dropdownParent: document.querySelector(el.data('container') || '#page-container'),
      });
    });
});
