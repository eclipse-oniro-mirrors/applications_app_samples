/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "cap_error.h"

#include <native_drawing/drawing_error_code.h>
#include <native_drawing/drawing_matrix.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_record_cmd.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr int32_t MATRIX_ELEMENT_COUNT = 9;
constexpr int32_t STATUS_DOT_COUNT = 6;
constexpr int32_t CODE_TABLE_COUNT = 6;
constexpr float STATUS_DOT_RADIUS = 5.0F;
constexpr float MAX_RECT_SIDE = 4000.0F;
// 录制画布取 16x16，只验证接口链路，不需要真实尺寸。
constexpr int32_t RECORD_CANVAS_SIDE = 16;
// 错误码编号映射为色块高度时的取模基数与单步比例。
constexpr int32_t CODE_SCALE = 100;
// 汇总检查的网格列数，行数由总数自动推导。
constexpr int32_t SUMMARY_COLUMNS = 3;

// 读取当前错误码：OH_DRAWING_SUCCESS 为 0，其余为具体错误编号。
int32_t PeekCode()
{
    return static_cast<int32_t>(OH_Drawing_ErrorCodeGet());
}

void ResetCode()
{
    OH_Drawing_ErrorCodeReset();
}

bool IsSuccess(int32_t code)
{
    return code == static_cast<int32_t>(OH_DRAWING_SUCCESS);
}

// 触发一次参数为空的失败调用：销毁空对象，文档约定返回非法参数错误码。
int32_t TriggerNullParameter()
{
    const OH_Drawing_ErrorCode destroyUtils = OH_Drawing_RecordCmdUtilsDestroy(nullptr);
    const OH_Drawing_ErrorCode destroyCmd = OH_Drawing_RecordCmdDestroy(nullptr);
    if (destroyUtils != OH_DRAWING_SUCCESS) {
        return static_cast<int32_t>(destroyUtils);
    }
    return static_cast<int32_t>(destroyCmd);
}

// 触发一次尺寸非法的失败调用：以负尺寸开始录制，文档约定返回非法参数错误码。
int32_t TriggerInvalidSize()
{
    OH_Drawing_RecordCmdUtils *utils = OH_Drawing_RecordCmdUtilsCreate();
    if (utils == nullptr) {
        DRAWING_LOGW("TriggerInvalidSize create utils failed");
        return -1;
    }
    OH_Drawing_Canvas *recordCanvas = nullptr;
    const OH_Drawing_ErrorCode code = OH_Drawing_RecordCmdUtilsBeginRecording(utils, -1, -1, &recordCanvas);
    (void)OH_Drawing_RecordCmdUtilsDestroy(utils);
    return static_cast<int32_t>(code);
}

// 一行状态点：成功为绿色，失败为红色，蓝色保留给“未执行”。
void DrawStatusRow(OH_Drawing_Canvas *canvas, const cap::Frame &frame, int32_t okCount, int32_t doneCount,
    int32_t total)
{
    for (int32_t index = 0; index < total; ++index) {
        uint32_t color = cap::PaletteColor(5);
        if (index < okCount) {
            color = cap::PaletteColor(2);
        } else if (index < doneCount) {
            color = cap::PaletteColor(3);
        }
        const float cx = frame.X(10.0F) + frame.X(10.0F) * static_cast<float>(index);
        cap::FillCircleArea(canvas, color, cx, frame.Y(90.0F), STATUS_DOT_RADIUS);
    }
}

// 把错误码映射成色块高度：0 为最短，编号越大色块越高，便于快速分辨数值量级。
void DrawCodeBar(OH_Drawing_Canvas *canvas, const cap::Frame &frame, int32_t index, int32_t code, int32_t palette)
{
    const float left = frame.X(8.0F) + frame.X(15.0F) * static_cast<float>(index);
    const float ratio = IsSuccess(code) ? 0.05F : cap::ClampFloat(0.25F + static_cast<float>(code % CODE_SCALE) * 0.01F,
        0.1F, 1.0F);
    const float top = frame.Y(88.0F) - frame.Y(60.0F) * ratio;
    cap::FillRectArea(canvas, cap::PaletteColor(palette + index), left, top, left + frame.X(11.0F), frame.Y(88.0F));
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 5), 1.0F, left, frame.Y(20.0F), left + frame.X(11.0F),
        frame.Y(88.0F));
}

// 守卫式绘制矩形：先校验尺寸再调用接口，任何一步失败都不继续绘制。
bool DrawGuardedRect(OH_Drawing_Canvas *canvas, const cap::Frame &frame, uint32_t color)
{
    if (canvas == nullptr) {
        return false;
    }
    const float width = cap::ClampFloat(frame.Span(40.0F), 1.0F, MAX_RECT_SIDE);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(frame.centerX - width * 0.5F, frame.centerY - width * 0.5F,
        frame.centerX + width * 0.5F, frame.centerY + width * 0.5F);
    if (rect == nullptr) {
        DRAWING_LOGW("DrawGuardedRect create rect failed");
        return false;
    }
    cap::FillRectArea(canvas, cap::WithAlpha(color, 0.35F), OH_Drawing_RectGetLeft(rect), OH_Drawing_RectGetTop(rect),
        OH_Drawing_RectGetRight(rect), OH_Drawing_RectGetBottom(rect));
    OH_Drawing_RectDestroy(rect);
    return true;
}

// 检查一：矩阵创建与取值的往返流程。
bool CheckMatrixRoundTrip()
{
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(15.0F, 0.0F, 0.0F);
    if (matrix == nullptr) {
        return false;
    }
    float values[MATRIX_ELEMENT_COUNT] = {0.0F};
    const bool ok = OH_Drawing_MatrixGetAll(matrix, values) == OH_DRAWING_SUCCESS;
    OH_Drawing_MatrixDestroy(matrix);
    return ok;
}

// 检查二：路径填充类型的读写一致。
bool CheckPathFillType()
{
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if (path == nullptr) {
        return false;
    }
    OH_Drawing_PathSetFillType(path, PATH_FILL_TYPE_EVEN_ODD);
    OH_Drawing_PathFillType fillType = PATH_FILL_TYPE_WINDING;
    const bool ok = OH_Drawing_PathGetFillType(path, &fillType) == OH_DRAWING_SUCCESS &&
        fillType == PATH_FILL_TYPE_EVEN_ODD;
    OH_Drawing_PathDestroy(path);
    return ok;
}

// 检查三：录制对象的完整生命周期。
bool CheckRecordLifecycle()
{
    OH_Drawing_RecordCmdUtils *utils = OH_Drawing_RecordCmdUtilsCreate();
    if (utils == nullptr) {
        return false;
    }
    OH_Drawing_Canvas *recordCanvas = nullptr;
    if (OH_Drawing_RecordCmdUtilsBeginRecording(utils, RECORD_CANVAS_SIDE, RECORD_CANVAS_SIDE, &recordCanvas) !=
        OH_DRAWING_SUCCESS || recordCanvas == nullptr) {
        (void)OH_Drawing_RecordCmdUtilsDestroy(utils);
        return false;
    }
    OH_Drawing_RecordCmd *recordCmd = nullptr;
    const bool finished = OH_Drawing_RecordCmdUtilsFinishRecording(utils, &recordCmd) == OH_DRAWING_SUCCESS &&
        recordCmd != nullptr;
    if (recordCmd != nullptr) {
        (void)OH_Drawing_RecordCmdDestroy(recordCmd);
    }
    (void)OH_Drawing_RecordCmdUtilsDestroy(utils);
    return finished;
}

// 检查四：矩形创建后四个边界值可正常读取。
bool CheckRectBounds()
{
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(1.0F, 2.0F, 30.0F, 40.0F);
    if (rect == nullptr) {
        return false;
    }
    const bool ok = OH_Drawing_RectGetRight(rect) > OH_Drawing_RectGetLeft(rect) &&
        OH_Drawing_RectGetBottom(rect) > OH_Drawing_RectGetTop(rect);
    OH_Drawing_RectDestroy(rect);
    return ok;
}

// 检查五：错误码复位后应回到成功状态。
bool CheckResetBehavior()
{
    ResetCode();
    return IsSuccess(PeekCode());
}

// 0. 复位：复位后错误码归零，再次复核仍为零。
void SceneReset(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    ResetCode();
    const int32_t first = PeekCode();
    ResetCode();
    const int32_t second = PeekCode();
    // 两次复位后都应读到成功码，两个绿色状态点依次点亮。
    int32_t okCount = 0;
    if (IsSuccess(first)) {
        ++okCount;
    }
    if (IsSuccess(second)) {
        ++okCount;
    }
    cap::FillRoundRectArea(canvas, cap::WithAlpha(cap::PaletteColor(palette), 0.3F), frame.X(10.0F), frame.Y(20.0F),
        frame.X(90.0F), frame.Y(70.0F), frame.Span(8.0F));
    DrawStatusRow(canvas, frame, okCount, 2, STATUS_DOT_COUNT);
}

// 1. 空参数：对空对象调用接口，返回非法参数错误码。
void SceneNullParam(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    ResetCode();
    const int32_t direct = TriggerNullParameter();
    const int32_t recorded = PeekCode();
    // 返回值与随后读取到的错误码都应为非法参数，两个状态点分别校验。
    int32_t okCount = 0;
    if (direct == static_cast<int32_t>(OH_DRAWING_ERROR_INVALID_PARAMETER)) {
        ++okCount;
    }
    if (recorded == direct) {
        ++okCount;
    }
    DrawCodeBar(canvas, frame, 0, direct, palette);
    DrawStatusRow(canvas, frame, okCount, 2, STATUS_DOT_COUNT);
    DRAWING_LOGI("SceneNullParam direct=%{public}d recorded=%{public}d", direct, recorded);
}

// 2. 非法尺寸：以负尺寸开始录制，返回非法参数错误码。
void SceneInvalidSize(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    ResetCode();
    const int32_t code = TriggerInvalidSize();
    const int32_t recorded = PeekCode();
    int32_t okCount = 0;
    if (code == static_cast<int32_t>(OH_DRAWING_ERROR_INVALID_PARAMETER)) {
        ++okCount;
    }
    if (recorded == code) {
        ++okCount;
    }
    DrawCodeBar(canvas, frame, 0, code, palette);
    DrawStatusRow(canvas, frame, okCount, 2, STATUS_DOT_COUNT);
    DRAWING_LOGI("SceneInvalidSize code=%{public}d recorded=%{public}d", code, recorded);
}

// 3. 成功之后：连续成功调用不应产生错误码。
void SceneAfterSuccess(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float degree = params.Range(1, 20.0F, -90.0F, 90.0F);
    ResetCode();
    int32_t okCount = 0;
    // 第一个成功调用：创建矩阵。
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(degree, frame.centerX, frame.centerY);
    if (matrix != nullptr) {
        ++okCount;
        float values[MATRIX_ELEMENT_COUNT] = {0.0F};
        if (OH_Drawing_MatrixGetAll(matrix, values) == OH_DRAWING_SUCCESS) {
            ++okCount;
        }
        // 把矩阵真正作用到画布上，角度参数才会体现在画面里，而不是构造后立即释放。
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasConcatMatrix(canvas, matrix);
        cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 1), 2.0F, frame.centerX - frame.X(22.0F),
            frame.centerY - frame.Y(13.0F), frame.centerX + frame.X(22.0F), frame.centerY + frame.Y(13.0F));
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_MatrixDestroy(matrix);
    }
    // 两次成功调用之后，错误码应仍为成功。
    if (IsSuccess(PeekCode())) {
        ++okCount;
    }
    DrawStatusRow(canvas, frame, okCount, 3, STATUS_DOT_COUNT);
}

// 4. 失败之后：错误码会保持到被读取或复位，后续成功调用不会自动清零。
void SceneAfterFail(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    ResetCode();
    const int32_t failCode = TriggerNullParameter();
    // 失败后立即读取，应与失败返回值一致。
    const int32_t afterFail = PeekCode();
    int32_t okCount = 0;
    if (!IsSuccess(failCode)) {
        ++okCount;
    }
    if (afterFail == failCode) {
        ++okCount;
    }
    DrawCodeBar(canvas, frame, 0, failCode, palette);
    DrawStatusRow(canvas, frame, okCount, 2, STATUS_DOT_COUNT);
}

// 5. 恢复：失败后复位即可继续正常工作。
void SceneRecover(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    ResetCode();
    const int32_t failCode = TriggerNullParameter();
    ResetCode();
    const int32_t recovered = PeekCode();
    // 复位后重新执行一次成功调用，验证调用链已恢复正常。
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0F, 0.0F, frame.Span(20.0F), frame.Span(20.0F));
    const bool rectOk = rect != nullptr;
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
    int32_t okCount = 0;
    if (!IsSuccess(failCode)) {
        ++okCount;
    }
    if (IsSuccess(recovered)) {
        ++okCount;
    }
    if (rectOk) {
        ++okCount;
    }
    // 恢复后的矩形绘制在画面中央，表示调用链已可用。
    (void)DrawGuardedRect(canvas, frame, cap::PaletteColor(palette + 2));
    DrawStatusRow(canvas, frame, okCount, 3, STATUS_DOT_COUNT);
}

// 6. 错误码表：把常用错误码画成柱状图，柱高按编号缩放。
void SceneCodeTable(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const int32_t codes[CODE_TABLE_COUNT] = {
        static_cast<int32_t>(OH_DRAWING_SUCCESS),
        static_cast<int32_t>(OH_DRAWING_ERROR_NO_PERMISSION),
        static_cast<int32_t>(OH_DRAWING_ERROR_INVALID_PARAMETER),
        static_cast<int32_t>(OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE),
        static_cast<int32_t>(OH_DRAWING_ERROR_ALLOCATION_FAILED),
        static_cast<int32_t>(OH_DRAWING_ERROR_FILE_NOT_FOUND),
    };
    for (int32_t index = 0; index < CODE_TABLE_COUNT; ++index) {
        DrawCodeBar(canvas, frame, index, codes[index], palette);
    }
    // 底部基准线对应错误码 0，柱高即相对大小。
    cap::StrokeLineArea(canvas, cap::PaletteColor(palette + 5), 1.0F, frame.X(6.0F), frame.Y(88.0F),
        frame.X(96.0F), frame.Y(88.0F));
    DrawStatusRow(canvas, frame, CODE_TABLE_COUNT, CODE_TABLE_COUNT, STATUS_DOT_COUNT);
}

// 7. 矩形守卫：非法尺寸先被拦住，合法尺寸才进入绘制流程。
void SceneGuardedRect(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float ratio = params.Range(1, 0.6F, 0.1F, 1.0F);
    // 传入 0 尺寸模拟非法入参，守卫函数应直接拒绝且不产生错误码。
    const bool rejected = !DrawGuardedRect(nullptr, frame, cap::PaletteColor(palette));
    const bool accepted = DrawGuardedRect(canvas, frame, cap::PaletteColor(palette + 1));
    int32_t okCount = 0;
    if (rejected) {
        ++okCount;
    }
    if (accepted) {
        ++okCount;
    }
    // 守卫通过后叠加一层按比例缩放的矩形，展示实际绘制结果。
    const float side = frame.Span(40.0F) * cap::ClampFloat(ratio, 0.1F, 1.0F);
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 4), 2.0F, frame.centerX - side * 0.5F,
        frame.centerY - side * 0.5F, frame.centerX + side * 0.5F, frame.centerY + side * 0.5F);
    DrawStatusRow(canvas, frame, okCount, 2, STATUS_DOT_COUNT);
}

// 8. 矩阵守卫：每一步都检查返回值，任一失败即停止后续操作。
void SceneGuardedMatrix(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float degree = params.Range(1, 25.0F, -180.0F, 180.0F);
    ResetCode();
    int32_t okCount = 0;
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(degree, frame.centerX, frame.centerY);
    if (matrix == nullptr) {
        DRAWING_LOGE("SceneGuardedMatrix create matrix failed");
        DrawStatusRow(canvas, frame, 0, 1, STATUS_DOT_COUNT);
        return;
    }
    ++okCount;
    float values[MATRIX_ELEMENT_COUNT] = {0.0F};
    if (OH_Drawing_MatrixGetAll(matrix, values) == OH_DRAWING_SUCCESS) {
        ++okCount;
    }
    bool isAffine = false;
    if (OH_Drawing_MatrixIsAffine(matrix, &isAffine) == OH_DRAWING_SUCCESS) {
        ++okCount;
    }
    bool rectStaysRect = false;
    if (OH_Drawing_MatrixRectStaysRect(matrix, &rectStaysRect) == OH_DRAWING_SUCCESS) {
        ++okCount;
    }
    // 把取值结果画成条形图，验证守卫链读取到的数据可用于展示。
    const int32_t barCount = 4;
    for (int32_t index = 0; index < barCount; ++index) {
        const float ratio = cap::ClampFloat(values[index] / 2.0F, -1.0F, 1.0F);
        const float barHeight = frame.Y(10.0F) * (ratio < 0.0F ? -ratio : ratio);
        const float left = frame.X(12.0F) + frame.X(18.0F) * static_cast<float>(index);
        cap::FillRectArea(canvas, cap::PaletteColor(palette + index), left, frame.Y(50.0F) - barHeight,
            left + frame.X(12.0F), frame.Y(50.0F) + barHeight);
    }
    cap::StrokeLineArea(canvas, cap::PaletteColor(palette + 5), 1.0F, frame.X(8.0F), frame.Y(50.0F),
        frame.X(92.0F), frame.Y(50.0F));
    DrawStatusRow(canvas, frame, okCount, 4, STATUS_DOT_COUNT);
    OH_Drawing_MatrixDestroy(matrix);
}

// 9. 总结：执行一组独立检查，把通过情况汇总成网格。
void SceneSummary(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    // 六项检查与 STATUS_DOT_COUNT 对齐，每项占一个格子。
    const bool results[STATUS_DOT_COUNT] = {
        CheckMatrixRoundTrip(),
        CheckPathFillType(),
        CheckRecordLifecycle(),
        CheckRectBounds(),
        CheckResetBehavior(),
        !IsSuccess(TriggerNullParameter()),
    };
    int32_t okCount = 0;
    for (int32_t index = 0; index < STATUS_DOT_COUNT; ++index) {
        // 每项检查占一个格子，绿色为通过、红色为失败，格子位置固定便于对照。
        const int32_t column = index % SUMMARY_COLUMNS;
        const int32_t row = index / SUMMARY_COLUMNS;
        const float left = frame.X(18.0F) + frame.X(24.0F) * static_cast<float>(column);
        const float top = frame.Y(28.0F) + frame.Y(24.0F) * static_cast<float>(row);
        const uint32_t color = results[index] ? cap::PaletteColor(palette + 2) : cap::PaletteColor(palette + 3);
        cap::FillRoundRectArea(canvas, color, left, top, left + frame.X(18.0F), top + frame.Y(18.0F),
            frame.Span(4.0F));
        if (results[index]) {
            ++okCount;
        }
    }
    DrawStatusRow(canvas, frame, okCount, STATUS_DOT_COUNT, STATUS_DOT_COUNT);
}
} // namespace

void DrawErrorScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawErrorScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < ERROR_RESET || scene >= ERROR_SCENE_COUNT) {
        DRAWING_LOGE("DrawErrorScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case ERROR_RESET:
            SceneReset(canvas, frame, params);
            break;
        case ERROR_NULL_PARAM:
            SceneNullParam(canvas, frame, params);
            break;
        case ERROR_INVALID_SIZE:
            SceneInvalidSize(canvas, frame, params);
            break;
        case ERROR_AFTER_SUCCESS:
            SceneAfterSuccess(canvas, frame, params);
            break;
        case ERROR_AFTER_FAIL:
            SceneAfterFail(canvas, frame, params);
            break;
        case ERROR_RECOVER:
            SceneRecover(canvas, frame, params);
            break;
        case ERROR_CODE_TABLE:
            SceneCodeTable(canvas, frame, params);
            break;
        case ERROR_GUARDED_RECT:
            SceneGuardedRect(canvas, frame, params);
            break;
        case ERROR_GUARDED_MATRIX:
            SceneGuardedMatrix(canvas, frame, params);
            break;
        case ERROR_SUMMARY:
            SceneSummary(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawErrorScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
