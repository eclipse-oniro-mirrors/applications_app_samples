/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include <hilog/log.h>
#include <multimedia/image_framework/image/image_native.h>
#include <multimedia/image_framework/image/image_packer_native.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include <multimedia/image_framework/image/picture_native.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <string>
#include <vector>

#define IMG_IS_OK(x) ((x) == napi_ok)

#define IMG_NAPI_CHECK_RET_D(x, res, msg)                                                                              \
    do {                                                                                                               \
        if (!(x)) {                                                                                                    \
            msg;                                                                                                       \
            return (res);                                                                                              \
        }                                                                                                              \
    } while (0)

#define IMG_JS_ARGS(env, info, status, argc, argv, thisVar)                                                            \
    do {                                                                                                               \
        status = napi_get_cb_info(env, info, &argc, argv, &thisVar, nullptr);                                          \
    } while (0)

#define H_LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, APP_LOG_TAG, __VA_ARGS__))
#define H_LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, APP_LOG_TAG, __VA_ARGS__))
#define H_LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARNING, LOG_DOMAIN, APP_LOG_TAG, __VA_ARGS__))
#define H_LOGE(format, ...)                                                                                            \
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, APP_LOG_TAG, "%{public}s:%{public}s:%{public}d: " format,             \
                 __FILE_NAME__, __FUNCTION__, __LINE__, ##__VA_ARGS__)

const char *APP_LOG_TAG = "MultiMediaImage";
const char *PROJECT_TAG = "[NdkPicture]";
constexpr size_t FILE_PATH_ARGUMENT_COUNT = 1;
constexpr size_t FILE_PATH_ARGUMENT_INDEX = 0;
constexpr size_t AUXILIARY_PICTURE_ARGUMENT_COUNT = 3;
constexpr size_t AUXILIARY_PICTURE_BUFFER_ARGUMENT_INDEX = 0;
constexpr size_t AUXILIARY_PICTURE_SIZE_ARGUMENT_INDEX = 1;
constexpr size_t AUXILIARY_PICTURE_TYPE_ARGUMENT_INDEX = 2;
constexpr size_t AUXILIARY_TYPE_ARGUMENT_COUNT = 1;
constexpr size_t AUXILIARY_TYPE_ARGUMENT_INDEX = 0;
constexpr size_t FILE_DESCRIPTOR_ARGUMENT_COUNT = 1;
constexpr size_t FILE_DESCRIPTOR_ARGUMENT_INDEX = 0;

struct AuxiliaryPictureCreateArgs {
    uint8_t *data = nullptr;
    size_t dataLength = 0;
    Image_Size size = {};
    Image_AuxiliaryPictureType type = Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP;
};

class ImagePictureNative {
public:
    Image_ErrorCode errCode_ = IMAGE_SUCCESS;
    OH_DecodingOptionsForPicture *options_ = nullptr;
    OH_ImagePackerNative *imagePacker_ = nullptr;
    OH_PackingOptions *packerOptions_ = nullptr;
    OH_AuxiliaryPictureNative *auxiliaryPicture_ = nullptr;
    OH_AuxiliaryPictureNative *gainMapAuxiliaryPicture_ = nullptr;
    OH_PictureNative *picture_ = nullptr;
    OH_PictureNative *pictureByImageSource = nullptr;
    OH_AuxiliaryPictureInfo *info_ = nullptr;
    OH_PictureMetadata *Metadata_ = nullptr;
    OH_PictureMetadata *newMetadata_ = nullptr;
    OH_ImageSourceNative *source_ = nullptr;
    OH_PixelmapNative *resPixMap_ = nullptr;
    ImagePictureNative() {}
    ~ImagePictureNative() {}
};
static ImagePictureNative *ndkPicture_ = new ImagePictureNative();

// 将int类型的返回值转换为napi_value类型
napi_value getJsResult(napi_env env, int result) {
    napi_value resultNapi = nullptr;
    napi_create_int32(env, result, &resultNapi);
    return resultNapi;
}

static napi_status GetUtf8String(napi_env env, napi_value value, std::vector<char> &buffer, size_t &filePathSize)
{
    napi_status status = napi_get_value_string_utf8(env, value, nullptr, 0, &filePathSize);
    if (status != napi_ok) {
        return status;
    }

    buffer.resize(filePathSize + 1);
    return napi_get_value_string_utf8(env, value, buffer.data(), buffer.size(), &filePathSize);
}

// 传入图片文件路径，解码得到PixelMap
Image_ErrorCode CreatePixelmap(char *filePath, size_t filePathSize)
{
    if (ndkPicture_->source_ != nullptr) {
        OH_ImageSourceNative_Release(ndkPicture_->source_);
        ndkPicture_->source_ = nullptr;
    }

    ndkPicture_->errCode_ = OH_ImageSourceNative_CreateFromUri(filePath, filePathSize, &ndkPicture_->source_);
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_ImageSourceNative_CreateFromUri failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return ndkPicture_->errCode_;
    } else {
        H_LOGI("%{public}s OH_ImageSourceNative_CreateFromUri success !", PROJECT_TAG);
    }

    OH_DecodingOptions *ops = nullptr;
    OH_DecodingOptions_Create(&ops);
    ndkPicture_->errCode_ = OH_ImageSourceNative_CreatePixelmap(ndkPicture_->source_, ops, &ndkPicture_->resPixMap_);
    OH_DecodingOptions_Release(ops);
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_ImageSourceNative_CreatePixelmap failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return ndkPicture_->errCode_;
    } else {
        H_LOGI("%{public}s OH_ImageSourceNative_CreatePixelmap success !", PROJECT_TAG);
    }
    return ndkPicture_->errCode_;
}

// 使用PixelMap创建Picture，通过这种方式创建的Picture仅包含主图
static napi_value CreatePicture(napi_env env, napi_callback_info info) {
    size_t argc = FILE_PATH_ARGUMENT_COUNT;
    napi_value args[FILE_PATH_ARGUMENT_COUNT] = {nullptr};
    napi_value result = nullptr;

    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok ||
        argc < FILE_PATH_ARGUMENT_COUNT || args[FILE_PATH_ARGUMENT_INDEX] == nullptr) {
        H_LOGE("%{public}s CreatePicture_ napi_get_cb_info failed !", PROJECT_TAG);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    std::vector<char> filePath;
    size_t filePathSize = 0;
    if (GetUtf8String(env, args[FILE_PATH_ARGUMENT_INDEX], filePath, filePathSize) != napi_ok) {
        H_LOGE("%{public}s CreatePicture_ argument must be a UTF-8 string.", PROJECT_TAG);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    ndkPicture_->errCode_ = CreatePixelmap(filePath.data(), filePathSize);
    if (ndkPicture_->picture_ != nullptr) {
        ndkPicture_->errCode_ = OH_PictureNative_Release(ndkPicture_->picture_);
        ndkPicture_->picture_ = nullptr;
    }
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s CreatePicture_ OH_PictureNative_Release failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
    }

    ndkPicture_->errCode_ = OH_PictureNative_CreatePicture(ndkPicture_->resPixMap_, &ndkPicture_->picture_);

    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_PictureNative_CreatePicture failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
        ;
    } else {
        napi_status status =
            napi_create_external(env, reinterpret_cast<void *>(ndkPicture_->picture_), nullptr, nullptr, &result);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to create external object");
            return getJsResult(env, ndkPicture_->errCode_);
        }
        H_LOGI("%{public}s OH_PictureNative_CreatePicture success !", PROJECT_TAG);
    }

    return getJsResult(env, ndkPicture_->errCode_);
}

// 使用ImageSource创建Picture。若原图包含辅助图和元数据，创建的Picture也会包含这些内容。
static napi_value CreatePictureByImageSource(napi_env env, napi_callback_info info) {
    size_t argc = FILE_PATH_ARGUMENT_COUNT;
    napi_value args[FILE_PATH_ARGUMENT_COUNT] = {nullptr};
    napi_value result = nullptr;

    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok ||
        argc < FILE_PATH_ARGUMENT_COUNT || args[FILE_PATH_ARGUMENT_INDEX] == nullptr) {
        H_LOGE("%{public}s CreatePicture_ napi_get_cb_info failed !", PROJECT_TAG);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }
    std::vector<char> filePath;
    size_t filePathSize = 0;
    if (GetUtf8String(env, args[FILE_PATH_ARGUMENT_INDEX], filePath, filePathSize) != napi_ok) {
        H_LOGE("%{public}s CreatePictureByImageSource argument must be a UTF-8 string.", PROJECT_TAG);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    if (ndkPicture_->source_ != nullptr) {
        OH_ImageSourceNative_Release(ndkPicture_->source_);
        ndkPicture_->source_ = nullptr;
    }

    ndkPicture_->errCode_ =
        OH_ImageSourceNative_CreateFromUri(filePath.data(), filePathSize, &ndkPicture_->source_);
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_ImageSourceNative_CreateFromUri failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        H_LOGI("%{public}s OH_ImageSourceNative_CreateFromUri success !", PROJECT_TAG);
    }
    OH_DecodingOptions *ops = nullptr;
    OH_DecodingOptions_Create(&ops);
    ndkPicture_->errCode_ = OH_ImageSourceNative_CreatePicture(ndkPicture_->source_, ndkPicture_->options_,
                                                               &ndkPicture_->pictureByImageSource);
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s ImageSourceNative_CreatePicture failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        napi_status status = napi_create_external(env, reinterpret_cast<void *>(ndkPicture_->pictureByImageSource),
                                                  nullptr, nullptr, &result);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to create external object");
            return getJsResult(env, ndkPicture_->errCode_);
        }
        H_LOGI("%{public}s ImageSourceNative_CreatePicture success !", PROJECT_TAG);
    }

    return getJsResult(env, ndkPicture_->errCode_);
}

// 获取主图
static napi_value GetMainPixelMap(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    OH_PixelmapNative *mainPixelMap = nullptr;
    napi_get_undefined(env, &result);

    ndkPicture_->errCode_ = OH_PictureNative_GetMainPixelmap(ndkPicture_->picture_, &mainPixelMap);

    if (ndkPicture_->errCode_ != IMAGE_SUCCESS || mainPixelMap == nullptr) {
        H_LOGE("%{public}s OH_PictureNative_GetMainPixelmap failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        napi_status status =
            napi_create_external(env, reinterpret_cast<void *>(mainPixelMap), nullptr, nullptr, &result);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to create external object");
            return getJsResult(env, ndkPicture_->errCode_);
        }
        H_LOGI("%{public}s OH_PictureNative_GetMainPixelmap success !", PROJECT_TAG);
        return getJsResult(env, ndkPicture_->errCode_);
    }
}

// 获取GainMap辅助图，需要这张Picture包含GainMap辅助图才能成功获取。
static napi_value GetGainMapPixelMap(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_PixelmapNative *gainMapPixelMap = nullptr;
    ndkPicture_->errCode_ = OH_PictureNative_GetGainmapPixelmap(ndkPicture_->picture_, &gainMapPixelMap);
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("GetGainMapPixelMap failed, errCode: %{public}d.", ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        napi_status status =
            napi_create_external(env, reinterpret_cast<void *>(gainMapPixelMap), nullptr, nullptr, &result);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to create external object");
            return getJsResult(env, ndkPicture_->errCode_);
        }
    }
    H_LOGI("GetGainMapPixelMap success !");
    return getJsResult(env, ndkPicture_->errCode_);
}

// 合成hdr图并获取hdr图的pixelmap
static napi_value GetHdrComposedPixelMap(napi_env env, napi_callback_info info) {

    napi_value result;
    OH_PixelmapNative *hdrComposedPixelMap = nullptr;

    ndkPicture_->errCode_ = OH_PictureNative_GetHdrComposedPixelmap(ndkPicture_->picture_, &hdrComposedPixelMap);

    if (ndkPicture_->errCode_ != IMAGE_SUCCESS || !hdrComposedPixelMap) {
        H_LOGE("%{public}s OH_PictureNative_GetHdrComposedPixelmap failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        napi_status status =
            napi_create_external(env, reinterpret_cast<void *>(hdrComposedPixelMap), nullptr, nullptr, &result);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to create external object");
            return getJsResult(env, ndkPicture_->errCode_);
        }
        H_LOGI("%{public}s OH_PictureNative_GetHdrComposedPixelmap success !", PROJECT_TAG);
    }

    return getJsResult(env, ndkPicture_->errCode_);
}

static bool GetAuxiliaryPictureSize(napi_env env, napi_value sizeValue, Image_Size &size)
{
    napi_value widthValue = nullptr;
    napi_value heightValue = nullptr;
    napi_status status = napi_get_named_property(env, sizeValue, "width", &widthValue);
    if (status != napi_ok) {
        H_LOGE("Fail to get auxiliary picture width");
        return false;
    }
    status = napi_get_value_uint32(env, widthValue, &size.width);
    if (status != napi_ok) {
        H_LOGE("Auxiliary picture width must be uint32");
        return false;
    }
    status = napi_get_named_property(env, sizeValue, "height", &heightValue);
    if (status != napi_ok) {
        H_LOGE("Fail to get auxiliary picture height");
        return false;
    }
    status = napi_get_value_uint32(env, heightValue, &size.height);
    if (status != napi_ok) {
        H_LOGE("Auxiliary picture height must be uint32");
        return false;
    }
    return true;
}

static bool GetAuxiliaryPictureType(napi_env env, napi_value typeValue, Image_AuxiliaryPictureType &type)
{
    int32_t auxiliaryType = 0;
    napi_status status = napi_get_value_int32(env, typeValue, &auxiliaryType);
    if (status != napi_ok) {
        H_LOGE("Auxiliary picture type must be int32");
        return false;
    }
    if (auxiliaryType >= static_cast<int32_t>(Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP) &&
        auxiliaryType <= static_cast<int32_t>(Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_FRAGMENT_MAP)) {
        H_LOGI("%{public}s OH_AuxiliaryPictureNative_Create type: %{public}d.", PROJECT_TAG, auxiliaryType);
    } else {
        H_LOGI("%{public}s OH_AuxiliaryPictureNative_Create type is set GAINMAP: %{public}d.", PROJECT_TAG,
               auxiliaryType);
        auxiliaryType = static_cast<int32_t>(Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP);
    }
    type = static_cast<Image_AuxiliaryPictureType>(auxiliaryType);
    return true;
}

static bool GetAuxiliaryPictureCreateArgs(napi_env env, napi_callback_info info, AuxiliaryPictureCreateArgs &createArgs)
{
    size_t argc = AUXILIARY_PICTURE_ARGUMENT_COUNT;
    napi_value napiArgs[AUXILIARY_PICTURE_ARGUMENT_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, napiArgs, nullptr, nullptr) != napi_ok ||
        argc < AUXILIARY_PICTURE_ARGUMENT_COUNT ||
        napiArgs[AUXILIARY_PICTURE_BUFFER_ARGUMENT_INDEX] == nullptr ||
        napiArgs[AUXILIARY_PICTURE_SIZE_ARGUMENT_INDEX] == nullptr ||
        napiArgs[AUXILIARY_PICTURE_TYPE_ARGUMENT_INDEX] == nullptr) {
        H_LOGE("%{public}s OH_AuxiliaryPictureNative_Create napi_get_cb_info failed !", PROJECT_TAG);
        return false;
    }
    void *data0;
    napi_status status =
        napi_get_arraybuffer_info(env, napiArgs[AUXILIARY_PICTURE_BUFFER_ARGUMENT_INDEX], &data0,
                                  &createArgs.dataLength);
    if (status != napi_ok) {
        H_LOGE("Fail to get auxiliary picture buffer");
        return false;
    }
    createArgs.data = reinterpret_cast<uint8_t *>(data0);
    return GetAuxiliaryPictureSize(env, napiArgs[AUXILIARY_PICTURE_SIZE_ARGUMENT_INDEX], createArgs.size) &&
        GetAuxiliaryPictureType(env, napiArgs[AUXILIARY_PICTURE_TYPE_ARGUMENT_INDEX], createArgs.type);
}

static napi_value CreateAuxiliaryPicture(napi_env env, napi_callback_info info)
{
    AuxiliaryPictureCreateArgs createArgs;
    if (!GetAuxiliaryPictureCreateArgs(env, info, createArgs)) {
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    napi_value result = nullptr;
    ndkPicture_->errCode_ =
        OH_AuxiliaryPictureNative_Create(createArgs.data, createArgs.dataLength, &createArgs.size, createArgs.type,
                                         &ndkPicture_->auxiliaryPicture_);
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS || !ndkPicture_->auxiliaryPicture_) {
        H_LOGE("%{public}s OH_AuxiliaryPictureNative_Create failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        napi_status status = napi_create_external(env, reinterpret_cast<void *>(ndkPicture_->auxiliaryPicture_),
                                                  nullptr, nullptr, &result);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to create external object");
            return getJsResult(env, ndkPicture_->errCode_);
        }
        H_LOGI("%{public}s OH_AuxiliaryPictureNative_Create success !", PROJECT_TAG);
    }
    return getJsResult(env, ndkPicture_->errCode_);
}

static napi_value GetAuxType(napi_env env, napi_callback_info info) {
    Image_AuxiliaryPictureType type;
    ndkPicture_->errCode_ = OH_AuxiliaryPictureNative_GetType(ndkPicture_->auxiliaryPicture_, &type);

    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_AuxiliaryPictureNative_GetType failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        H_LOGI("%{public}s OH_AuxiliaryPictureNative_GetType success !", PROJECT_TAG);
    }

    return getJsResult(env, ndkPicture_->errCode_);
}

static napi_value SetAuxiliaryPicture(napi_env env, napi_callback_info info) {
    napi_status status;
    size_t argc = AUXILIARY_TYPE_ARGUMENT_COUNT;
    napi_value args[AUXILIARY_TYPE_ARGUMENT_COUNT] = {nullptr};

    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok ||
        argc < AUXILIARY_TYPE_ARGUMENT_COUNT || args[AUXILIARY_TYPE_ARGUMENT_INDEX] == nullptr) {
        H_LOGE("%{public}s CreatePicture_ napi_get_cb_info failed !", PROJECT_TAG);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    int32_t value = 0; // 假设 auxType 指向了这个变量的地址
    int32_t *auxType = &value;
    status = napi_get_value_int32(env, args[AUXILIARY_TYPE_ARGUMENT_INDEX], auxType);
    if (*auxType >= static_cast<int32_t>(Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP) &&
        *auxType <= static_cast<int32_t>(Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_FRAGMENT_MAP)) {
        H_LOGI("%{public}s OH_AuxiliaryPictureNative_Create type: %{public}d.", PROJECT_TAG, *auxType);
    } else {
        *auxType = static_cast<int32_t>(Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP);
        H_LOGI("%{public}s OH_AuxiliaryPictureNative_Create type is set GAINMAP: %{public}d.", PROJECT_TAG, *auxType);
    }
    Image_AuxiliaryPictureType *type = reinterpret_cast<Image_AuxiliaryPictureType *>(auxType);

    if (ndkPicture_->auxiliaryPicture_ == nullptr) {
        H_LOGE("%{public}s OH_PictureNative_SetAuxiliaryPicture is nullptr", PROJECT_TAG);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    ndkPicture_->errCode_ =
        OH_PictureNative_SetAuxiliaryPicture(ndkPicture_->picture_, *type, ndkPicture_->auxiliaryPicture_);
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_PictureNative_SetAuxiliaryPicture failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        H_LOGI("%{public}s OH_PictureNative_SetAuxiliaryPicture success !", PROJECT_TAG);
    }

    return getJsResult(env, ndkPicture_->errCode_);
}

static napi_value GetAuxiliaryPicture(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_status status;
    size_t argc = AUXILIARY_TYPE_ARGUMENT_COUNT;
    napi_value args[AUXILIARY_TYPE_ARGUMENT_COUNT] = {nullptr};

    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok ||
        argc < AUXILIARY_TYPE_ARGUMENT_COUNT || args[AUXILIARY_TYPE_ARGUMENT_INDEX] == nullptr) {
        H_LOGE("%{public}s CreatePicture_ napi_get_cb_info failed !", PROJECT_TAG);
        return getJsResult(env, IMAGE_BAD_PARAMETER);
    }

    int32_t value = 0; // 假设 auxType 指向了这个变量的地址
    int32_t *auxType = &value;
    status = napi_get_value_int32(env, args[AUXILIARY_TYPE_ARGUMENT_INDEX], auxType);
    if (*auxType >= static_cast<int32_t>(Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP) &&
        *auxType <= static_cast<int32_t>(Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_FRAGMENT_MAP)) {
        H_LOGI("%{public}s OH_AuxiliaryPictureNative_Create type: %{public}d.", PROJECT_TAG, *auxType);
    } else {
        *auxType = static_cast<int32_t>(Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP);
        H_LOGI("%{public}s OH_AuxiliaryPictureNative_Create type is set GAINMAP: %{public}d.", PROJECT_TAG, *auxType);
    }
    Image_AuxiliaryPictureType *type = reinterpret_cast<Image_AuxiliaryPictureType *>(auxType);

    ndkPicture_->errCode_ =
        OH_PictureNative_GetAuxiliaryPicture(ndkPicture_->picture_, *type, &ndkPicture_->auxiliaryPicture_);
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_PictureNative_GetAuxiliaryPicture failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        napi_status status = napi_create_external(env, reinterpret_cast<void *>(ndkPicture_->auxiliaryPicture_),
                                                  nullptr, nullptr, &result);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to create external object");
            return getJsResult(env, ndkPicture_->errCode_);
        }
        H_LOGI("%{public}s OH_PictureNative_GetAuxiliaryPicture success !", PROJECT_TAG);
    }

    return getJsResult(env, ndkPicture_->errCode_);
}

// 将Picture编码到缓冲区
static napi_value PackToData(napi_env env, napi_callback_info info) {
    napi_value result = nullptr;
    size_t outDataSize = 10000 * 10000;
    uint8_t *outData = new uint8_t[outDataSize];

    if (ndkPicture_->packerOptions_ == nullptr) {
        ndkPicture_->errCode_ = OH_PackingOptions_Create(&ndkPicture_->packerOptions_);
    }
    if (ndkPicture_->imagePacker_ == nullptr) {
        ndkPicture_->errCode_ = OH_ImagePackerNative_Create(&ndkPicture_->imagePacker_);
    }
    Image_MimeType format;
    format.size = 10;
    format.data = const_cast<char *>("image/jpeg");
    OH_PackingOptions_SetMimeType(ndkPicture_->packerOptions_, &format);
    ndkPicture_->errCode_ = OH_ImagePackerNative_PackToDataFromPicture(
        ndkPicture_->imagePacker_, ndkPicture_->packerOptions_, ndkPicture_->picture_, outData, &outDataSize);
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_ImagePackerNative_PackToDataFromPicture failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);
        delete [] outData;
        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        napi_status status = napi_create_external(env, reinterpret_cast<void *>(outData), nullptr, nullptr, &result);
        if (status != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to create external object");
            delete [] outData;
            return getJsResult(env, ndkPicture_->errCode_);
        }
        H_LOGI("%{public}s OH_ImagePackerNative_PackToDataFromPicture success !", PROJECT_TAG);
    }
    delete [] outData;
    return getJsResult(env, ndkPicture_->errCode_);
};

// 将Picture编码到图片文件
static napi_value PackToFile(napi_env env, napi_callback_info info) {
    napi_value result;
    size_t argc = FILE_DESCRIPTOR_ARGUMENT_COUNT;
    napi_value args[FILE_DESCRIPTOR_ARGUMENT_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_create_int32(env, -1, &result);
        H_LOGE("%{public}s napi_get_cb_info failed !", PROJECT_TAG);
        return getJsResult(env, ndkPicture_->errCode_);
    }
    uint32_t fd = 0;
    napi_get_value_uint32(env, args[FILE_DESCRIPTOR_ARGUMENT_INDEX], &fd);

    if (ndkPicture_->packerOptions_ == nullptr) {
        ndkPicture_->errCode_ = OH_PackingOptions_Create(&ndkPicture_->packerOptions_);
    }
    if (ndkPicture_->imagePacker_ == nullptr) {
        ndkPicture_->errCode_ = OH_ImagePackerNative_Create(&ndkPicture_->imagePacker_);
    }
    Image_MimeType format;
    format.size = 10;
    format.data = const_cast<char *>("image/jpeg");
    OH_PackingOptions_SetMimeType(ndkPicture_->packerOptions_, &format);
    ndkPicture_->errCode_ = OH_ImagePackerNative_PackToFileFromPicture(
        ndkPicture_->imagePacker_, ndkPicture_->packerOptions_, ndkPicture_->picture_, fd);
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_ImagePackerNative_PackToFileFromPicture failed, errCode: %{public}d.", PROJECT_TAG,
               ndkPicture_->errCode_);

        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        H_LOGI("%{public}s OH_ImagePackerNative_PackToFileFromPicture success !", PROJECT_TAG);
    }

    return getJsResult(env, ndkPicture_->errCode_);
}

static napi_value ReleasePicture(napi_env env, napi_callback_info info) {
    ndkPicture_->errCode_ = OH_PictureNative_Release(ndkPicture_->picture_);
    ndkPicture_->picture_ = nullptr;
    if (ndkPicture_->errCode_ != IMAGE_SUCCESS) {
        H_LOGE("%{public}s OH_PictureNative_Release failed, errCode: %{public}d.", PROJECT_TAG, ndkPicture_->errCode_);
        return getJsResult(env, ndkPicture_->errCode_);
    } else {
        H_LOGI("%{public}s OH_PictureNative_Release success !", PROJECT_TAG);
    }

    return getJsResult(env, ndkPicture_->errCode_);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"CreatePicture", nullptr, CreatePicture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetMainPixelMap", nullptr, GetMainPixelMap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreatePictureByImageSource", nullptr, CreatePictureByImageSource, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"PackToData", nullptr, PackToData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PackToFile", nullptr, PackToFile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ReleasePicture", nullptr, ReleasePicture, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
