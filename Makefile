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

# The sources making up the files to copy to the extension dir
EXT_SRC =  \
  laser \
  submodules/svgtogcode/svg_to_gcode

# Build the Inkscape extention
extension:
	@rm -rf $(EXT_DIR)
	@mkdir -p $(EXT_DIR)
	for s in $(EXT_SRC); do \
		cp -v -aR $$s $(EXT_DIR) ; \
	done
