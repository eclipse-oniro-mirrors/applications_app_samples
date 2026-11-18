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
#ifndef NDR_PARAM_BAG_H
#define NDR_PARAM_BAG_H

#include <cstdint>

#include "capability_type.h"

namespace ndr {
// 参数包：ArkTS 侧以定长 number[] 传入，这里按下标读取并按场景声明的区间裁剪。
// 下标即协议，顺序必须与 ets/schema/*.ets 中 ParamSpec 的声明顺序严格一致。
class ParamBag {
public:
    ParamBag() = default;

    ParamBag(const double *values, uint32_t count)
    {
        Reset(values, count);
    }

    // 复制参数，超长部分丢弃，不足部分留 0，由取值方法的 fallback 兜底。
    void Reset(const double *values, uint32_t count)
    {
        count_ = count > MAX_SCENE_PARAMS ? MAX_SCENE_PARAMS : count;
        for (uint32_t index = 0; index < count_; index++) {
            values_[index] = values == nullptr ? 0.0 : values[index];
        }
    }

    uint32_t Count() const
    {
        return count_;
    }

    // 原始值，越界返回 fallback。
    double Raw(uint32_t index, double fallback) const
    {
        return index < count_ ? values_[index] : fallback;
    }

    // 连续取值：裁剪到 [min, max]。
    float Range(uint32_t index, float fallback, float min, float max) const
    {
        const double value = Raw(index, static_cast<double>(fallback));
        if (!(value == value)) { // 过滤 NaN，避免把非法数值传给 native drawing。
            return fallback;
        }
        const float result = static_cast<float>(value);
        if (result < min) {
            return min;
        }
        if (result > max) {
            return max;
        }
        return result;
    }

    // 百分比取值：0..100 映射到 0..1。
    float Percent(uint32_t index, float fallback) const
    {
        return Range(index, fallback * 100.0F, 0.0F, 100.0F) * 0.01F;
    }

    // 整数取值：四舍五入后裁剪。
    int32_t Int(uint32_t index, int32_t fallback, int32_t min, int32_t max) const
    {
        const float value = Range(index, static_cast<float>(fallback), static_cast<float>(min),
            static_cast<float>(max));
        const int32_t result = static_cast<int32_t>(value + (value >= 0.0F ? 0.5F : -0.5F));
        if (result < min) {
            return min;
        }
        return result > max ? max : result;
    }

    // 开关取值：大于 0.5 视为开启。
    bool Flag(uint32_t index, bool fallback) const
    {
        return Raw(index, fallback ? 1.0 : 0.0) > 0.5;
    }

    // 下拉取值：上限由选项个数决定，越界回退到 fallback。
    int32_t Choice(uint32_t index, int32_t optionCount, int32_t fallback) const
    {
        if (optionCount <= 0) {
            return 0;
        }
        return Int(index, fallback, 0, optionCount - 1);
    }

private:
    double values_[MAX_SCENE_PARAMS] = {0.0};
    uint32_t count_ = 0;
};
} // namespace ndr

#endif // NDR_PARAM_BAG_H
