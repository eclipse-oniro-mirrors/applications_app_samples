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

import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';

/**
 * 取测试进程可用的应用上下文，不依赖被测 Ability 的启动时序。
 */
export function getTestContext(): common.Context {
    return AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
}

/**
 * 等待一段限定时长，仅用于放过 import 期的异步回调，不做固定长睡眠。
 */
export function settleAsync(milliseconds: number): Promise<void> {
    return new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
            resolve();
        }, milliseconds);
    });
}

