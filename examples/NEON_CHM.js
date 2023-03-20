var chm = ee.ImageCollection("projects/neon-nonprod-earthengine/assets/DP3-30015-001")
  .filterDate('2021-01-01', '2021-12-31')
  .filterMetadata('NEON_SITE', 'equals', 'MCRA');
  
var chmVis = {min: 0, max: 50, gamma: 0.5};
Map.setCenter(-122.154, 44.268, 14);
Map.addLayer(chm, chmVis, 'MCRA 2021 Canopy Height Model');