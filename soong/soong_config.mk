du_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '    "Needs_prelink_support": $(if $(filter true,$(TARGET_NEEDS_PRELINK_SUPPORT)),true,false),'; \
	echo '    "Has_legacy_camera_hal1": $(if $(filter true,$(TARGET_HAS_LEGACY_CAMERA_HAL1)),true,false),'; \
	echo '    "Uses_media_extensions": $(if $(filter true,$(TARGET_USES_MEDIA_EXTENSIONS)),true,false),'; \
	echo '    "Needs_text_relocations": $(if $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)),true,false),'; \
	echo '    "Has_legacy_mmap": $(if $(filter true,$(BOARD_USES_LEGACY_MMAP)),true,false),'; \
	echo '') > $(SOONG_VARIABLES_TMP)
