var dataset = ee.ImageCollection("projects/neon-nonprod-earthengine/assets/DP3-30006-001")
  .filterDate('2021-01-01', '2021-12-31')
  .filterMetadata('NEON_SITE', 'equals', 'MCRA');
  
var rgb = dataset.select(['B053', 'B035', 'B019']);
var rgbVis = {min: 103, max: 1160, gamma: 1.3};
Map.setCenter(-122.154, 44.268, 14);
Map.addLayer(rgb, rgbVis, 'Spectrometer Directional Reflectance RGB');