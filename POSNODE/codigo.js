const path = require('path');
window.jQuery = window.$ = require('jquery');

$(document).ready(() => {
    $('#agregar').click(() => {
        var t = $('#texto').val();
        console.log('agregado' + t);
    });
});

