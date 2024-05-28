# The directory of the main repo
WORK_DIR=$1

# pwd 之后和 $WORK_DIR 拼接为绝对路径
ABSOLUTE_PATH=$(pwd)

# 如果WORK_DIE不为空或者不等于 "./"，那么就进行拼接
if [ "$WORK_DIR" != "" ] && [ "$WORK_DIR" != "./" ]; then
	ABSOLUTE_PATH+="/$WORK_DIR"
fi
PATCH_TOOL_DIR=$ABSOLUTE_PATH/tools/patch_tool
echo $PATCH_TOOL_DIR
# The package which needs to be patched
# It always be the package which triggers the test
PATCH_PACKAGE=$2

# The URL of the patch points to
PATCH_TARGET_URL=$3

# The commit hash of the patch
PATCH_COMMIT_HASH=$4

# To do the patch for current commit
cd $PATCH_TOOL_DIR
echo "cargo run -- ../../os $PATCH_PACKAGE $PATCH_TARGET_URL $PATCH_COMMIT_HASH"
cargo run -- ../../os $PATCH_PACKAGE $PATCH_TARGET_URL $PATCH_COMMIT_HASH
