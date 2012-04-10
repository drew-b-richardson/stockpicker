/*
	Formerize 0.1: Makes mediocre forms a little less mediocre
	By nodethirtythree design | http://nodethirtythree.com/
	Tested on IE6, IE7, IE8, Firefox 3.6, Opera 10, Safari 5, and Chrome 5.
	Dual licensed under the MIT or GPL license.
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	MIT LICENSE:
	Copyright (c) 2010 nodethirtythree design, http://nodethirtythree.com/
	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
	files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use,
	copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
	Software is furnished to do so, subject to the following conditions:
	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
	OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
	HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	GPL LICENSE:
	Copyright (c) 2010 nodethirtythree design, http://nodethirtythree.com/
	This program is free software: you can redistribute it and/or modify it	under the terms of the GNU General Public License as
	published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is
	distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
	or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have received a copy of
	the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>. 
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
*/
(function(a){jQuery.fn.formerize=function(){jQuery(this).find("input[type=password]").each(function(){var a=jQuery(this),b=jQuery(jQuery("<div>").append(a.clone()).remove().html().replace(/type="password"/i,'type="text"').replace(/type=password/i,"type=text"));a.attr("id")!=""&&b.attr("id",a.attr("id")+"_fakeformerizefield"),a.attr("name")!=""&&b.attr("name",a.attr("name")+"_fakeformerizefield"),b.addClass("blank").val(b.attr("title")).insertAfter(a),a.val()==""?a.hide():b.hide(),a.blur(function(a){a.preventDefault();var b=jQuery(this),c=b.parent().find("input[name="+b.attr("name")+"_fakeformerizefield]");b.val()==""&&(b.hide(),c.show())}),b.focus(function(a){a.preventDefault();var b=jQuery(this),c=b.parent().find("input[name="+b.attr("name").replace("_fakeformerizefield","")+"]");b.hide(),c.show().focus()}),b.keypress(function(a){a.preventDefault(),b.val("")})}),jQuery(this).find("input[type=text],textarea").each(function(){var a=jQuery(this);if(a.val()==""||a.val()==a.attr("title"))a.addClass("blank"),a.val(a.attr("title"))}).blur(function(){var a=jQuery(this);if(a.attr("name").match(/_fakeformerizefield$/))return;a.val()==""&&(a.addClass("blank"),a.val(a.attr("title")))}).focus(function(){var a=jQuery(this);if(a.attr("name").match(/_fakeformerizefield$/))return;a.val()==a.attr("title")&&(a.removeClass("blank"),a.val(""))}),jQuery(this).submit(function(){jQuery(this).find("input[type=text],textarea").each(function(a){var b=jQuery(this);b.attr("name").match(/_fakeformerizefield$/)&&b.attr("name",""),b.val()==b.attr("title")&&(b.removeClass("blank"),b.val(""))})}).bind("reset",function(a){a.preventDefault(),jQuery(this).find("select").val(jQuery("option:first").val()),jQuery(this).find("input,textarea").each(function(){var a=jQuery(this),b;a.removeClass("blank");switch(this.type){case"password":a.val(a.attr("defaultValue")),b=a.parent().find("input[name="+a.attr("name")+"_fakeformerizefield]"),a.val()==""?(a.hide(),b.show()):(a.show(),b.hide());break;case"checkbox":case"radio":a.attr("checked",a.attr("defaultValue"));break;case"text":case"textarea":a.val(a.attr("defaultValue")),a.val()==""&&(a.addClass("blank"),a.val(a.attr("title")));break;default:a.val(a.attr("defaultValue"))}})})}})(jQuery);