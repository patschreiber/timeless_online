$(document).ready(function() {
  $(function() {
    var atbReady = false;
    disableBattleActions();
    AtbGauge.playerAtbGauge(0, getPlayerSpeed());
    AtbGauge.enemyAtbGauge(0, getEnemySpeed());
  })
});

$(document).on('click', '.action', function() {
  atbReady = false; 
  var actionType = $(this).attr('data-action-type');
  var actionTaken = $(this).attr('data-action-taken');

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
  }
}

// Player actions


function attack() {
  var promise = requestData("attack");
  
  //Use Ajax data
  promise.done(function(data) {
    console.log(data);
    var player = data.player;
    var enemyHp = getEnemyHp();
    enemyHp = enemyHp - 24;
    setEnemyHp(enemyHp);
    if (winConditionCheck()) {
      winCondition();
    }
    // Reset player atb gauge
    AtbGauge.playerAtbGauge(0, player.speed);
  });
}

function skills(actionTaken) {
  console.log(actionTaken);
}

function magic(spellUsed) {}

function items(itemUsed) {}



function enemyAi() {

}


function winConditionCheck() {
  var currentPlayerHp = getPlayerHp();
  var currentEnemyHp = getEnemyHp();
  if (currentPlayerHp > 0 && currentEnemyHp <= 0) {
    a = true;
    return true;
  }
  else {
    return false;
  }
}

function winCondition() {
  // Create victory modal
  $('#winner-modal').modal({
    backdrop: 'static'
  }).on('hide.bs.modal', function() {
    //As an HTTP redirect (back button will not work ), we want this so they cant go back to the same battle
    window.location.replace("/game");
  });
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

function getEnemySpeed() {
  return parseInt($('#enemy-stats').attr('data-speed'));
}

function getPlayerHp() {
  return parseInt($('#player-stats').attr('data-hp'));
}

function getEnemyHp() {
  return parseInt($('#enemy-stats').attr('data-hp'));
}

// Setters


function setPlayerHp(playerHp) {
  $('#player-stats').attr('data-hp', enemyHp);
  $('#player-hp').text(playerHp);
}

function setEnemyHp(enemyHp) {
  $('#enemy-stats').attr('data-hp', enemyHp);
  $('#enemy-hp').text(enemyHp);
}