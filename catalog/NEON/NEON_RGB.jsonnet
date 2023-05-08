local id = 'NEON/RGB';
local subdir = 'NEON';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.proprietary;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
  ],
  id: id,
  title: 'NEON Camera Imagery',
  'gee:type': ee_const.gee_type.image_collection,
  description: ||| 
	High resolution orthorectified camera images mosaicked and output 
	onto a fixed, uniform spatial grid using nearest-neighbor resampling; 
	spatial resolution is 0.1m. 
	The digital camera is part of a suite of instruments on the NEON 
	Airborne Observation Platform (AOP) that also includes a full-waveform, 
	small-footprint LiDAR system and the NEON Imaging Spectrometer. In the 
	orthorectification process, the digital imagery is remapped to the same 
	geographic projection as the LiDAR and imaging spectrometer data that is 
	acquired simultaneously. The resulting images will share the same map 
	projection grid space as the orthorectified spectrometer and LiDAR imagery. 
	Since the digital camera imagery is acquired at higher spatial resolution 
	than the imaging spectrometer data, it can aid in identifying features in 
	the spectrometer images including manmade features (e.g., roads, fence 
	lines, and buildings) that are indicative of land-use change. See 
	[NEON Data Product DP3.30010.001](https://data.neonscience.org/data-products/DP3.30010.001) for more details.
	Documentation: [NEON DP3.30010.001 Quick Start Guide](https://data.neonscience.org/api/v0/documents/quick-start-guides/NEON.QSG.DP3.30010.001v1?inline=true&fallback=html)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'airborne',
    'ecology',
    'neon',
  ],
  providers: [
    ee.producer_provider('NEON', 'https://www.neonscience.org/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent_global('2013-01-01T00:00:00Z', '2023-01-01T00:00:00Z'),
  summaries: {
    'gee:schema': [
      {
        name: 'AOP_VISIT_NUMBER',
        description: 'Unique visit number to the NEON site',
        type: ee_const.var_type.string,
      },     
      {
        name: 'FLIGHT_YEAR',
        description: 'Year the data were collected',
        type: ee_const.var_type.string,
      },  
      {
        name: 'NEON_DOMAIN',
        description: 'NEON ecoclimatic domain code, "D01" to "D20". See https://www.neonscience.org/field-sites/about-field-sites',
        type: ee_const.var_type.string,
      },
      {
        name: 'NEON_SITE',
        description: 'NEON four-digit site code. See https://www.neonscience.org/field-sites',
        type: ee_const.var_type.string,
      },
      {
        name: 'NEON_DATA_PROD_ID',
        description: 'NEON data product identification code: "DP3.30010.001"',
        type: ee_const.var_type.string,
      },
      {
        name: 'NEON_DATA_PROD_URL',
        description: 'NEON data product url: "https://data.neonscience.org/data-products/DP3.30010.001"',
        type: ee_const.var_type.string,
      },
	  {
        name: 'PRODUCT_TYPE',
        description: 'Acronym of the NEON data product type; RGB = Red Green Blue (Camera)',
        type: ee_const.var_type.string,
      },
      {
        name: 'SENSOR_NAME',
        description: 'Make and model of the camera sensor, eg. "Phase One iXM-RS150F"',
        type: ee_const.var_type.string,
      },
      {
        name: 'SENSOR_SERIAL',
        description: 'Serial number of the camera sensor, eg. "MM010175"',
        type: ee_const.var_type.string,
      },
      {
        name: 'RELEASE_TAG',
        description: 'NEON Release Tag. See https://www.neonscience.org/data-samples/data-management/data-revisions-releases',
        type: ee_const.var_type.string,
      },
    ],
	gsd: [
      1.0,
    ],
    platform: [
      'NEON',
    ],
    instruments: [
      'Phase One iXM-RS150F',
    ],
    'eo:bands': [
	 {
	  name:'B1',
	  description:'Red',
	  'gee:units':'unitless',
	 },
	 {
	  name:'B2',
	  description:'Green',
	  'gee:units':'unitless',
	 },
	 {
	  name:'B3',
	  description:'Blue',
	  'gee:units':'unitless',
	 },
    ],
    'gee:visualizations': [
      {
        display_name: 'RGB',
        lookat: {
          lat: 45.75,
          lon: -122.32,
          zoom: 12, 
        },
        image_visualization: {
          band_vis: {
            min: [
              0,
            ],
            max: [
              255,
            ],
            gamma: [
              2.5,
            ],
            bands: [
              'B1',
              'B2',
              'B3',
            ],
          },
        },
      },
    ],
  },
  'sci:citation': 'See https://data.neonscience.org/data-products/DP3.30010.001',
  'gee:terms_of_use': |||
	All data collected by NEON and provided as data products, with the 
	exception of data related to rare, threatened, or endangered (RTE) species, 
	are released to the public domain under [Creative Commons CC0 1.0 "No Rights Reserved"](https://creativecommons.org/publicdomain/zero/1.0/). 
	No copyright has been applied to NEON data; any person may copy, modify, 
	or distribute the data, for commercial or non-commercial purposes, without 
	asking for permission. NEON data may still be subject to other laws or rights 
	such as for privacy, and NEON makes no warranties about the data and disclaims 
	all liability. When using or citing NEON data, no implication should be made 
	about endorsement by NEON. In most countries, data and facts are not copyrightable. 
	By putting NEON data into the public domain, we encourage broad use, particularly 
	in scientific analyses and data aggregations. However, please be mindful of the 
	following scholarly norms: NEON data should be used in a way that is mindful of 
	the limitations of the data, using the documentation associated with the data 
	packages as a guide. Please refer to https://www.neonscience.org/data-samples/guidelines-policies 
	for detailed information on how to properly use and cite NEON data, as well as 
	best practices for publishing research that uses NEON data.
  |||,
}