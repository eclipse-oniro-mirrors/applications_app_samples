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

import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppXComponent3D]';
const YIELD_INTERVAL: number = 20;

let hookCount: number = 0;

function sleepZero(): Promise<void> {
    return new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
            resolve();
        }, 0);
    });
}

/**
 * Hypium 把整套用例放在同一个 native task 里连续执行，数千条用例会触发
 * THREAD_BLOCK_3S/6S。每 20 次 beforeEach 插入一次真实异步系统调用
 * （取当前前台 Ability）并让出一个宏任务，把微任务链切断。
 * 该调用仅作调度让步，失败不影响用例结果，异常一律吞掉。
 */
export async function yieldToSystem(): Promise<void> {
    hookCount++;
    if (hookCount % YIELD_INTERVAL !== 0) {
        return;
    }
    try {
        const delegator: abilityDelegatorRegistry.AbilityDelegator =
            abilityDelegatorRegistry.getAbilityDelegator();
        await delegator.getCurrentTopAbility();
    } catch (error) {
        hilog.warn(DOMAIN, TAG, 'yieldToSystem skipped: %{public}s', String(error));
    }
    await sleepZero();
}

/**
 * 每个套件在自己的 describe 内调用一次，避免套件之间的计数互相影响。
 */
export function resetYieldCounter(): void {
    hookCount = 0;
}