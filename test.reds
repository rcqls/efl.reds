Red/System[]

#include %efl.reds

on-click: func [data [handle!] obj [handle!] event_info [handle!]] [
   print ["on_click" lf]
   evas_object_del data
   print ["on_click end" lf]
]

win-del: func [data [handle!] obj [handle!] event_info [handle!]] [
   elm_exit
]

_elm_startup_time: ecore_time_unix_get

elm_init null null

elm_policy_set 0 0

win: elm_win_util_standard_add "Main" "Hello, World!"
elm_win_autodel_set win yes
smart_callback_add(win "delete,request" :win-del null)

btn: elm_button_add win 
elm_object_part_text_set btn  null "Goodbye Cruel World"

smart_callback_add(btn "clicked" :on-click win)
elm_win_resize_object_add win btn
evas_object_resize win 400 400

evas_object_show btn
evas_object_show win

elm_run
elm_shutdown