'use strict';

(function() {
  window.Exchanges || (window.Exchanges = {});

  Exchanges.init = function(){
    $('#from, #to').on('change', function() {
      Exchanges.submit();
    });

    $('#btn_exchange').on('click', function() {
      var from = $('#from').val();
      var to   = $('#to').val();
      $('#from').val(to);
      $('#to').val(from);

      Exchanges.submit();
    });

    $('#amount').on('keyup change click', function() {
      Exchanges.calculate();
    });
  }

  
  Exchanges.render = function(value){
    $('#quotation').data('quotation', value);
    Exchanges.calculate();
  };


  Exchanges.calculate = function(){
    var quotation = $('#quotation').data('quotation');
    var amount    = $('#amount').val();

    if( amount <= 0 || isNaN(amount) || isNaN(quotation)  ){
      $('#quotation').val(quotation);

    }else{
      $('#quotation').val( quotation * amount ); 
    }

    $('.spinner-wait').hide();
  };

  
  Exchanges.submit = function(){
    $('.spinner-wait').show();
    Rails.fire($('form')[0], 'submit');
  };


  $(document).on('turbolinks:load', function(){
    Exchanges.init();
  });

}).call(this);
