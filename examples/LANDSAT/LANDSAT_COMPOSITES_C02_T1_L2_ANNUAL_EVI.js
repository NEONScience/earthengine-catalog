var dataset = ee.ImageCollection('LANDSAT/COMPOSITES/C02/T1_L2_ANNUAL_EVI')
                  .filterDate('2023-01-01', '2023-12-31');
var colorized = dataset.select('EVI');
var colorizedVis = {
  min: 0,
  max: 1,
  palette: [
    'ffffff', 'ce7e45', 'df923d', 'f1b555', 'fcd163', '99b718', '74a901',
    '66a000', '529400', '3e8601', '207401', '056201', '004c00', '023b01',
    '012e01', '011d01', '011301'
  ],
};
Map.setCenter(9.6568, 50.8874, 6);
Map.addLayer(colorized, colorizedVis, 'Colorized');
