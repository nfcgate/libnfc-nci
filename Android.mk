LOCAL_PATH:= $(call my-dir)
NFA := src/nfa
NFC := src/nfc
HAL := src/hal
UDRV := src/udrv
HALIMPL := halimpl/bcm2079x
D_CFLAGS := -DANDROID -DBUILDCFG=1 -DHAVE_SYS_UIO_H


######################################
# Build shared library system/lib/libnfc-nci.so for stack code.

include $(CLEAR_VARS)
LOCAL_ARM_MODE := arm
LOCAL_MODULE := libnfc-nci
LOCAL_SHARED_LIBRARIES := libhardware_legacy libcutils liblog libdl libhardware
LOCAL_CFLAGS := $(D_CFLAGS)
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/src/include \
    $(LOCAL_PATH)/src/gki/ulinux \
    $(LOCAL_PATH)/src/gki/common \
    $(LOCAL_PATH)/$(NFA)/include \
    $(LOCAL_PATH)/$(NFA)/int \
    $(LOCAL_PATH)/$(NFC)/include \
    $(LOCAL_PATH)/$(NFC)/int \
    $(LOCAL_PATH)/src/hal/include \
    $(LOCAL_PATH)/src/hal/int \
    $(LOCAL_PATH)/$(HALIMPL)/include
LOCAL_SRC_FILES := \
    src/nfa/ce/nfa_ce_act.c \
	src/nfa/ce/nfa_ce_api.c \
	src/nfa/ce/nfa_ce_main.c \
	src/nfa/dm/nfa_dm_act.c \
	src/nfa/dm/nfa_dm_api.c \
	src/nfa/dm/nfa_dm_cfg.c \
	src/nfa/dm/nfa_dm_discover.c \
	src/nfa/dm/nfa_dm_main.c \
	src/nfa/dm/nfa_dm_ndef.c \
	src/nfa/ee/nfa_ee_act.c \
	src/nfa/ee/nfa_ee_api.c \
	src/nfa/ee/nfa_ee_main.c \
	src/nfa/hci/nfa_hci_act.c \
	src/nfa/hci/nfa_hci_api.c \
	src/nfa/hci/nfa_hci_ci.c \
	src/nfa/hci/nfa_hci_main.c \
	src/nfa/hci/nfa_hci_utils.c \
	src/nfa/p2p/nfa_p2p_act.c \
	src/nfa/p2p/nfa_p2p_api.c \
	src/nfa/p2p/nfa_p2p_main.c \
	src/nfa/rw/nfa_rw_act.c \
	src/nfa/rw/nfa_rw_api.c \
	src/nfa/rw/nfa_rw_main.c \
	src/nfa/sys/nfa_sys_cback.c \
	src/nfa/sys/nfa_sys_cfg.c \
	src/nfa/sys/nfa_sys_main.c \
	src/nfa/sys/nfa_sys_ptim.c \
	src/gki/common/gki_buffer.c \
	src/gki/common/gki_debug.c \
	src/gki/common/gki_time.c \
	src/gki/ulinux/gki_ulinux.c \
    src/adaptation/config.cpp \
    src/adaptation/CrcChecksum.cpp \
    src/adaptation/libmain.c \
    src/nfc/llcp/llcp_api.c \
	src/nfc/llcp/llcp_dlc.c \
	src/nfc/llcp/llcp_link.c \
	src/nfc/llcp/llcp_main.c \
	src/nfc/llcp/llcp_sdp.c \
	src/nfc/llcp/llcp_util.c \
	src/nfc/nci/nci_hmsgs.c \
	src/nfc/nci/nci_hrcv.c \
	src/nfc/ndef/ndef_cho_utils.c \
	src/nfc/ndef/ndef_utils.c \
	src/nfc/nfc/nfc_ee.c \
	src/nfc/nfc/nfc_main.c \
	src/nfc/nfc/nfc_ncif.c \
	src/nfc/nfc/nfc_task.c \
	src/nfc/nfc/nfc_test.c \
	src/nfc/nfc/nfc_utils.c \
	src/nfc/nfc/nfc_vs.c \
	src/nfc/tags/ce_main.c \
	src/nfc/tags/ce_t3t.c \
	src/nfc/tags/ce_t4t.c \
	src/nfc/tags/rw_i93.c \
	src/nfc/tags/rw_main.c \
	src/nfc/tags/rw_t1t.c \
	src/nfc/tags/rw_t1t_ndef.c \
	src/nfc/tags/rw_t2t.c \
	src/nfc/tags/rw_t2t_ndef.c \
	src/nfc/tags/rw_t3t.c \
	src/nfc/tags/rw_t4t.c \
	src/nfc/tags/tags_int.c \
    src/adaptation/NfcAdaptation.cpp \
    src/adaptation/OverrideLog.cpp \
    $(HALIMPL)/adaptation/android_logmsg.cpp \
    src/nfca_version.c
include $(BUILD_SHARED_LIBRARY)

######################################
# Build shared library system/lib/hw/nfc_nci.*.so for Hardware Abstraction Layer.
# Android's generic HAL (libhardware.so) dynamically loads this shared library.

include $(CLEAR_VARS)
LOCAL_MODULE := nfc_nci.bcm2079x.default
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SRC_FILES := \
	halimpl/bcm2079x/adaptation/android_logmsg.cpp \
	halimpl/bcm2079x/adaptation/CondVar.cpp \
	halimpl/bcm2079x/adaptation/config.cpp \
	halimpl/bcm2079x/adaptation/HalAdaptation.cpp \
	halimpl/bcm2079x/adaptation/Mutex.cpp \
	halimpl/bcm2079x/adaptation/NonVolatileStore.cpp \
	halimpl/bcm2079x/adaptation/OverrideLog.cpp \
	halimpl/bcm2079x/adaptation/patchram.cpp \
	halimpl/bcm2079x/adaptation/spdhelper.cpp \
	halimpl/bcm2079x/adaptation/StartupConfig.cpp \
	halimpl/bcm2079x/adaptation/userial_linux.c \
	halimpl/bcm2079x/gki/common/gki_buffer.c \
	halimpl/bcm2079x/gki/common/gki_debug.c \
	halimpl/bcm2079x/gki/common/gki_time.c \
	halimpl/bcm2079x/gki/ulinux/gki_ulinux.c \
	halimpl/bcm2079x/hal/hal/nfc_hal_api.c \
	halimpl/bcm2079x/hal/hal/nfc_hal_brcm.c \
	halimpl/bcm2079x/hal/hal/nfc_hal_dm.c \
	halimpl/bcm2079x/hal/hal/nfc_hal_dm_cfg.c \
	halimpl/bcm2079x/hal/hal/nfc_hal_hci.c \
	halimpl/bcm2079x/hal/hal/nfc_hal_hci_ci.c \
	halimpl/bcm2079x/hal/hal/nfc_hal_main.c \
	halimpl/bcm2079x/hal/hal/nfc_hal_nci.c \
	halimpl/bcm2079x/hal/hal/nfc_hal_prm.c \
    src/adaptation/CrcChecksum.cpp \
    src//nfca_version.c
LOCAL_SHARED_LIBRARIES := liblog libcutils libhardware_legacy
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/$(HALIMPL)/include \
    $(LOCAL_PATH)/$(HALIMPL)/gki/ulinux \
    $(LOCAL_PATH)/$(HALIMPL)/gki/common \
    $(LOCAL_PATH)/$(HAL)/include \
    $(LOCAL_PATH)/$(HAL)/int \
    $(LOCAL_PATH)/src/include \
    $(LOCAL_PATH)/$(NFC)/include \
    $(LOCAL_PATH)/$(NFA)/include \
    $(LOCAL_PATH)/$(UDRV)/include
LOCAL_CFLAGS := $(D_CFLAGS) -DNFC_HAL_TARGET=TRUE -DNFC_RW_ONLY=TRUE
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := liblog
LOCAL_SRC_FILES := $(LOCAL_PATH)/staticlibs/liblog.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libcutils
LOCAL_SRC_FILES := $(LOCAL_PATH)/staticlibs/libcutils.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libhardware
LOCAL_SRC_FILES := $(LOCAL_PATH)/staticlibs/libhardware.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libhardware_legacy
LOCAL_SRC_FILES := $(LOCAL_PATH)/staticlibs/libhardware_legacy.so
include $(PREBUILT_SHARED_LIBRARY)


######################################
include $(call all-makefiles-under,$(LOCAL_PATH))
