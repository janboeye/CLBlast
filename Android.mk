
#/*
# * Copyright:
# * ----------------------------------------------------------------------------
# * This confidential and proprietary software may be used only as authorized
# * by a licensing agreement from ARM Limited.
# *      (C) COPYRIGHT 2014-2015 ARM Limited, ALL RIGHTS RESERVED
# * The entire notice above must be reproduced on all authorized copies and
# * copies may only be made to the extent permitted by a licensing agreement
# * from ARM Limited.
# * ----------------------------------------------------------------------------
# */


LOCAL_PATH := $(call my-dir)


# Configure these paths if you move the source or Khronos headers
#
OPENCL_HEADER_PATH := $(LOCAL_PATH)/../vendor/pinecone/arm/gles/khronos/original/CL_1_2
OPENCL_STUB_PATH := ../vendor/pinecone/arm/gles/cl/tests/sdk


#-----------------
# mali_cl_simple_opencl_example

include $(CLEAR_VARS)

LOCAL_C_INCLUDES :=  \
	$(OPENCL_HEADER_PATH) \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/src

LOCAL_CFLAGS := \
	-Wno-unused-parameter -std=c++11 -O2 -Wall -Wno-comment -Wno-return-type -Wno-switch -Wno-missing-noreturn

LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_RTTI_FLAG := -frtti -fexceptions

LOCAL_SRC_FILES :=  \
     src/routines/common.cpp  \
     src/routines/level1/xaxpy.cpp  \
     src/routines/level1/xswap.cpp  \
     src/routines/level1/xamax.cpp  \
     src/routines/level1/xnrm2.cpp  \
     src/routines/level1/xdotu.cpp  \
     src/routines/level1/xcopy.cpp  \
     src/routines/level1/xscal.cpp  \
     src/routines/level1/xdot.cpp  \
     src/routines/level1/xdotc.cpp  \
     src/routines/level1/xasum.cpp  \
     src/routines/levelx/xim2col.cpp  \
     src/routines/levelx/xgemmbatched.cpp  \
     src/routines/levelx/xinvert.cpp  \
     src/routines/levelx/xaxpybatched.cpp  \
     src/routines/levelx/xomatcopy.cpp  \
     src/routines/level3/xsymm.cpp  \
     src/routines/level3/xgemm.cpp  \
     src/routines/level3/xhemm.cpp  \
     src/routines/level3/xtrmm.cpp  \
     src/routines/level3/xher2k.cpp  \
     src/routines/level3/xherk.cpp  \
     src/routines/level3/xtrsm.cpp  \
     src/routines/level3/xsyr2k.cpp  \
     src/routines/level3/xsyrk.cpp  \
     src/routines/level2/xhpmv.cpp  \
     src/routines/level2/xhpr2.cpp  \
     src/routines/level2/xhemv.cpp  \
     src/routines/level2/xhpr.cpp  \
     src/routines/level2/xsyr.cpp  \
     src/routines/level2/xhbmv.cpp  \
     src/routines/level2/xsbmv.cpp  \
     src/routines/level2/xspmv.cpp  \
     src/routines/level2/xher2.cpp  \
     src/routines/level2/xsyr2.cpp  \
     src/routines/level2/xtpmv.cpp  \
     src/routines/level2/xspr2.cpp  \
     src/routines/level2/xgerc.cpp  \
     src/routines/level2/xsymv.cpp  \
     src/routines/level2/xspr.cpp  \
     src/routines/level2/xtrmv.cpp  \
     src/routines/level2/xgeru.cpp  \
     src/routines/level2/xger.cpp  \
     src/routines/level2/xgbmv.cpp  \
     src/routines/level2/xtrsv.cpp  \
     src/routines/level2/xtbmv.cpp  \
     src/routines/level2/xgemv.cpp  \
     src/routines/level2/xher.cpp  \
     src/clblast.cpp  \
     src/routine.cpp  \
     src/utilities/utilities.cpp  \
     src/utilities/clblast_exceptions.cpp  \
     src/cache.cpp  \
     src/clblast_c.cpp  \
     src/database/database.cpp
     


LOCAL_SHARED_LIBRARIES :=  \
	libOpenCL

LOCAL_MODULE := libclbast

LOCAL_MODULE_TAGS := eng optional tests

# Mark source files as dependent on Android.mk
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk


include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES :=  \
	$(OPENCL_HEADER_PATH) \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/src

LOCAL_CFLAGS := \
	-Wno-unused-parameter -std=c++11 -O2 -Wall -Wno-comment -Wno-return-type -Wno-switch -Wno-missing-noreturn

LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_RTTI_FLAG := -frtti -fexceptions

LOCAL_SRC_FILES :=  \
     samples/sgemm.cpp

LOCAL_SHARED_LIBRARIES :=  \
	libOpenCL \
	libclbast

LOCAL_MODULE := clblast_sample_sgemm

LOCAL_MODULE_TAGS := eng optional tests

# Mark source files as dependent on Android.mk
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk


include $(BUILD_EXECUTABLE)

#-----------------
# libOpenCL (stub)

include $(CLEAR_VARS)



LOCAL_PRELINK_MODULE := false

LOCAL_C_INCLUDES :=  \
	$(OPENCL_HEADER_PATH)

LOCAL_CFLAGS := \
	-Wno-unused-parameter

LOCAL_SRC_FILES :=  \
	$(OPENCL_STUB_PATH)/opencl_stubs.c


LOCAL_MODULE := libOpenCL

LOCAL_MULTILIB := both

LOCAL_MODULE_TAGS := eng optional

LOCAL_ARM_MODE := arm

LOCAL_PROPRIETARY_MODULE := true

LOCAL_MODULE_RELATIVE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/cl_stub

LOCAL_MODULE_PATH_64 := $(TARGET_OUT_SHARED_LIBRARIES)/cl_stub64

LOCAL_MODULE_PATH_32 := $(TARGET_OUT_SHARED_LIBRARIES)/cl_stub32

# Mark source files as dependent on Android.mk
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk

include $(BUILD_SHARED_LIBRARY)



