/*
 * This file is part of JSPMyAdmin.
 * 
 * https://code.google.com/p/jsp-myadmin/
 * 
 * JSPMyAdmin is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * JSPMyAdmin is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with JSPMyAdmin.  If not, see <http://www.gnu.org/licenses/>.
 */

function dTable(url){
	var retcode = true;
	retcode = confirm('Are you sure, you want to delete the table with all the data?');
	
	if (retcode){
	    window.location.href = url;
	}
}

function dData(url){
	var retcode = true;
	retcode = confirm('Are you sure, you want to delete all the data in table?');

	if (retcode){
	    window.location.href = url;
	}
}

function dRecord(url){
	var retcode = true;
	retcode = confirm('Are you sure, you want to delete the record?');

	if (retcode){
	    window.location.href = url;
	}
}

function dDatabase(url){
	var retcode = true;
	retcode = confirm('Are you sure, you want to delete the database?');

	if (retcode){
	   window.location.href = url;
	}
}
