/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// [Start input_case_input_CPreview016]
#include <algorithm>
#include <mutex>
#include <string>

#include "PreviewDisplayState.h"

#include "hilog/log.h"
#include "inputmethod/inputmethod_text_editor_proxy_capi.h"
#include "inputmethod/inputmethod_preview_text_style_capi.h"
#include "inputmethod/inputmethod_controller_capi.h"
#include "napi/native_api.h"

static PreviewDisplayState g_display;
static std::mutex g_textMutex;
static InputMethod_TextEditorProxy *textEditorProxy = nullptr;
static InputMethod_AttachOptions *attachOptions = nullptr;
static InputMethod_InputMethodProxy *inputMethodProxy = nullptr;

void GetTextConfigFunc(InputMethod_TextEditorProxy *proxy, InputMethod_TextConfig *config)
{
    // 处理获取输入框配置请求
    auto ret = OH_TextConfig_SetEnterKeyType(config, InputMethod_EnterKeyType::IME_ENTER_KEY_SEND);
    if (ret != IME_ERR_OK) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xF811, "PreviewTextStyleC", "SetEnterKeyType failed, ret=%{public}d", ret);
        return;
    }

    ret = OH_TextConfig_SetInputType(config, InputMethod_TextInputType::IME_TEXT_INPUT_TYPE_TEXT);
    if (ret != IME_ERR_OK) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xF811, "PreviewTextStyleC", "SetInputType failed, ret=%{public}d", ret);
        return;
    }

    ret = OH_TextConfig_SetPreviewTextSupport(config, true);
    if (ret != IME_ERR_OK) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xF811, "PreviewTextStyleC",
            "SetPreviewTextSupport failed, ret=%{public}d", ret);
    }
}

void InsertTextFunc(InputMethod_TextEditorProxy *proxy, const char16_t *text, size_t length)
{
    if (text == nullptr) {
        return;
    }
    std::lock_guard<std::mutex> lock(g_textMutex);
    g_display.text.append(text, length);
    g_display.active = false;
}

// The framework reverses IME directions for compatibility; C editor backward means backspace.
void DeleteBackwardFunc(InputMethod_TextEditorProxy *proxy, int32_t length)
{
    std::lock_guard<std::mutex> lock(g_textMutex);
    if (length <= 0) {
        return;
    }
    size_t count = std::min(static_cast<size_t>(length), g_display.text.size());
    size_t start = g_display.text.size() - count;
    if (start > 0 && start < g_display.text.size() && g_display.text[start] >= 0xDC00 &&
        g_display.text[start] <= 0xDFFF && g_display.text[start - 1] >= 0xD800 &&
        g_display.text[start - 1] <= 0xDBFF) {
        --start;
    }
    g_display.text.erase(start);
    g_display.active = false;
}

void DeleteForwardFunc(InputMethod_TextEditorProxy *proxy, int32_t length)
{
    std::lock_guard<std::mutex> lock(g_textMutex);
    // This minimal editor keeps its cursor at the end; there is no text to its right.
}

void SendKeyboardStatusFunc(InputMethod_TextEditorProxy *proxy, InputMethod_KeyboardStatus status)
{
    // No-op: this editor derives its display state from the editing callbacks.
}

void SendEnterKeyFunc(InputMethod_TextEditorProxy *proxy, InputMethod_EnterKeyType type)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xF811, "PreviewTextStyleC", "C enter action=%{public}d", type);
}

void MoveCursorFunc(InputMethod_TextEditorProxy *proxy, InputMethod_Direction direction)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xF811, "PreviewTextStyleC", "C cursor request=%{public}d", direction);
}

void HandleSetSelectionFunc(InputMethod_TextEditorProxy *proxy, int32_t start, int32_t end)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xF811, "PreviewTextStyleC",
        "C selection request=%{public}d,%{public}d", start, end);
}

void HandleExtendActionFunc(InputMethod_TextEditorProxy *proxy, InputMethod_ExtendAction action)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xF811, "PreviewTextStyleC", "C edit action=%{public}d", action);
}

void GetLeftTextOfCursorFunc(InputMethod_TextEditorProxy *proxy, int32_t number, char16_t text[], size_t *length)
{
    if (length == nullptr) {
        return;
    }
    if (text == nullptr || number <= 0) {
        *length = 0;
        return;
    }
    std::lock_guard<std::mutex> lock(g_textMutex);
    const size_t count = std::min(static_cast<size_t>(number), g_display.text.size());
    std::copy(g_display.text.end() - count, g_display.text.end(), text);
    *length = count;
}

void GetRightTextOfCursorFunc(InputMethod_TextEditorProxy *proxy, int32_t number, char16_t text[], size_t *length)
{
    if (length != nullptr) {
        *length = 0;
    }
}

int32_t GetTextIndexAtCursorFunc(InputMethod_TextEditorProxy *proxy)
{
    std::lock_guard<std::mutex> lock(g_textMutex);
    return static_cast<int32_t>(g_display.text.size());
}

int32_t ReceivePrivateCommandFunc(InputMethod_TextEditorProxy *proxy, InputMethod_PrivateCommand *privateCommand[],
    size_t size)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xF811, "PreviewTextStyleC", "C private command received");
    return 0;
}

// Attach requires the legacy callback. Rendering is owned by the styled callback.
int32_t SetPreviewTextFunc(InputMethod_TextEditorProxy *proxy, const char16_t *text, size_t length,
    int32_t start, int32_t end)
{
    return text == nullptr ? IME_ERR_NULL_POINTER : IME_ERR_OK;
}

// [Start preview_style_c_receive]
int32_t SetPreviewTextWithStyleFunc(InputMethod_TextEditorProxy *proxy, const char16_t *text, uint32_t length,
    int32_t start, int32_t end, const OH_InputMethod_PreviewTextStyle *style)
{
    if (text == nullptr || style == nullptr) {
        return IME_ERR_NULL_POINTER;
    }
    OH_InputMethod_UnderlineStyle kind = OH_INPUTMETHOD_UNDERLINE_STYLE_NONE;
    uint32_t color = 0;
    bool hasColor = false;
    // Read the borrowed object; its lifetime belongs to the input method framework.
    // The C getters accept a mutable pointer but only read this framework-owned object.
    auto *readStyle = const_cast<OH_InputMethod_PreviewTextStyle *>(style);
    auto result = OH_InputMethod_PreviewTextStyle_GetUnderlineStyle(readStyle, &kind);
    if (result != IME_ERR_OK) {
        return result;
    }
    result = OH_InputMethod_PreviewTextStyle_GetUnderlineColor(readStyle, &color);
    if (result != IME_ERR_OK) {
        return result;
    }
    result = OH_InputMethod_PreviewTextStyle_HasUnderlineColor(readStyle, &hasColor);
    if (result != IME_ERR_OK) {
        return result;
    }
    std::lock_guard<std::mutex> lock(g_textMutex);
    g_display.ApplyStyled(text, length, static_cast<int32_t>(kind), color, hasColor);
    return IME_ERR_OK;
}

// [End preview_style_c_receive]

void FinishTextPreviewFunc(InputMethod_TextEditorProxy *proxy)
{
    std::lock_guard<std::mutex> lock(g_textMutex);
    g_display.active = false;
}

int32_t ConstructTextEditorProxy(InputMethod_TextEditorProxy *textEditorProxy)
{
    // [Start input_case_input_ConstructTextEditorProxy]
    OH_TextEditorProxy_SetGetTextConfigFunc(textEditorProxy, GetTextConfigFunc);
    OH_TextEditorProxy_SetInsertTextFunc(textEditorProxy, InsertTextFunc);
    OH_TextEditorProxy_SetDeleteForwardFunc(textEditorProxy, DeleteForwardFunc);
    OH_TextEditorProxy_SetDeleteBackwardFunc(textEditorProxy, DeleteBackwardFunc);
    OH_TextEditorProxy_SetSendKeyboardStatusFunc(textEditorProxy, SendKeyboardStatusFunc);
    OH_TextEditorProxy_SetSendEnterKeyFunc(textEditorProxy, SendEnterKeyFunc);
    OH_TextEditorProxy_SetMoveCursorFunc(textEditorProxy, MoveCursorFunc);
    OH_TextEditorProxy_SetHandleSetSelectionFunc(textEditorProxy, HandleSetSelectionFunc);
    OH_TextEditorProxy_SetHandleExtendActionFunc(textEditorProxy, HandleExtendActionFunc);
    OH_TextEditorProxy_SetGetLeftTextOfCursorFunc(textEditorProxy, GetLeftTextOfCursorFunc);
    OH_TextEditorProxy_SetGetRightTextOfCursorFunc(textEditorProxy, GetRightTextOfCursorFunc);
    OH_TextEditorProxy_SetGetTextIndexAtCursorFunc(textEditorProxy, GetTextIndexAtCursorFunc);
    OH_TextEditorProxy_SetReceivePrivateCommandFunc(textEditorProxy, ReceivePrivateCommandFunc);
    // [Start preview_style_c_register]
    auto result = OH_TextEditorProxy_SetSetPreviewTextFunc(textEditorProxy, SetPreviewTextFunc);
    if (result != IME_ERR_OK) {
        return result;
    }
    result = OH_InputMethod_TextEditorProxy_SetSetPreviewTextWithStyleFunc(
        textEditorProxy, SetPreviewTextWithStyleFunc);
    if (result != IME_ERR_OK) {
        return result;
    }
    OH_InputMethod_TextEditorProxy_SetPreviewTextWithStyleFunc registered = nullptr;
    result = OH_InputMethod_TextEditorProxy_GetSetPreviewTextWithStyleFunc(textEditorProxy, &registered);
    if (result != IME_ERR_OK) {
        return result;
    }
    if (registered != SetPreviewTextWithStyleFunc) {
        return IME_ERR_UNDEFINED;
    }
    return OH_TextEditorProxy_SetFinishTextPreviewFunc(textEditorProxy, FinishTextPreviewFunc);
    // [End preview_style_c_register]
    // [End input_case_input_ConstructTextEditorProxy]
}
// [End input_case_input_CPreview016]

// [Start input_case_input_CPreview208]
// A failed detach can already have deleted the native proxy. Stop reuse until restart.
static int g_releaseError = IME_ERR_OK;
// [Start input_case_input_OH_InputMethodController_Detach]
static int ReleaseCEditor()
{
    {
        std::lock_guard<std::mutex> lock(g_textMutex);
        g_display.active = false;
    }
    if (g_releaseError != IME_ERR_OK) {
        return g_releaseError;
    }
    if (inputMethodProxy != nullptr) {
        OH_InputMethodProxy_HideKeyboard(inputMethodProxy);
        const int ret = OH_InputMethodController_Detach(inputMethodProxy);
        inputMethodProxy = nullptr;
        if (ret != IME_ERR_OK) {
            g_releaseError = ret;
            return ret;
        }
    }
    if (textEditorProxy != nullptr) {
        OH_TextEditorProxy_Destroy(textEditorProxy);
        textEditorProxy = nullptr;
    }
    if (attachOptions != nullptr) {
        OH_AttachOptions_Destroy(attachOptions);
        attachOptions = nullptr;
    }
    return IME_ERR_OK;
}

// [End input_case_input_OH_InputMethodController_Detach]

// One normal object-lifetime example, independent of received preview content.
// [Start preview_style_c_object]
static int32_t PreviewTextStyleObjectExample()
{
    auto *style = OH_InputMethod_PreviewTextStyle_Create();
    if (style == nullptr) {
        return IME_ERR_NULL_POINTER;
    }
    auto result = OH_InputMethod_PreviewTextStyle_SetUnderlineStyle(style, OH_INPUTMETHOD_UNDERLINE_STYLE_WAVY);
    if (result == IME_ERR_OK) {
        result = OH_InputMethod_PreviewTextStyle_SetUnderlineColor(style, 0x00FF0000);
    }
    OH_InputMethod_UnderlineStyle kind = OH_INPUTMETHOD_UNDERLINE_STYLE_NONE;
    uint32_t color = 0;
    bool hasColor = false;
    if (result == IME_ERR_OK) {
        result = OH_InputMethod_PreviewTextStyle_GetUnderlineStyle(style, &kind);
    }
    if (result == IME_ERR_OK) {
        result = OH_InputMethod_PreviewTextStyle_GetUnderlineColor(style, &color);
    }
    if (result == IME_ERR_OK) {
        result = OH_InputMethod_PreviewTextStyle_HasUnderlineColor(style, &hasColor);
    }
    OH_InputMethod_PreviewTextStyle_Destroy(style);
    return result;
}

// [End preview_style_c_object]

static int32_t AttachEditor()
{
    auto result = ReleaseCEditor();
    if (result != IME_ERR_OK) {
        return result;
    }
    result = PreviewTextStyleObjectExample();
    if (result != IME_ERR_OK) {
        return result;
    }
    // [Start input_case_input_TextEditorProxy]
    textEditorProxy = OH_TextEditorProxy_Create();
    // [End input_case_input_TextEditorProxy]
    if (textEditorProxy == nullptr) {
        return IME_ERR_NULL_POINTER;
    }
    {
        std::lock_guard<std::mutex> lock(g_textMutex);
        g_display = PreviewDisplayState{};
    }
    result = ConstructTextEditorProxy(textEditorProxy);
    if (result != IME_ERR_OK) {
        ReleaseCEditor();
        return result;
    }
    // [Start input_case_input_attachOptions]
    attachOptions = OH_AttachOptions_Create(true);
    // [End input_case_input_attachOptions]
    if (attachOptions == nullptr) {
        ReleaseCEditor();
        return IME_ERR_NULL_POINTER;
    }
    // [Start input_case_input_OH_InputMethodController_Attach]
    result = OH_InputMethodController_Attach(textEditorProxy, attachOptions, &inputMethodProxy);
    if (result != IME_ERR_OK) {
        inputMethodProxy = nullptr;
        ReleaseCEditor();
    }
    return result;
    // [End input_case_input_OH_InputMethodController_Attach]
}

static napi_value AttachInputMethod(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, AttachEditor(), &result);
    return result;
}

static napi_value InputMethodDestroy(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, ReleaseCEditor(), &result);
    return result;
}

static napi_value IsInputMethodAttached(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_boolean(env, inputMethodProxy != nullptr, &result);
    return result;
}

static napi_value ShowInputMethodKeyboard(napi_env env, napi_callback_info info)
{
    const auto code = inputMethodProxy == nullptr ? IME_ERR_NULL_POINTER :
        OH_InputMethodProxy_ShowKeyboard(inputMethodProxy);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value GetCEditorDisplay(napi_env env, napi_callback_info info)
{
    std::lock_guard<std::mutex> lock(g_textMutex);
    napi_value result;
    napi_value value;
    napi_create_object(env, &result);
    napi_create_string_utf16(env, g_display.text.data(), g_display.text.size(), &value);
    napi_set_named_property(env, result, "text", value);
    napi_get_boolean(env, g_display.active, &value);
    napi_set_named_property(env, result, "active", value);
    napi_create_int32(env, g_display.underlineStyle, &value);
    napi_set_named_property(env, result, "underlineStyle", value);
    napi_create_uint32(env, g_display.underlineColor, &value);
    napi_set_named_property(env, result, "underlineColor", value);
    napi_get_boolean(env, g_display.hasUnderlineColor, &value);
    napi_set_named_property(env, result, "hasUnderlineColor", value);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "attachInputMethod", nullptr, AttachInputMethod, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "isInputMethodAttached", nullptr, IsInputMethodAttached, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "showInputMethodKeyboard", nullptr, ShowInputMethodKeyboard, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "getCEditorDisplay", nullptr, GetCEditorDisplay, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "inputMethodDestroy", nullptr, InputMethodDestroy, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module sampleModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&sampleModule);
}
// [End input_case_input_CPreview208]
