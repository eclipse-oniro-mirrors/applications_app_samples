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
#include "cap_record.h"

#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_record_cmd.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr int32_t OVERLAY_COUNT = 3;
constexpr float OVERLAY_ALPHA = 0.45F;
// 录制未完成时状态条只点亮前两步：开始录制与绘制内容。
constexpr int32_t STAGE_AFTER_PAINT = 2;
// 尺寸换算的缩放系数兜底值，避免分母为 0。
constexpr float MIN_RECORD_SCALE = 0.1F;

// 录制工具与录制结果成对出现，释放顺序与创建顺序相反。
struct RecordUnit {
    OH_Drawing_RecordCmdUtils *utils = nullptr;
    OH_Drawing_RecordCmd *recordCmd = nullptr;
};

void ReleaseRecord(RecordUnit &unit)
{
    if (unit.recordCmd != nullptr) {
        (void)OH_Drawing_RecordCmdDestroy(unit.recordCmd);
        unit.recordCmd = nullptr;
    }
    if (unit.utils != nullptr) {
        (void)OH_Drawing_RecordCmdUtilsDestroy(unit.utils);
        unit.utils = nullptr;
    }
}

// 开始录制：成功时通过出参返回录制画布，该画布由录制工具持有，调用方无需释放。
bool BeginRecord(RecordUnit &unit, int32_t width, int32_t height, OH_Drawing_Canvas **recordCanvas)
{
    if (recordCanvas == nullptr) {
        return false;
    }
    *recordCanvas = nullptr;
    unit.utils = OH_Drawing_RecordCmdUtilsCreate();
    if (unit.utils == nullptr) {
        DRAWING_LOGE("BeginRecord create utils failed");
        return false;
    }
    const OH_Drawing_ErrorCode code = OH_Drawing_RecordCmdUtilsBeginRecording(unit.utils, width, height, recordCanvas);
    if (code != OH_DRAWING_SUCCESS || *recordCanvas == nullptr) {
        DRAWING_LOGW("BeginRecord failed, code=%{public}d", static_cast<int32_t>(code));
        ReleaseRecord(unit);
        return false;
    }
    return true;
}

// 结束录制并生成回放对象，之后可多次重复回放。
bool EndRecord(RecordUnit &unit)
{
    if (unit.utils == nullptr) {
        return false;
    }
    const OH_Drawing_ErrorCode code = OH_Drawing_RecordCmdUtilsFinishRecording(unit.utils, &unit.recordCmd);
    if (code != OH_DRAWING_SUCCESS || unit.recordCmd == nullptr) {
        DRAWING_LOGW("EndRecord failed, code=%{public}d", static_cast<int32_t>(code));
        return false;
    }
    return true;
}

bool ReplayRecord(OH_Drawing_Canvas *canvas, OH_Drawing_RecordCmd *recordCmd)
{
    if (canvas == nullptr || recordCmd == nullptr) {
        return false;
    }
    const OH_Drawing_ErrorCode code = OH_Drawing_CanvasDrawRecordCmd(canvas, recordCmd);
    if (code != OH_DRAWING_SUCCESS) {
        DRAWING_LOGW("ReplayRecord failed, code=%{public}d", static_cast<int32_t>(code));
        return false;
    }
    return true;
}

// 录制内容：一组几何图形，形状与位置固定，便于观察多次回放是否一致。
void PaintDemoContent(OH_Drawing_Canvas *recordCanvas, int32_t width, int32_t height, int32_t palette)
{
    if (recordCanvas == nullptr || width <= 0 || height <= 0) {
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    cap::FillRoundRectArea(recordCanvas, cap::PaletteColor(palette), frame.X(10.0F), frame.Y(14.0F),
        frame.X(48.0F), frame.Y(44.0F), frame.Span(6.0F));
    cap::FillCircleArea(recordCanvas, cap::PaletteColor(palette + cap::SLOT_GREEN), frame.X(70.0F), frame.Y(30.0F),
        frame.Span(14.0F));
    cap::StrokeRectArea(recordCanvas, cap::PaletteColor(palette + cap::SLOT_RED), 2.0F, frame.X(14.0F),
        frame.Y(58.0F), frame.X(86.0F), frame.Y(84.0F));
    cap::StrokeLineArea(recordCanvas, cap::PaletteColor(palette + cap::SLOT_PURPLE), 2.0F, frame.X(14.0F),
        frame.Y(84.0F), frame.X(86.0F), frame.Y(58.0F));
}

// 在画布左上角画一条状态条，长度随进度递增，用于表示录制流程走到了哪一步。
void DrawStageBar(OH_Drawing_Canvas *canvas, const cap::Frame &frame, int32_t stage, int32_t total, int32_t palette)
{
    const int32_t limited = stage < 0 ? 0 : (stage > total ? total : stage);
    for (int32_t index = 0; index < total; ++index) {
        const float left = frame.X(6.0F) + frame.X(10.0F) * static_cast<float>(index);
        const uint32_t color = index < limited ? cap::PaletteColor(palette + cap::SLOT_GREEN) :
            cap::PaletteColor(palette + cap::SLOT_CYAN);
        cap::FillRectArea(canvas, color, left, frame.Y(4.0F), left + frame.X(7.0F), frame.Y(7.0F));
    }
}

// 0. 基础录制：录制一组绘制命令后回放一次，画面应与直接绘制一致。
void SceneBasic(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    RecordUnit unit;
    OH_Drawing_Canvas *recordCanvas = nullptr;
    if (!BeginRecord(unit, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height), &recordCanvas)) {
        return;
    }
    PaintDemoContent(recordCanvas, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height), palette);
    if (!EndRecord(unit)) {
        ReleaseRecord(unit);
        return;
    }
    // 回放结果直接画在目标画布上，三步状态条表示录制、结束、回放全部完成。
    DrawStageBar(canvas, frame, OVERLAY_COUNT, OVERLAY_COUNT, palette);
    (void)ReplayRecord(canvas, unit.recordCmd);
    ReleaseRecord(unit);
}

// 1. 录制期变换：录制画布上的变换会被一并记录，回放时自动重放。
void SceneTransform(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float degree = params.Range(1, 12.0F, -45.0F, 45.0F);
    RecordUnit unit;
    OH_Drawing_Canvas *recordCanvas = nullptr;
    if (!BeginRecord(unit, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height), &recordCanvas)) {
        return;
    }
    OH_Drawing_CanvasSave(recordCanvas);
    OH_Drawing_CanvasRotate(recordCanvas, degree, frame.centerX, frame.centerY);
    PaintDemoContent(recordCanvas, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height), palette);
    OH_Drawing_CanvasRestore(recordCanvas);
    if (!EndRecord(unit)) {
        ReleaseRecord(unit);
        return;
    }
    DrawStageBar(canvas, frame, OVERLAY_COUNT, OVERLAY_COUNT, palette);
    (void)ReplayRecord(canvas, unit.recordCmd);
    ReleaseRecord(unit);
}

// 2. 多次回放：同一份录制命令回放两次，第一次原位、第二次平移，形成叠影对照。
void SceneReplayTwice(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float offset = frame.X(params.Range(1, 6.0F, 0.0F, 20.0F));
    RecordUnit unit;
    OH_Drawing_Canvas *recordCanvas = nullptr;
    if (!BeginRecord(unit, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height), &recordCanvas)) {
        return;
    }
    PaintDemoContent(recordCanvas, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height), palette);
    if (!EndRecord(unit)) {
        ReleaseRecord(unit);
        return;
    }
    // 第二次回放前平移目标画布，录制命令本身不需要修改。
    (void)ReplayRecord(canvas, unit.recordCmd);
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasTranslate(canvas, offset, offset);
    OH_Drawing_CanvasScale(canvas, 0.6F, 0.6F);
    (void)ReplayRecord(canvas, unit.recordCmd);
    OH_Drawing_CanvasRestore(canvas);
    DrawStageBar(canvas, frame, OVERLAY_COUNT, OVERLAY_COUNT, palette);
    ReleaseRecord(unit);
}

// 3. 命令嵌套：先录制内层命令，再在内层录制画布之上继续录制外层，最后整体回放。
void SceneNesting(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const int32_t width = static_cast<int32_t>(frame.width);
    const int32_t height = static_cast<int32_t>(frame.height);
    RecordUnit inner;
    OH_Drawing_Canvas *innerCanvas = nullptr;
    if (!BeginRecord(inner, width, height, &innerCanvas)) {
        return;
    }
    cap::FillCircleArea(innerCanvas, cap::PaletteColor(palette + 1), frame.centerX, frame.centerY,
        frame.Span(20.0F));
    if (!EndRecord(inner)) {
        ReleaseRecord(inner);
        return;
    }
    RecordUnit outer;
    OH_Drawing_Canvas *outerCanvas = nullptr;
    if (!BeginRecord(outer, width, height, &outerCanvas)) {
        ReleaseRecord(inner);
        return;
    }
    // 外层录制画布上绘制内层录制命令，这是录制流程内组合命令的推荐方式。
    const OH_Drawing_ErrorCode nestCode = OH_Drawing_CanvasDrawRecordCmdNesting(outerCanvas, inner.recordCmd);
    if (nestCode != OH_DRAWING_SUCCESS) {
        DRAWING_LOGW("SceneNesting draw nesting failed, code=%{public}d", static_cast<int32_t>(nestCode));
    }
    PaintDemoContent(outerCanvas, width, height, palette);
    const bool finished = EndRecord(outer);
    if (finished) {
        (void)ReplayRecord(canvas, outer.recordCmd);
    }
    DrawStageBar(canvas, frame, finished ? OVERLAY_COUNT : STAGE_AFTER_PAINT, OVERLAY_COUNT, palette);
    ReleaseRecord(outer);
    ReleaseRecord(inner);
}

// 4. 录制尺寸：按缩小后的尺寸录制，回放时放大，验证录制命令与目标画布尺寸解耦。
void SceneResized(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const float scale = params.Range(1, 2.0F, 1.2F, 3.0F);
    // 除零保护：缩放系数在参数裁剪后仍按最小正数兜底，再做尺寸换算。
    const float safeScale = scale < MIN_RECORD_SCALE ? MIN_RECORD_SCALE : scale;
    const int32_t recordWidth = static_cast<int32_t>(frame.width / safeScale);
    const int32_t recordHeight = static_cast<int32_t>(frame.height / safeScale);
    if (recordWidth <= 0 || recordHeight <= 0) {
        DRAWING_LOGW("SceneResized invalid record size, scale=%{public}f", scale);
        return;
    }
    RecordUnit unit;
    OH_Drawing_Canvas *recordCanvas = nullptr;
    if (!BeginRecord(unit, recordWidth, recordHeight, &recordCanvas)) {
        return;
    }
    PaintDemoContent(recordCanvas, recordWidth, recordHeight, palette);
    if (!EndRecord(unit)) {
        ReleaseRecord(unit);
        return;
    }
    // 目标画布放大同样倍数后回放，录制内容被等比拉伸到整个画面。
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasScale(canvas, scale, scale);
    (void)ReplayRecord(canvas, unit.recordCmd);
    OH_Drawing_CanvasRestore(canvas);
    DrawStageBar(canvas, frame, OVERLAY_COUNT, OVERLAY_COUNT, palette);
    ReleaseRecord(unit);
}

// 5. 图层录制：录制命令中包含 SaveLayer，回放时图层内的透明度设置同样生效。
void SceneLayer(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float alpha = params.Range(1, 0.5F, 0.1F, 1.0F);
    RecordUnit unit;
    OH_Drawing_Canvas *recordCanvas = nullptr;
    if (!BeginRecord(unit, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height), &recordCanvas)) {
        return;
    }
    OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(frame.X(8.0F), frame.Y(10.0F), frame.X(92.0F), frame.Y(92.0F));
    if (bounds != nullptr) {
        // 图层内统一使用半透明画刷，SaveLayer 让透明度在组内叠加。
        OH_Drawing_CanvasSaveLayer(recordCanvas, bounds, nullptr);
        cap::FillRectArea(recordCanvas, cap::WithAlpha(cap::PaletteColor(palette), alpha), frame.X(12.0F),
            frame.Y(16.0F), frame.X(60.0F), frame.Y(54.0F));
        cap::FillRectArea(recordCanvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_GREEN), alpha),
            frame.X(36.0F), frame.Y(40.0F), frame.X(86.0F), frame.Y(84.0F));
        OH_Drawing_CanvasRestore(recordCanvas);
        OH_Drawing_RectDestroy(bounds);
    }
    if (!EndRecord(unit)) {
        ReleaseRecord(unit);
        return;
    }
    DrawStageBar(canvas, frame, OVERLAY_COUNT, OVERLAY_COUNT, palette);
    (void)ReplayRecord(canvas, unit.recordCmd);
    ReleaseRecord(unit);
}

// 6. 状态栈录制：录制过程中多次 Save/Restore，回放时状态栈顺序被完整还原。
void SceneSaveRestore(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float step = frame.X(params.Range(1, 8.0F, 0.0F, 20.0F));
    RecordUnit unit;
    OH_Drawing_Canvas *recordCanvas = nullptr;
    if (!BeginRecord(unit, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height), &recordCanvas)) {
        return;
    }
    for (int32_t index = 0; index < OVERLAY_COUNT; ++index) {
        OH_Drawing_CanvasSave(recordCanvas);
        OH_Drawing_CanvasTranslate(recordCanvas, step * static_cast<float>(index),
            step * static_cast<float>(index));
        // 每层方块使用不同颜色，偏移量依次累加，还原后不会互相污染。
        cap::FillRectArea(recordCanvas, cap::PaletteColor(palette + index), frame.X(20.0F), frame.Y(20.0F),
            frame.X(50.0F), frame.Y(50.0F));
        OH_Drawing_CanvasRestore(recordCanvas);
    }
    if (!EndRecord(unit)) {
        ReleaseRecord(unit);
        return;
    }
    DrawStageBar(canvas, frame, OVERLAY_COUNT, OVERLAY_COUNT, palette);
    (void)ReplayRecord(canvas, unit.recordCmd);
    ReleaseRecord(unit);
}

// 7. 叠加回放：同一份录制命令以逐渐偏移的位置多次回放，形成拖影式的叠加效果。
void SceneOverlay(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float offset = frame.X(params.Range(1, 4.0F, 0.0F, 12.0F));
    RecordUnit unit;
    OH_Drawing_Canvas *recordCanvas = nullptr;
    if (!BeginRecord(unit, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height), &recordCanvas)) {
        return;
    }
    PaintDemoContent(recordCanvas, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height), palette);
    if (!EndRecord(unit)) {
        ReleaseRecord(unit);
        return;
    }
    for (int32_t index = 0; index < OVERLAY_COUNT; ++index) {
        OH_Drawing_CanvasSave(canvas);
        // 每次回放的位置与缩放都不同，叠加后得到由大到小的拖影。
        const float ratio = 1.0F - 0.2F * static_cast<float>(index);
        OH_Drawing_CanvasTranslate(canvas, offset * static_cast<float>(index), offset * static_cast<float>(index));
        OH_Drawing_CanvasScale(canvas, ratio, ratio);
        (void)ReplayRecord(canvas, unit.recordCmd);
        OH_Drawing_CanvasRestore(canvas);
    }
    DrawStageBar(canvas, frame, OVERLAY_COUNT, OVERLAY_COUNT, palette);
    ReleaseRecord(unit);
}
} // namespace

void DrawRecordScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawRecordScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < RECORD_BASIC || scene >= RECORD_SCENE_COUNT) {
        DRAWING_LOGE("DrawRecordScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case RECORD_BASIC:
            SceneBasic(canvas, frame, params);
            break;
        case RECORD_TRANSFORM:
            SceneTransform(canvas, frame, params);
            break;
        case RECORD_REPLAY_TWICE:
            SceneReplayTwice(canvas, frame, params);
            break;
        case RECORD_NESTING:
            SceneNesting(canvas, frame, params);
            break;
        case RECORD_RESIZED:
            SceneResized(canvas, frame, params);
            break;
        case RECORD_LAYER:
            SceneLayer(canvas, frame, params);
            break;
        case RECORD_SAVE_RESTORE:
            SceneSaveRestore(canvas, frame, params);
            break;
        case RECORD_OVERLAY:
            SceneOverlay(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawRecordScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
