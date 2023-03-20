var dataset = ee.ImageCollection("projects/neon-nonprod-earthengine/assets/DP3-30010-001")
  .filterDate('2021-01-01', '2021-12-31')
  .filterMetadata('NEON_SITE', 'equals', 'MCRA');
  
print(dataset)
  
var rgb = dataset.select(['B1', 'B2', 'B3']);
var rgbVis = {min: 50, max: 200, gamma: 0.5};
Map.setCenter(-122.154, 44.268, 14);
Map.addLayer(rgb, rgbVis, 'AOP RGB Camera Imagery');