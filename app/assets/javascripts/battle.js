$(document).ready(function() {
  disableBattleActions();
  var playerAtb = playerAtbGauge(0, getPlayerSpeed());
  var enemyAtb = enemyAtbGauge(0, 50);
});

$(document).on('click', '.action', function() {
  $('#player-atb-gauge').addClass('remove-progress-bar-transition');
  playerAtbGauge(0, getPlayerSpeed());
  disableBattleActions();
});

$(document).on('click', '#dev-button', function() {
  console.log(getPlayerHp());
  console.log(getPlayerMp());
  console.log(getPlayerAttack());
  console.log(getPlayerSpeed());
});

function playerAtbGauge(count, speed) {
  var timer = setInterval(function() {
    count++;
    $('#player-atb-gauge').css('width', count + '%')
    if (count >= 100) {
      clearInterval(timer);
      enableBattleActions();
    }
  }, speed);
}

function enemyAtbGauge(count, speed) {
  var timer = setInterval(function() {
    count++;
    $('#enemy-atb-gauge').css('width', count + '%')
    if (count >= 100) {
      clearInterval(timer);
      enemyAi();
    }
  }, speed);
}

function enableBattleActions() {
  $('#attack, #skill, #magic, #item').removeAttr('disabled');
}

function disableBattleActions() {
  $('#attack, #skill, #magic, #item').attr('disabled', 'disabled');
}


$(document).on('click', '.action', function() {
  var actionType = $(this).attr('data-action-type');
  var actionTaken = $(this).attr('id');

  switch(actionType) {
    case "attack":
      attack(getPlayerAttack());
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

// Player actions


function attack(baseAtk) {
  var enemyHp = getEnemyHp();

  // Basic damage calculation
  enemyHp = enemyHp - baseAtk;

  // Set the enemy's new remaining HP
  setEnemyHp(enemyHp);
}

function skills(skillUsed) {
  Skills[skillUsed].action();
}

function magic(magicUsed) {
  Magic[magicUsed].action();
}

function items(itemUsed) {
  Items[itemUsed].action();
}


function enemyAi() {

}


//Getters and setters


//Getters

function getPlayerHp() {
  return parseInt($('#player-hp').attr('data-hp'));
}

function getPlayerMp() {
  return parseInt($('#player-mp').attr('data-mp'));
}

function getPlayerSpeed() {
  return parseInt($('#player-stats').attr('data-speed'));
}

function getPlayerAttack() {
  return parseInt($('#player-stats').attr('data-base-attack'));
}

function getEnemyHp() {
  return parseInt($('#enemy-hp').attr('data-hp'));
}


// Setters


function setPlayerHp(playerHp) {
  if ( $('#player-hp').length ) {
    $('#player-hp').text(playerHp).attr('data-hp', playerHp);
  }
}

function setEnemyHp(enemyHp) {
  if ( $('#enemy-hp').length ) {
    $('#enemy-hp').text(enemyHp).attr('data-hp', enemyHp);
  }
}