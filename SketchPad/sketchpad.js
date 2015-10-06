var gridSize = 16;
var choice = -1;

$(document).ready(function() {

	generateGrid(gridSize,0);
	setUpButtons();

});

function generateRandomColor() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

function generateGrid(size,choice) {

	$('.container-grid').append('<table></table>');
	for (var i=0; i<size; i++) {
		$('table').append('<tr></tr>');
	}
	for (var j=0; j<size; j++) {
		$('tr').append('<td></td>');
	}

	switch (choice) {
		//regular
		case 0:
			$('td').hover(function() {
				$(this).css('opacity', 1);
			});
			break;
		//random
		case 1:
			$('td').hover(function() {
				var color = generateRandomColor();
				$(this).css('opacity',1);
				$(this).css('background-color', color);
			});
			break;
		//trail
		case 2:
			$('td').mouseenter(function() {
				$(this).animate({backgroundColor: '#000000'},'fast'),
				$(this).animate({backgroundColor: '#dfdfdf'},'slow');
			});
			break;
		//opaque
		case 3:
			$('td').hover(function() {
				$(this).css({'opacity':'+=.1'});
			});
		default:
			break;
	}
}

function setUpButtons() {
	$('button').click(function() {
		if (this.id=='clear') {
			clearGrid();
			return;
		}
		gridSize = prompt("Please input a value from 1 - 128","");
		if (gridSize==null) {
			return;
		}
		while (gridSize<=0 || gridSize>128) {
			gridSize = prompt("Number out of range! Please input a value from 1 - 128","");
		}
		choice = -1;
		switch(this.id) {
			case 'regular':
				choice = 0;
				break;
			case 'random':
				choice = 1;
				break;
			case 'trail':
				choice = 2;
				break;
			case 'opacity':
				choice = 3;
				break;
		}
		clearGrid();
	})
}

function clearGrid() {
	$('table').remove();
	generateGrid(gridSize,choice);
}