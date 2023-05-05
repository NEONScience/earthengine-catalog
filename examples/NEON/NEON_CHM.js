var chm = ee.ImageCollection("projects/neon-prod-earthengine/assets/DP3-30015-001")
  .filterDate('2021-01-01', '2021-12-31')
  .filterMetadata('NEON_SITE', 'equals', 'SOAP');
  
var chmVis = {min: 0, max: 35, gamma: 0.5};
Map.setCenter(-119.25, 37.06, 12);
Map.addLayer(chm, chmVis, 'SOAP 2021 Canopy Height Model');