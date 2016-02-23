$(document).ready(function () {
  $.getJSON('http://localhost:9292/stats', function (data) {
    console.log(data);
    data.forEach(function (d) {
      $('#results').append('<div class="year" data_bop="' + d.balance_of_payment_millions + '">' + d.gov + ' ' + d.year + ' ' + d.balance_of_payment_millions + '</div>');
      $('.year').each(function () {
        var dbop = $(this).attr('data_bop');
        $(this).css({
          height: dbop,
          width: dbop,
        });
      });
    });
  });
});
