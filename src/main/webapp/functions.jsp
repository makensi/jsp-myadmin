<%
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
%>
<%!
public int mysql_num_rows(ResultSet rset) throws SQLException {
	int current = 0;
	try {
		if (!rset.isBeforeFirst()) {
			current = rset.getRow();
			rset.beforeFirst();
		}
	} catch (Exception e) {
			return -1;
	}
	int number_of_rows=0;
	while (rset.next()) {
			number_of_rows++;
	}
	if (current!=0) {
		rset.absolute(current);
	} else {
		rset.beforeFirst();
	}
	return number_of_rows;
}
%>