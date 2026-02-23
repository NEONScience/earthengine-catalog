// Read in the NEON AOP CNC Image Collection
var cnc = ee.ImageCollection(
  'projects/neon-prod-earthengine/assets/CNC/002');

// Display available images in the CNC Image Collection
print('NEON CNC Images', cnc.aggregate_array('system:index'))

// Filter by specific image index
var selected_image = cnc.filter(ee.Filter.eq('system:index', '2019_HARV_6')).first();

// Mask nitrogen band using nitrogen_valid band
var nit_valid = selected_image.select('nitrogen_valid');
selected_image = selected_image.updateMask(nit_valid);

// Define the visualization parameters
// Note: The min/max values below use a 95% stretch (2.5-97.5 percentile)
var visParams = {bands: ['nitrogen'], min: 1.32, max: 2.23, palette: ['darkblue', 'blue', 'cyan', 'yellow', 'orange', 'white']};

// Add the layer to the map and center on the site
Map.addLayer(selected_image, visParams, 'HARV 2019 Nitrogen (%)');
Map.centerObject(selected_image);