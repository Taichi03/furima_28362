window.addEventListener("load", function () {

  $("#item-price").on("keyup", function () {
    let price = $(this).val();
    let fee = Math.round(price * 0.1);
    let profit = price - fee;
    $("#add-tax-price").text(fee);
    $("#profit").text(profit);
  });
});

