all: libcutils.so  libhardware_legacy.so  libhardware.so  liblog.so

libcutils.so: 
	adb pull /system/lib/libcutils.so .

libhardware_legacy.so: 
	adb pull /system/lib/libhardware_legacy.so .

libhardware.so: 
	adb pull /system/lib/libhardware.so .

liblog.so: 
	adb pull /system/lib/liblog.so .

clean:
	rm -Rf *.so
