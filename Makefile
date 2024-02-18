# Various tools to help with testing and Inkscape extension building

# The name of the dir in which the final extension will be built. This full dir
# or it's contents can be copied, or symlinked to the Inscape extensions dir path
# NOTE that this path is DELETED on every extension build. Also note that
# although this dir is removed completely, it does support using subdirs if
# that will make distribution easier.
# For example `ext_dir/laser` is totally valid and will build the extension
# content inside the `laser` sub-dir, but the top level `ext_dir` and
# EVERYTHING below it will be removed on every build.
EXT_DIR = _inks_ext

# The top level `laser` dir that will go under EXT_DIR
SRC_LASER = laser
# The SvgToGcode source dir we get from the submodules dir. This is the actual
# `svg_to_gcode` module that will be copied into the `laser` dir above.
SRC_STG = submodules/svgtogcode/svg_to_gcode

# Build the Inkscape extention
extension:
	@rm -rf $(EXT_DIR)
	@mkdir -p $(EXT_DIR)
	@cp -v -aR $(SRC_LASER) $(EXT_DIR)/$(SRC_LASER)
	@cp -v -aR $(SRC_STG) $(EXT_DIR)/$(SRC_LASER)
