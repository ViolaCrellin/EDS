$(document).ready(function () {
  $.ajax({
    method: 'GET',
    url: 'http://localhost:9292/stats',
    dataType: 'jsonp',
  }).done(function (stats) {
    console.log(stats);
    stats.forEach(function (s) {
      $('#results').append(s.id);
    });
  });
});
