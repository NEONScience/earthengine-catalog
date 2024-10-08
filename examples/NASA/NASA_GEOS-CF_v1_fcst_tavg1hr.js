var imageVisParamNO2 = {
  'bands': ['NO2'],
  'min': 6.96e-11,
  'max': 4.42e-8,
};

var imageVisParamT = {
  'bands': ['T'],
  'min': 220,
  'max': 320,
  'palette': ['d7191c', 'fdae61', 'ffffbf', 'abd9e9', '2c7bb6'],
};

var geosCf = ee.ImageCollection('NASA/GEOS-CF/v1/fcst/tavg1hr');

Map.setCenter(100, 20, 3);

var weeklyT =
    geosCf.select('T').filterDate('2022-11-01', '2022-11-08').median();
Map.addLayer(weeklyT, imageVisParamT, 'Weekly T', false, 1);

var NO2 = ee.Image('NASA/GEOS-CF/v1/fcst/tavg1hr/20220921_12z-20220921_1230z');
Map.addLayer(NO2, imageVisParamNO2, 'NO2', true, 1);
