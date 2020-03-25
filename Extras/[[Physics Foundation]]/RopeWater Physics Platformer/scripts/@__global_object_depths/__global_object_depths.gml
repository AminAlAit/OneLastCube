// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -99; // oGame
global.__objectDepths[1] = 0; // oParSolid
global.__objectDepths[2] = 0; // oBlock
global.__objectDepths[3] = 0; // oMover
global.__objectDepths[4] = 11; // oFloater
global.__objectDepths[5] = 0; // oSlopeR
global.__objectDepths[6] = 0; // oSlopeL
global.__objectDepths[7] = 0; // oSlopeR2
global.__objectDepths[8] = 0; // oSlopeL2
global.__objectDepths[9] = 11; // oPlayer
global.__objectDepths[10] = 11; // oPlayerSword
global.__objectDepths[11] = -2; // oCamera
global.__objectDepths[12] = 0; // oRopeSpawner
global.__objectDepths[13] = 0; // oRopeSegment
global.__objectDepths[14] = 0; // oBridgeSpawner
global.__objectDepths[15] = 1; // oBridgePin
global.__objectDepths[16] = 1; // oBridgeSegment
global.__objectDepths[17] = 10; // oWaterMask
global.__objectDepths[18] = 10; // oShallowWaterMask
global.__objectDepths[19] = 1; // oWater
global.__objectDepths[20] = 0; // objSplash


global.__objectNames[0] = "oGame";
global.__objectNames[1] = "oParSolid";
global.__objectNames[2] = "oBlock";
global.__objectNames[3] = "oMover";
global.__objectNames[4] = "oFloater";
global.__objectNames[5] = "oSlopeR";
global.__objectNames[6] = "oSlopeL";
global.__objectNames[7] = "oSlopeR2";
global.__objectNames[8] = "oSlopeL2";
global.__objectNames[9] = "oPlayer";
global.__objectNames[10] = "oPlayerSword";
global.__objectNames[11] = "oCamera";
global.__objectNames[12] = "oRopeSpawner";
global.__objectNames[13] = "oRopeSegment";
global.__objectNames[14] = "oBridgeSpawner";
global.__objectNames[15] = "oBridgePin";
global.__objectNames[16] = "oBridgeSegment";
global.__objectNames[17] = "oWaterMask";
global.__objectNames[18] = "oShallowWaterMask";
global.__objectNames[19] = "oWater";
global.__objectNames[20] = "objSplash";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for