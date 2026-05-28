'use static'
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

// [Start DynInteropStaWrappedBuilderStaWrappedBuilderByValue]
// static_module/src/main/ets/components/StaWrappedBuilderByValue.ets
import { Builder, WrappedBuilder, wrapBuilder, Text } from '@ohos.arkui.component';

@Builder
function showTextBuilder(input: string): void { // 按值传递参数，状态变量变化不会触发UI刷新
  Text(input)
    .fontSize(20)
}

// 使用wrapBuilder封装全局@Builder并导出
export const globalBuilderByValue: WrappedBuilder<@Builder (input: string) => void> = wrapBuilder(showTextBuilder);
// [End DynInteropStaWrappedBuilderStaWrappedBuilderByValue]
