all: libs/armeabi/libssl.a

libs/armeabi/libssl.a: Android.mk staticlibs
	$(NDK_ROOT)/ndk-build NDK_APPLICATION_MK=`pwd`/Application.mk NDK_APP_OUT=. TARGET_PLATFORM=android-21

staticlibs: FORCE
	make -C staticlibs

clean:
	rm -Rf libs
	rm -Rf local

FORCE:
	