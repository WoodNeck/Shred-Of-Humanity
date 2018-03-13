stage = argument0;

ini_open(working_directory + "save.ini");
ini_write_real("SAVE", "STAGE" + string(stage - 1), 1);
ini_close();
