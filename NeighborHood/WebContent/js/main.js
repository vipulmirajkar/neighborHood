/**
 * Written and maintained by: Vipul Mirajkar
 */

window.location.hash = "back-disable";
window.location.hash = "Again-No-back-button";// again because google chrome
												// don't insert first hash into
												// history
window.onhashchange = function() {
	window.location.hash = "back-disable";
};