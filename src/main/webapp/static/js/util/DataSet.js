/**
 * 类似Java中的Set的数据结构
 */

function DataSet() {
	this.items = {};
}
DataSet.prototype = {
		constructor: DataSet, 
		has: function (val) {
			return this.items.hasOwnProperty(val);
		}, 
		add: function (val) {
			if (!this.has(val)) {
				this.items[val] = val;
				return true;
			}
			return false;
		}, 
		remove: function (val) {
			if (this.has(val)) {
				delete this.items[val];
				return true;
			}
			return false;
		}, 
		clear: function () {
			this.items = {};
			return true;
		}, 
		size: function () {
			var count = 0;
			for (var prop in this.items) {
				count++;
			}
			return count;
		}, 
		toString: function (sign) {
			if (!sign) {
				sign = ",";
			}
			var str = "";
			for (var prop in this.items) {
				str += prop + sign;
			}
			if (str != "") {
				str = str.substring(0, str.length - 1);
			}
			return str;
		}
};