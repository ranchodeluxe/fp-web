(function(exports){
  "use strict";

  var FP = exports.FP || (exports.FP = {});
  var Map = FP.map || (FP.map = {});

  // TODO: write something helpful
  function deriveBbox(settings) {

    // bbox = [west, south, east, north]
    if (settings.bbox && settings.bbox instanceof Array && settings.bbox.length === 4) {
      var sw = L.latLng(settings.bbox[1], settings.bbox[0]),
          ne = L.latLng(settings.bbox[3], settings.bbox[2]),
          bds = L.latLngBounds(sw, ne);

      if (bds.isValid()) return bds;
    }

    return null;
  }

  var locatorMapOptions = {
    attributionControl: false
  };

  Map.snapshot = function(selector, settings) {
    var __ = {};
    var mapOptions = L.Util.extend({}, locatorMapOptions, FP.map.options);
    mapOptions.minZoom = settings.min_zoom || 16;
    mapOptions.maxZoom = settings.max_zoom || 18;
    var bbox = deriveBbox(settings);

    var map = L.map(selector, mapOptions);//.setView(bbox.getCenter(), 17);
    if (bbox) map.fitBounds(bbox);

    var template = settings.base_url + '/{z}/{x}/{y}.png';

    L.tileLayer(template, {
      attribution: '',
      maxZoom: mapOptions.maxZoom
    }).addTo(map);

    return __;
  };


})(this);
