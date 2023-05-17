var dsm = ee.ImageCollection("projects/neon-prod-earthengine/assets/DP3-30024-001")
  .filterDate('2021-01-01', '2021-12-31')
  .filterMetadata('NEON_SITE', 'equals', 'SOAP')
  .select('DSM')
  .first();

var dtm = ee.ImageCollection("projects/neon-prod-earthengine/assets/DP3-30024-001")
  .filterDate('2021-01-01', '2021-12-31')
  .filterMetadata('NEON_SITE', 'equals', 'SOAP')
  .select('DTM')
  .first();
  
var dsm = dsm.updateMask(dsm.gte(0.0000));
var dtm = dtm.updateMask(dtm.gte(0.0000));
  
var demVis = {min: 600, max: 2300, gamma: 0.5};
Map.setCenter(-119.25, 37.06, 12);
Map.addLayer(dsm, demVis, 'SOAP 2021 Digital Surface Model');
Map.addLayer(dtm, demVis, 'SOAP 2021 Digital Terrain Model');
