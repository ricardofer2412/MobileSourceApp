function update_price(){
  var row = $(this).parents('.item.row');
  var price = row.find('.cost').val() * row.find('.qty').val();
  price = price.toFixed(2);
  isNaN(price) ? row.find('.price').html('NAaN') : row.find('.price').html(price);
}
