$(document).ready(function () {
  $('#data-filters').submit(function(e) {
    e.preventDefault();
    $.getJSON('http://localhost:9292/stats', function (data) {
      console.log(data);
      data.forEach(function (d) {
        $('#results').append('<div class="year" data_bop="' + d.balance_of_payment_millions + '">' + d.gov + ' ' + d.year + ' ' + d.balance_of_payment_millions + '</div>');
      });
      start = $('#start-year').val();
      end = $('#end-year').val();
      range = data.filter(function(x){ return x.year >= start && x.year <= end });
      console.log(range);
      range.forEach(function (d) {
        var selection = [];
          $('#data-filters input:checked').each(function() {
              selection.push(this.value);
          });
          console.log(selection);
        $('#range .content').append('<p>' + d.gov + ': ' + d.year + '</p>');
      });
    });
  });
});
