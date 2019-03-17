Red/System[]

#define handle! int-ptr!

_elm_startup_time: 0.0

#define LIBECORE-file	"libecore.so.1"
#define LIBEVAS-file "libevas.so.1"
#define LIBELM-file		"libelementary.so.1"

#define smart_callback_add(instance signal handler data) [
	evas_object_smart_callback_add instance signal as-integer handler data
]

#import [
	LIBECORE-file cdecl [
		ecore_time_unix_get: "ecore_time_unix_get" [
			return: [float!]
		]
	]
	LIBEVAS-file cdecl [
		evas_object_resize: "evas_object_resize" [
			win 	[handle!]
			width	[integer!]
			height	[integer!]
		]
		evas_object_show: "evas_object_show" [
			win		[handle!]
		]
		evas_object_smart_callback_add: "evas_object_smart_callback_add" [
			instance	[handle!]
			signal		[c-string!]
			handler		[integer!]
			data		[int-ptr!]
		]
		evas_object_del: "evas_object_del" [
			obj			[int-ptr!]
		]
	]
	LIBELM-file cdecl [
		elm_init: "elm_init" [
			nb		[integer!]
			args	[byte-ptr!]
		]
		elm_run: "elm_run" []
		elm_exit: "elm_exit" []
		elm_shutdown: "elm_shutdown" []
		elm_win_autodel_set: "elm_win_autodel_set" [
			win		[handle!]
			state	[logic!]
		]
		elm_policy_set: "elm_policy_set" [
			policy 	[integer!]
			value	[integer!]
		]
		elm_win_util_standard_add: "elm_win_util_standard_add" [
			name	[c-string!]
			title	[c-string!]
			return:	[handle!]
		]
		elm_button_add: "elm_button_add" [
			win 	[handle!]
			return: [handle!]
		]
		elm_object_part_text_set: "elm_object_part_text_set" [
			obj		[handle!]
			part 	[c-string!]
			text 	[c-string!]
		]
		elm_win_resize_object_add: "elm_win_resize_object_add" [
			obj 	[handle!]
			subobj	[handle!]
		]
	]
]