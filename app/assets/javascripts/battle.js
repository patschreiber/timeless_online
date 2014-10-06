$(document).ready(function() {
  disableBattleActions();
  var playerAtb = playerAtbGauge(0, playerStats.speed);
  var enemyAtb = enemyAtbGauge(0, 50);

  battleInit();

});

$(document).on('click', '.action', function() {
  $('#player-atb-gauge').addClass('remove-progress-bar-transition');
  playerAtbGauge(0, playerStats.speed);
  disableBattleActions();
});

$(document).on('click', '.action', function() {
  var actionType = $(this).attr('data-action-type');
  var actionTaken = $(this).attr('id');

  switch(actionType) {
    case "attack":
      attack(playerStats.atk);
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

/*
Author: Patrick Schreiber
Date: 2014-09-29
Description: This fucntion enables the player's battle actions
*/
function enableBattleActions() {
  $('#attack, #skill, #magic, #item').removeAttr('disabled');
}

/*
Author: Patrick Schreiber
Date: 2014-09-29
Description: This fucntion enables the player's battle actions
*/
function disableBattleActions() {
  $('#attack, #skill, #magic, #item').attr('disabled', 'disabled');
}



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


// Enemy stuff


function enemyAi() {

}


/*
Author: Patrick Schreiber
Date: 2014-09-29
Description: This fucntion reads the skills available to the player in playerStats.magic, playerStats.skills, or playerStats.items and loads them as options when the battle starts
*/
function battleInit() {

  prepareActions("skills", Skills);
  prepareActions("magic", Magic);
  prepareActions("items", Items);
  instantiateEnemy(playerStats.level);

  function prepareActions(actionType, actionLibrary) {
    var availableAction = playerStats[actionType];
    var ul = $('#' + actionType + '-menu');

    $(availableAction).each(function(index, actionName) {
      var li = $('<li></li>').addClass('action')
                                      .attr('data-action-type', actionType)
                                      .attr('id', actionName)
                                      .appendTo(ul);
      var action = actionLibrary[actionName];

      $('<a>' + action.name + '</a>').attr('href', "#")
                                     .appendTo(li);
    });
  }

  /*
  Author: Patrick Schreiber
  Date: 2014-10-03
  Description: This fucntion creates an enemy based on the player's level. 
  */
  function instantiateEnemy(playerLevel) {

  }
}
















//This gets removed in time

var playerStats = {
  level: 3,
  hp: 100,
  atk: 2,
  def: 25,
  speed: 100,
  gold: 0,
  skills: ["sunsear", "bluntstrike", "phantasm"],
  magic: ["inferno"],
  items: ["potion"]
}



//Getters and setters


//Getters


function getPlayerHp() {
  if ( $('#player-hp').length ) {
    return parseInt($('#player-hp').attr('data-hp'));
  }
}

function getEnemyHp() {
  if ( $('#enemy-hp').length ) {
    return parseInt($('#enemy-hp').attr('data-hp'));
  }
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


var Enemies = {

  3: {
   0: {
    level: 1,
    name: "Rubicon",
    description: "A monster that looks like a river",
    atk: 3,
    def: 25,
    skills: ["sunsear", "bluntstrike", "phantasm"],
    magic: ["inferno"],
    loot: ["coin"]
   },
   1: {
    level: 3,
    name: "Minotaur",
    description: "Bull-headed beast",
    atk: 15,
    def: 3,
    skills: ["sunsear", "bluntstrike", "phantasm"],
    magic: ["inferno"]
   }
  },
  5: {},
  9: {},
  13: {},
  15: {},
  18: {}

}

//Skill types: damage, restoration, buff, debuff

var Skills = {

  bluntstrike: {
    id: 1,
    ap: 10,
    name: "Blunt Strike",
    description: "Cleave your weapon for 2x damage",
    type: "damage",
    action: function() {
      //2x weapon damage
      var enemyHp = getEnemyHp();
      enemyHp = enemyHp - (playerStats.atk * 2);
      setEnemyHp(enemyHp);
    }
  },
  sunsear: {
    id: 2,
    ap: 40,
    name: "Sun Phase",
    description: "Scorch an enemy with a concentrated blast of sunlight",
    type: "damage",
    action: function() {
      //Damage Enemy for 25 damage
      var enemyHp = getEnemyHp();
      enemyHp = enemyHp - 25;
      setEnemyHp(enemyHp);
    }
  },
  phantasm: {
    id: 3,
    ap: 110,
    name: "Phantasm",
    description: "Random damage that is influenced by your base attack",
    type: "damage",
    action: function() {
      //Random damage 
    }
  }
}

//Item types: restoration, restoration, buff, debuff

var Items = {
  potion: {
    id: 1,
    name: "Potion",
    consumable: true,
    maxStack: 99,

    action: function() {
      // Restores 25 HP
      var playerHp = getPlayerHp();
      playerHp = playerHp + 25;
      
      playerHp >= playerStats.hp ? setPlayerHp(playerStats.hp) : setPlayerHp(playerHp);
    }
  }
}

//Skill types: damage, restoration, buff, debuff, multipleEffect

var Magic = {
  inferno: {
    name: "Inferno",
    element: "fire",
    type: "damage",
    description: "Engulf enemies is a small blast of fire",
    action: function() {
      console.log("Inferno Fired");
    }
  }
}
