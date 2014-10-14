$(window).on('beforeunload', function() {
  return 'Leaving the battle will forfeit your rewards.'
});

$(document).ready(function() {
  $(function() {
    var atbReady = false;
    console.log(atbReady)
    disableBattleActions();
    AtbGauge.playerAtbGauge(0, getPlayerSpeed());
    // TODO This is a temp enemy ATB gauge
    AtbGauge.enemyAtbGauge(0, 50);
  })
});

$(document).on('click', '.action', function() {
  atbReady = false; 
  var actionType = $(this).attr('data-action-type');
  console.log(actionType);
  var actionTaken = $(this).attr('data-action-taken');
  console.log(actionTaken);

  switch(actionType) {
    case "attack":
      attack();
      break;
    case "skills":
      skills(actionTaken);
      break;
    case "magic":
      magic(actionTaken);
      break;
    case "items":
      items(actionTaken);
      break;
    default:
      break;
  }
});

function enableBattleActions() {
  $('#attack, #skill, #magic, #item').removeAttr('disabled');
}

function disableBattleActions() {
  $('#attack, #skill, #magic, #item').attr('disabled', 'disabled');
}

var AtbGauge = {
  playerAtbGauge: function (count, speed) {
    var timer = setInterval(function() {
      count++;
      $('#player-atb-gauge').css('width', count + '%')
      if (count >= 100) {
        atbReady = true;
        console.log(atbReady);
        clearInterval(timer);
        enableBattleActions();
      }
    }, speed);
  },
  enemyAtbGauge: function (count, speed) {
    var timer = setInterval(function() {
      count++;
      $('#enemy-atb-gauge').css('width', count + '%')
      if (count >= 100) {
        clearInterval(timer);
        enemyAi();
      }
    }, speed);
  },
  resetAtbGauge: function() {

  }
}

// Player actions


function attack() {
  var promise = requestData("attack");
  
  //Use Ajax data
  promise.done(function(data) {
    console.log(data);
    var player = data.player;
    AtbGauge.playerAtbGauge(0, player.speed);
  });

  //var enemyHp = getEnemyHp();

  // Basic damage calculation
  //enemyHp = enemyHp - baseAtk;

  // Set the enemy's new remaining HP
  //setEnemyHp(enemyHp);
}

function skills(actionTaken) {
  console.log(actionTaken);
}

function magic(spellUsed) {}

function items(itemUsed) {}



function enemyAi() {

}


//Getters and setters


//Getters

function requestData(actionType) {
  var data = { actionType: actionType }

  return $.ajax({
    type: 'POST',
    url: '/battle-action',
    data: data,
    beforeSend: function() {
      disableBattleActions();
    },
    success: function(data) {
    },
    error: function(xhr, status, error) {
      alert("There was an error retrieving data");
      enableBattleActions();
    },
    complete: function() {}
  });
  return false;

}

function getPlayerSpeed() {
  return parseInt($('#player-stats').attr('data-speed'));
}

function getEnemyHp() {

}

// Setters


function setPlayerHp(playerHp) {
  $('#player-hp').text(playerHp).attr('data-hp', playerHp);
}

function setEnemyHp(enemyHp) {
  $('#enemy-hp').text(enemyHp).attr('data-hp', enemyHp);
}