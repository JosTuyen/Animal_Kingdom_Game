"use strict";

class Game {
  constructor() {
    //n rand 8...12: pusher rand bottomrow facing N
		//tgt edge
		this.state = 0;
		this.moves = 0;
		//bob direction Up - Right - Down - Left
		this.rDirec = [-1,0,1,0];
		this.cDirec = [0,1,0,-1];
		this.listValue = [1,1,2,3,0,0,0,0,0,0];
		//Generate table size, position of target & bob
		this.n = 8+Math.floor(Math.random()*5);
		this.targ = {"r":0, "c":0, "wt":0};
		this.bob = {"r":0, "c":0, "dir":0, "origin":0};
		this.bob.r = this.n-1;
		this.bob.origin = this.bob.c = Math.floor(Util.random()*(this.n-1));
		this.targ.c = Math.floor(Util.random()*(this.n-2)+1);
		this.targ.r = Math.floor(Util.random()*(this.n-2)+1);
		//Generate new board
		this.b = [];

		for(var r = 0;r < this.n;r++){
			var col =[];
			for(var c = 0; c < this.n;c++){
				var idx = Math.floor(Util.random()*this.listValue.length);
				col[c]=this.listValue[idx];
			}
			this.b[r] = col;
		}
		this.targ.wt = this.b[this.targ.r][this.targ.c] = Math.floor(Util.random()*3)+1;
		this.b[this.bob.r][this.bob.c] = 0;
  }

  legalRC(r,c) {
    return r >= 0, c >= 0, r < this.n, c <this.n;
  }

	count(dr, dc, wtLimit) {
		var r = this.bob.r + dr;
		var c = this.bob.c + dc;
		var tot=0;  //total push weight
		var q = 0;  //num crates being pushed
		while( this.legalRC(r,c) ){
				tot = tot + this.b[r][c];
				if(tot > wtLimit) return -1;
				if(this.b[r][c]===0) return q;
				q = q+1;
				r=r+dr; c=c+dc;
		}
		return -1;
	}

	move(command) {
		var ret = this;
		ret.kind = "illegal";
		if(this.state==1) return ret;

		switch (command) {
			case 120: var tempDir = 4; //Explode - x
				break;
			case 119: var tempDir = 0; //Up - w
				break;
			case 100: var tempDir = 1; //Right - d
				break;
			case 115: var tempDir = 2; //Down - s
				break;
			case 97: var tempDir = 3; //Left - a
				break;
			default:
				return ret;
		}
		if(tempDir === 4){
			var r = this.bob.r + this.rDirec[this.bob.dir];
			var c = this.bob.c + this.cDirec[this.bob.dir];
			if(this.legalRC(r,c) && this.b[r][c] != 0 && !(r == this.targ.r && c == this.targ.c)){
				this.b[r][c] = 0;
				this.moves += 100;
				ret.kind = "explode";
				return ret;
			}else {return ret;}
		}
		else if( tempDir === this.bob.dir || (4 + tempDir - this.bob.dir) % 4 === 2){
				var wtLimit = (tempDir === this.bob.dir) ? 3 : 0;    //can push crates backing up
				var ct = this.count(this.rDirec[tempDir], this.cDirec[tempDir],wtLimit);
				if(ct < 0) return {"illegal":true};
				while(ct >= 0){
						var r = this.bob.r + ct * this.rDirec[tempDir];
						var c = this.bob.c + ct * this.cDirec[tempDir];
						if(r === this.targ.r && c === this.targ.c){
							this.targ.r += this.rDirec[tempDir];
							this.targ.c += this.cDirec[tempDir];
						}
						this.b[r + this.rDirec[tempDir]][c + this.cDirec[tempDir]] = this.b[r][c];
						ct--;
				}
				this.bob.r += this.rDirec[tempDir]; this.bob.c += this.cDirec[tempDir];
				this.moves ++;
				if(this.targ.r == this.n-1 && this.targ.c == this.bob.origin) this.state = 1; //victory
				if( tempDir === this.bob.dir){
						ret.kind = "push";
						return ret;
				}else{
						ret.kind = "back";
						return ret;
				}
		}else{
				this.bob.dir = tempDir;
				this.moves ++;
				ret.kind = "turn";
				return ret;
		}
	}
}

class DrawTable {
  constructor(data){
    this.zebra = new Image();
  	this.croco = new Image();
  	this.eleph_u = new Image();
  	this.giraf = new Image();
  	this.goril = new Image();
  	this.pengu = new Image();
  	this.snake = new Image();

  	this.zebra.src = 'Libraries/Pictures/zebra.png';
  	this.croco.src = 'Libraries/Pictures/crocodile.png';
  	this.eleph_u.src = 'Libraries/Pictures/elephant_u.png';
  	this.giraf.src = 'Libraries/Pictures/giraffe.png';
  	this.goril.src = 'Libraries/Pictures/gorilla.png';
  	this.pengu.src = 'Libraries/Pictures/penguin.png';
  	this.snake.src = 'Libraries/Pictures/snake.png';
  	this.listWage = [this.snake, this.goril, this.croco];
  	this.listTarg = ["", this.pengu, this.zebra, this.giraf];
  	//==================drawTable================
  	this.graphic = document.getElementById('graphic');
  	this.table = this.graphic.getContext("2d");
  	this.graphic.width = data.n*40;
  	this.graphic.height = data.n*40;
  	this.table.lineWidth = 2;

  	for(var s = 1; s<=data.n; s++){
  		this.table.moveTo(s*40,0);
  		this.table.lineTo(s*40,data.n*40);
  		this.table.moveTo(0,s*40);
  		this.table.lineTo(data.n*40,s*40);
  		this.table.stroke();
  	}
  }
}

function showBoard(data, drawTable) {
	//=================importPicture==============
  var background = new Image();
  background.src = 'Libraries/Pictures/bkgr_rain.jpg';
	//=================fillAnimal==================
	background.onload = function () {
		drawTable.table.drawImage(background,0,0,drawTable.graphic.width,drawTable.graphic.height);
    drawTable.table.fillStyle = "#ff751a";
    drawTable.table.fillRect(40*data.bob.origin,(data.n-1)*40,40,40);
		for(var r = 0; r < data.n; r++){
			for(var c = 0; c < data.n; c++){
				if(r == data.targ.r && c == data.targ.c)
					drawTable.table.drawImage(drawTable.listTarg[data.targ.wt],40*c+3,40*r+3,34,34);

				else if( r == data.bob.r && c == data.bob.c)
          Util.drawRotatedImage(drawTable.table, data.bob.dir*Math.PI/2, drawTable.eleph_u, 40*c+3, 40*r+3, 34, 34);

				else if(data.b[r][c]>0)
						drawTable.table.drawImage(drawTable.listWage[data.b[r][c]-1],40*c+3,40*r+3,34,34);
			}
		}
		drawTable.table.stroke();
	}

	document.getElementById("moves").innerHTML = "Moves: "+data.moves;
}
//===================Running Time==================
window.onload = function(){
	var game = new Game();
	var start = true;
	var t;
	var count = 0;
  var drawTable = new DrawTable(game);
  if(document.readyState == 'complete')
	document.onkeypress =  function (ev){
		if(start){
			timeCount();
			start = false;
		}
		if(game.state == 1) {
			clearTimeout(t);
			var r = confirm("You Won!\nYour moves is "+ game.moves
											+"\nYour time is "+ Math.floor(count / 3600) +
											":" + checkTime(Math.floor(count / 60)) +
											":" + checkTime(count % 60)
											+"\nDo you want to play a new game?");
			if (r == true) {
				location.reload();
			}
		}
			var key = ev.keyCode;
			var ret = game.move(key);
			showBoard(game, drawTable);
	};
	showBoard(game, drawTable);
	//Calculate time and showClock
	function timeCount() {
		count += 1;
		var h = Math.floor(count / 3600);
		var m = Math.floor(count / 60);
		var s = count % 60;
		m = checkTime(m);
		s = checkTime(s);
		document.getElementById('txt').innerHTML =
		"Time: "+ h + ":" + m + ":" + s;
		t = setTimeout(timeCount, 1000);
	}
};
// add zero in front of numbers < 10
function checkTime(i) {
	if (i < 10) {i = "0" + i};
	return i;
}
