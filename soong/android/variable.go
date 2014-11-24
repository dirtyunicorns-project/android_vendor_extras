package android
type Product_variables struct {
	Has_legacy_camera_hal1 struct {
		Cflags []string
	}

	Uses_media_extensions struct {
		Cflags []string
	}

	Needs_text_relocations struct {
		Cppflags []string
	}

	Has_legacy_mmap struct {
		Cppflags []string
	}

	Needs_prelink_support struct {
		Cppflags []string
	}

	Needs_non_pie_support struct {
		Cppflags []string
	}
}

type ProductVariables struct {
	Has_legacy_camera_hal1  *bool `json:",omitempty"`
	Uses_media_extensions   *bool `json:",omitempty"`
	Needs_text_relocations  *bool `json:",omitempty"`
	Has_legacy_mmap  *bool `json:",omitempty"`
	Needs_prelink_support  *bool `json:",omitempty"`
	Needs_non_pie_support  *bool `json:",omitempty"`
}
