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
#include "cap_matrix.h"

#include <cmath>

#include <native_drawing/drawing_matrix.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_rect.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
// 矩阵按 3x3 存储，GetAll 一次取出全部九个元素。
constexpr int32_t MATRIX_ELEMENT_COUNT = 9;
constexpr int32_t SAMPLE_POINT_COUNT = 4;
constexpr int32_t MARKER_SIDES = 3;
// 采样点顺序：左上、右上、右下、左下，与 BuildSamplePoints 的填充顺序一致。
constexpr int32_t QUAD_LEFT_TOP = 0;
constexpr int32_t QUAD_RIGHT_TOP = 1;
constexpr int32_t QUAD_RIGHT_BOTTOM = 2;
constexpr int32_t QUAD_LEFT_BOTTOM = 3;
// 条形图把矩阵元素按该值的模归一化，超过后按边界显示。
constexpr float VALUE_NORMALIZE_BASE = 50.0F;
// 参数面板下标：各场景第 2、3 位含义不同，按场景分别命名。
constexpr int32_t PARAM_DY = 2;
constexpr int32_t PARAM_PIVOT_X = 2;
constexpr int32_t PARAM_PIVOT_Y = 3;
constexpr int32_t PARAM_AXIS = 2;
constexpr int32_t PARAM_CONCAT_DX = 2;
constexpr int32_t PARAM_PREPOST_DX = 2;
constexpr int32_t PARAM_PREPOST_SCALE = 3;
constexpr int32_t PARAM_MAP_SCALE = 2;

// 观测图形：一个三角形，旋转、斜切、翻转后其朝向变化一目了然。
OH_Drawing_Path *CreateMarkerPath(const cap::Frame &frame, float sizePercent)
{
    return cap::CreatePolygonPath(frame.centerX, frame.centerY, frame.Span(sizePercent), MARKER_SIDES);
}

// 用矩阵绘制观测图形：ConcatMatrix 在当前画布矩阵上叠加，Save/Restore 保证不影响其余绘制。
void DrawWithMatrix(OH_Drawing_Canvas *canvas, OH_Drawing_Matrix *matrix, OH_Drawing_Path *path, uint32_t color,
    float width)
{
    if (matrix == nullptr || path == nullptr) {
        return;
    }
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    cap::StrokePathArea(canvas, color, width, path);
    OH_Drawing_CanvasRestore(canvas);
}

// 把矩阵九个元素画成条形图：正数向上、负数向下，便于读取变换后的数值。
void DrawMatrixBars(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const float *values, int32_t count)
{
    for (int32_t index = 0; index < count; ++index) {
        const float normalized = cap::ClampFloat(values[index] / VALUE_NORMALIZE_BASE, -1.0F, 1.0F);
        const float barHeight = frame.Y(14.0F) * std::fabs(normalized);
        const float left = frame.X(4.0F) + frame.X(10.0F) * static_cast<float>(index);
        const float right = left + frame.X(6.0F);
        if (normalized >= 0.0F) {
            cap::FillRectArea(canvas, cap::PaletteColor(index), left, frame.Y(88.0F) - barHeight, right,
                frame.Y(88.0F));
        } else {
            cap::FillRectArea(canvas, cap::PaletteColor(index), left, frame.Y(88.0F), right,
                frame.Y(88.0F) + barHeight);
        }
    }
    // 零基准线，区分正负元素。
    cap::StrokeLineArea(canvas, cap::PaletteColor(cap::SLOT_CYAN), 1.0F, frame.X(3.0F), frame.Y(88.0F),
        frame.X(97.0F), frame.Y(88.0F));
}

// 画一组点，用同色小圆标记，便于比较映射前后的位置关系。
void DrawPoints(OH_Drawing_Canvas *canvas, const OH_Drawing_Point2D *points, int32_t count, int32_t palette,
    float radius)
{
    for (int32_t index = 0; index < count; ++index) {
        cap::FillCircleArea(canvas, cap::PaletteColor(palette + index), points[index].x, points[index].y, radius);
    }
}

// 填充采样点：以画布中心为基准排成矩形，作为映射的输入。
void BuildSamplePoints(const cap::Frame &frame, OH_Drawing_Point2D *points, int32_t count)
{
    const float offsetX = frame.X(22.0F);
    const float offsetY = frame.Y(18.0F);
    for (int32_t index = 0; index < count; ++index) {
        // 依次为左上、右上、右下、左下，构成顺时针矩形。
        const bool rightSide = (index == 1 || index == 2);
        const bool bottomSide = (index >= 2);
        points[index].x = frame.centerX + (rightSide ? offsetX : -offsetX);
        points[index].y = frame.centerY + (bottomSide ? offsetY : -offsetY);
    }
}

// 0. 单位矩阵：不做任何变换，同时把九个元素取出来画成条形图。
void SceneIdentity(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    if (matrix == nullptr) {
        DRAWING_LOGE("SceneIdentity create matrix failed");
        return;
    }
    float values[MATRIX_ELEMENT_COUNT] = {0.0F};
    const OH_Drawing_ErrorCode code = OH_Drawing_MatrixGetAll(matrix, values);
    const bool isIdentity = OH_Drawing_MatrixIsIdentity(matrix);
    OH_Drawing_Path *path = CreateMarkerPath(frame, 18.0F);
    if (path != nullptr) {
        // 参照图形：不使用矩阵直接绘制，与单位矩阵绘制的图形应完全重合。
        cap::StrokePathArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_PURPLE), 0.35F), 5.0F,
            path);
        DrawWithMatrix(canvas, matrix, path, cap::PaletteColor(palette), 2.0F);
        OH_Drawing_PathDestroy(path);
    }
    if (code == OH_DRAWING_SUCCESS) {
        DrawMatrixBars(canvas, frame, values, MATRIX_ELEMENT_COUNT);
    } else {
        DRAWING_LOGW("SceneIdentity getAll failed, code=%{public}d", static_cast<int32_t>(code));
    }
    // 单位矩阵下图形保持不变，右上角的色块作为“未变换”的视觉标记。
    if (isIdentity) {
        cap::FillRectArea(canvas, cap::PaletteColor(palette + cap::SLOT_GREEN), frame.X(86.0F), frame.Y(6.0F),
            frame.X(94.0F), frame.Y(12.0F));
    }
    OH_Drawing_MatrixDestroy(matrix);
}

// 1. 平移：CreateTranslation 直接构造平移矩阵，参数控制位移大小。
void SceneTranslate(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float dx = frame.X(params.Range(1, 10.0F, -30.0F, 30.0F));
    const float dy = frame.Y(params.Range(PARAM_DY, 8.0F, -30.0F, 30.0F));
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateTranslation(dx, dy);
    OH_Drawing_Path *path = CreateMarkerPath(frame, 16.0F);
    if (matrix != nullptr && path != nullptr) {
        cap::StrokePathArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_PURPLE), 0.3F), 1.0F, path);
        DrawWithMatrix(canvas, matrix, path, cap::PaletteColor(palette), 2.0F);
        // 位移向量用带端点的直线标出，方向与变换矩阵一致。
        cap::StrokeLineArea(canvas, cap::PaletteColor(palette + cap::SLOT_RED), 2.0F, frame.centerX, frame.centerY,
            frame.centerX + dx, frame.centerY + dy);
        const OH_Drawing_Point2D target = {frame.centerX + dx, frame.centerY + dy};
        DrawPoints(canvas, &target, 1, palette + cap::SLOT_RED, 4.0F);
    }
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    if (matrix != nullptr) {
        OH_Drawing_MatrixDestroy(matrix);
    }
}

// 2. 缩放：CreateScale 以指定点为中心缩放，中心点取画布中心保证图形不跑出屏幕。
void SceneScale(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float scale = params.Range(1, 1.5F, 0.3F, 2.5F);
    const float pivotX = frame.X(params.Range(PARAM_PIVOT_X, 50.0F, 10.0F, 90.0F));
    const float pivotY = frame.Y(params.Range(PARAM_PIVOT_Y, 50.0F, 10.0F, 90.0F));
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateScale(scale, scale, pivotX, pivotY);
    OH_Drawing_Path *path = CreateMarkerPath(frame, 16.0F);
    if (matrix != nullptr && path != nullptr) {
        cap::StrokePathArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_PURPLE), 0.3F), 1.0F, path);
        DrawWithMatrix(canvas, matrix, path, cap::PaletteColor(palette), 2.0F);
        // 缩放中心用十字标记，帮助理解固定点的作用。
        cap::StrokeLineArea(canvas, cap::PaletteColor(palette + 1), 1.0F, pivotX - frame.X(4.0F), pivotY,
            pivotX + frame.X(4.0F), pivotY);
        cap::StrokeLineArea(canvas, cap::PaletteColor(palette + 1), 1.0F, pivotX, pivotY - frame.Y(4.0F), pivotX,
            pivotY + frame.Y(4.0F));
    }
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    if (matrix != nullptr) {
        OH_Drawing_MatrixDestroy(matrix);
    }
}

// 3. 旋转：CreateRotation 绕给定点旋转，角度参数可正可负。
void SceneRotate(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float degree = params.Range(1, 30.0F, -180.0F, 180.0F);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(degree, frame.centerX, frame.centerY);
    OH_Drawing_Path *path = CreateMarkerPath(frame, 18.0F);
    if (matrix != nullptr && path != nullptr) {
        cap::StrokePathArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_PURPLE), 0.3F), 1.0F, path);
        DrawWithMatrix(canvas, matrix, path, cap::PaletteColor(palette), 2.0F);
        // 画一条从中心指向原始朝向的射线，便于观察旋转角度。
        const float radian = degree * cap::PI / 180.0F;
        cap::StrokeLineArea(canvas, cap::PaletteColor(palette + cap::SLOT_GREEN), 2.0F, frame.centerX, frame.centerY,
            frame.centerX + frame.Span(26.0F) * std::cos(radian),
            frame.centerY + frame.Span(26.0F) * std::sin(radian));
    }
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    if (matrix != nullptr) {
        OH_Drawing_MatrixDestroy(matrix);
    }
}

// 4. 斜切：PreSkew 以正切值入参，先按角度换算再作用到矩阵上。
void SceneSkew(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const float degree = params.Range(1, 20.0F, -45.0F, 45.0F);
    const int32_t axis = params.Choice(PARAM_AXIS, 2, 0);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_Path *path = CreateMarkerPath(frame, 18.0F);
    if (matrix != nullptr) {
        const float tangent = cap::DegreeToTan(degree);
        // axis 为 0 时只沿水平方向斜切，为 1 时同时沿两个方向斜切。
        const OH_Drawing_ErrorCode code = OH_Drawing_MatrixPreSkew(matrix, tangent, axis == 0 ? 0.0F : tangent,
            frame.centerX, frame.centerY);
        if (code != OH_DRAWING_SUCCESS) {
            DRAWING_LOGW("SceneSkew preSkew failed, code=%{public}d", static_cast<int32_t>(code));
        }
    }
    if (matrix != nullptr && path != nullptr) {
        cap::StrokePathArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_PURPLE), 0.3F), 1.0F, path);
        DrawWithMatrix(canvas, matrix, path, cap::PaletteColor(palette), 2.0F);
    }
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    if (matrix != nullptr) {
        OH_Drawing_MatrixDestroy(matrix);
    }
}

// 5. 矩阵相乘：两个矩阵先合成再绘制，与逐个叠加得到的结果一致。
void SceneConcat(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float degree = params.Range(1, 30.0F, -180.0F, 180.0F);
    const float dx = frame.X(params.Range(PARAM_CONCAT_DX, 10.0F, -30.0F, 30.0F));
    OH_Drawing_Matrix *translate = OH_Drawing_MatrixCreateTranslation(dx, 0.0F);
    OH_Drawing_Matrix *rotate = OH_Drawing_MatrixCreateRotation(degree, frame.centerX, frame.centerY);
    OH_Drawing_Matrix *total = OH_Drawing_MatrixCreate();
    OH_Drawing_Path *path = CreateMarkerPath(frame, 16.0F);
    if (translate != nullptr && rotate != nullptr && total != nullptr && path != nullptr) {
        // Concat 依次叠加两个矩阵，等价于把两个变换合并成一个再使用。
        OH_Drawing_MatrixConcat(total, translate, rotate);
        cap::StrokePathArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_PURPLE), 0.3F), 1.0F, path);
        DrawWithMatrix(canvas, total, path, cap::PaletteColor(palette), 2.0F);
        // 对照结果：分别应用两个矩阵，用于验证合成顺序。
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasConcatMatrix(canvas, translate);
        OH_Drawing_CanvasConcatMatrix(canvas, rotate);
        cap::StrokePathArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_GREEN), 0.8F), 1.0F, path);
        OH_Drawing_CanvasRestore(canvas);
    }
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    if (total != nullptr) {
        OH_Drawing_MatrixDestroy(total);
    }
    if (rotate != nullptr) {
        OH_Drawing_MatrixDestroy(rotate);
    }
    if (translate != nullptr) {
        OH_Drawing_MatrixDestroy(translate);
    }
}

// 6. 前置与后置：同一组平移、缩放按不同顺序作用，结果位置不同。
void ScenePrePost(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float order = params.Choice(1, 2, 0);
    const float dx = frame.X(params.Range(PARAM_PREPOST_DX, 12.0F, -20.0F, 20.0F));
    const float scale = params.Range(PARAM_PREPOST_SCALE, 1.4F, 0.5F, 2.0F);
    OH_Drawing_Matrix *merged = OH_Drawing_MatrixCreate();
    OH_Drawing_Path *path = CreateMarkerPath(frame, 20.0F);
    if (merged != nullptr && path != nullptr) {
        if (order < 0.5F) {
            // 先平移后缩放：平移量会被随后的缩放放大。
            OH_Drawing_MatrixPreTranslate(merged, dx, 0.0F);
            OH_Drawing_MatrixPostScale(merged, scale, scale, frame.centerX, frame.centerY);
        } else {
            // 先缩放后平移：平移量保持原始大小。
            OH_Drawing_MatrixPostScale(merged, scale, scale, frame.centerX, frame.centerY);
            OH_Drawing_MatrixPostTranslate(merged, dx, 0.0F);
        }
        cap::StrokePathArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_PURPLE), 0.3F), 1.0F, path);
        DrawWithMatrix(canvas, merged, path, cap::PaletteColor(palette), 2.0F);
    }
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    if (merged != nullptr) {
        OH_Drawing_MatrixDestroy(merged);
    }
}

// 7. 逆矩阵：正变换与逆变换依次作用于同一批点，点应回到原始位置。
void SceneInvert(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float degree = params.Range(1, 25.0F, -90.0F, 90.0F);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(degree, frame.centerX, frame.centerY);
    OH_Drawing_Matrix *inverse = OH_Drawing_MatrixCreate();
    if (matrix == nullptr || inverse == nullptr) {
        DRAWING_LOGE("SceneInvert create matrix failed");
        if (inverse != nullptr) {
            OH_Drawing_MatrixDestroy(inverse);
        }
        if (matrix != nullptr) {
            OH_Drawing_MatrixDestroy(matrix);
        }
        return;
    }
    OH_Drawing_Point2D source[SAMPLE_POINT_COUNT] = {{0.0F, 0.0F}};
    OH_Drawing_Point2D mapped[SAMPLE_POINT_COUNT] = {{0.0F, 0.0F}};
    OH_Drawing_Point2D restored[SAMPLE_POINT_COUNT] = {{0.0F, 0.0F}};
    BuildSamplePoints(frame, source, SAMPLE_POINT_COUNT);
    OH_Drawing_MatrixMapPoints(matrix, source, mapped, SAMPLE_POINT_COUNT);
    const bool inverted = OH_Drawing_MatrixInvert(matrix, inverse);
    if (inverted) {
        OH_Drawing_MatrixMapPoints(inverse, mapped, restored, SAMPLE_POINT_COUNT);
    }
    // 原始点与还原点用不同颜色叠加，重合说明逆矩阵正确。
    DrawPoints(canvas, source, SAMPLE_POINT_COUNT, palette, 6.0F);
    DrawPoints(canvas, mapped, SAMPLE_POINT_COUNT, palette + cap::SLOT_GREEN, 4.0F);
    if (inverted) {
        DrawPoints(canvas, restored, SAMPLE_POINT_COUNT, palette + cap::SLOT_CYAN, 2.0F);
    } else {
        DRAWING_LOGW("SceneInvert invert failed, matrix is singular");
    }
    OH_Drawing_MatrixDestroy(inverse);
    OH_Drawing_MatrixDestroy(matrix);
}

// 8. 批量映射：MapPoints 一次把多个点通过矩阵变换，用连线展示位移。
void SceneMapPoints(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float degree = params.Range(1, 20.0F, -180.0F, 180.0F);
    const float scale = params.Range(PARAM_MAP_SCALE, 1.2F, 0.5F, 2.0F);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(degree, frame.centerX, frame.centerY);
    if (matrix == nullptr) {
        DRAWING_LOGE("SceneMapPoints create matrix failed");
        return;
    }
    OH_Drawing_MatrixPostScale(matrix, scale, scale, frame.centerX, frame.centerY);
    OH_Drawing_Point2D source[SAMPLE_POINT_COUNT] = {{0.0F, 0.0F}};
    OH_Drawing_Point2D mapped[SAMPLE_POINT_COUNT] = {{0.0F, 0.0F}};
    BuildSamplePoints(frame, source, SAMPLE_POINT_COUNT);
    OH_Drawing_MatrixMapPoints(matrix, source, mapped, SAMPLE_POINT_COUNT);
    // 原始点到映射点的连线，长度体现变换带来的位移。
    for (int32_t index = 0; index < SAMPLE_POINT_COUNT; ++index) {
        cap::StrokeLineArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_PURPLE), 0.5F), 1.0F,
            source[index].x, source[index].y, mapped[index].x, mapped[index].y);
    }
    DrawPoints(canvas, source, SAMPLE_POINT_COUNT, palette, 4.0F);
    DrawPoints(canvas, mapped, SAMPLE_POINT_COUNT, palette + cap::SLOT_GREEN, 5.0F);
    OH_Drawing_MatrixDestroy(matrix);
}

// 9. 四点映射：SetPolyToPoly 把矩形四角映射到任意四边形，实现透视类形变。
void ScenePolyToPoly(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const float pull = frame.X(params.Range(1, 8.0F, 0.0F, 25.0F));
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    if (matrix == nullptr) {
        DRAWING_LOGE("ScenePolyToPoly create matrix failed");
        return;
    }
    OH_Drawing_Point2D source[SAMPLE_POINT_COUNT] = {{0.0F, 0.0F}};
    OH_Drawing_Point2D target[SAMPLE_POINT_COUNT] = {{0.0F, 0.0F}};
    BuildSamplePoints(frame, source, SAMPLE_POINT_COUNT);
    // 目标四边形：右上角右移、左下角下移，形成不规则四边形。
    for (int32_t index = 0; index < SAMPLE_POINT_COUNT; ++index) {
        target[index].x = source[index].x;
        target[index].y = source[index].y;
    }
    target[QUAD_RIGHT_TOP].x += pull;
    target[QUAD_LEFT_BOTTOM].y += pull;
    OH_Drawing_Path *sourcePath = cap::CreateRectPath(source[QUAD_LEFT_TOP].x, source[QUAD_LEFT_TOP].y,
        source[QUAD_RIGHT_BOTTOM].x, source[QUAD_RIGHT_BOTTOM].y);
    OH_Drawing_Path *targetPath = OH_Drawing_PathCreate();
    if (sourcePath != nullptr && targetPath != nullptr) {
        OH_Drawing_PathAddPolygon(targetPath, target, SAMPLE_POINT_COUNT, true);
        // 源矩形用描边标出，目标四边形用填充显示，二者共用同一组角点。
        cap::StrokePathArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_PURPLE), 0.6F), 1.0F,
            sourcePath);
        cap::FillPathArea(canvas, cap::WithAlpha(cap::PaletteColor(palette), 0.35F), targetPath);
        cap::StrokePathArea(canvas, cap::PaletteColor(palette + cap::SLOT_GREEN), 2.0F, targetPath);
    }
    const bool mapped = OH_Drawing_MatrixSetPolyToPoly(matrix, source, target, SAMPLE_POINT_COUNT);
    if (!mapped) {
        DRAWING_LOGW("ScenePolyToPoly setPolyToPoly failed");
    }
    DrawPoints(canvas, target, SAMPLE_POINT_COUNT, palette + 1, 4.0F);
    if (targetPath != nullptr) {
        OH_Drawing_PathDestroy(targetPath);
    }
    if (sourcePath != nullptr) {
        OH_Drawing_PathDestroy(sourcePath);
    }
    OH_Drawing_MatrixDestroy(matrix);
}
} // namespace

void DrawMatrixScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawMatrixScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < MATRIX_IDENTITY || scene >= MATRIX_SCENE_COUNT) {
        DRAWING_LOGE("DrawMatrixScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case MATRIX_IDENTITY:
            SceneIdentity(canvas, frame, params);
            break;
        case MATRIX_TRANSLATE:
            SceneTranslate(canvas, frame, params);
            break;
        case MATRIX_SCALE:
            SceneScale(canvas, frame, params);
            break;
        case MATRIX_ROTATE:
            SceneRotate(canvas, frame, params);
            break;
        case MATRIX_SKEW:
            SceneSkew(canvas, frame, params);
            break;
        case MATRIX_CONCAT:
            SceneConcat(canvas, frame, params);
            break;
        case MATRIX_PRE_POST:
            ScenePrePost(canvas, frame, params);
            break;
        case MATRIX_INVERT:
            SceneInvert(canvas, frame, params);
            break;
        case MATRIX_MAP_POINTS:
            SceneMapPoints(canvas, frame, params);
            break;
        case MATRIX_POLY_TO_POLY:
            ScenePolyToPoly(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawMatrixScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
