$(function() {
  $(".spot").click(makeMove);
  $(".new-game").click(newGame);
  newGame();
});

function newGame() {
  $.ajax({
    url: 'new_game',
    type: 'post',
    dataType: 'json',
    success: updateBoard
  });
}

function makeMove() {
  $.ajax({
    data: { spot: $(this).attr("id") },
    url: 'make_play',
    type: 'post',
    dataType: 'json',
    success: updateBoard
  });
}

function updateBoard(data) {
  $(".spot").off();
  $(".title").removeClass("red-turn blue-turn").addClass(data.turn + '-turn');
  $(".blue").add(".red").hide();

  for (var i=0; i<data.plays.red.length; i++) {
    play = data.plays.red[i];
    var spot = "#s" + play[0] + "-" + play[1];
    $(spot + " .red").show();
  }
  for (var i=0; i<data.plays.blue.length; i++) {
    play = data.plays.blue[i];
    var spot = "#s" + play[0] + "-" + play[1];
    $(spot + " .blue").show();
  }

  if (!data.winner) {
    $(".spot").click(makeMove);
    $(".board").removeClass('winner-red winner-blue');
  } else if (data.winner == 'red') {
    $('.board').addClass("winner-red");
  } else {
    $('.board').addClass("winner-blue");
  }
}
