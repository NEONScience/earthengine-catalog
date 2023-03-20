var dsm = ee.ImageCollection("projects/neon-nonprod-earthengine/assets/DP3-30024-001")
  .filterDate('2021-01-01', '2021-12-31')
  .filterMetadata('NEON_SITE', 'equals', 'MCRA')
  .filterMetadata('PRODUCT_TYPE', 'equals', 'DSM');
  
var dsmVis = {min: 800, max: 1600, gamma: 1.0};
Map.setCenter(-122.154, 44.268, 14);
Map.addLayer(dsm, dsmVis, 'MCRA 2021 Digital Surface Model');