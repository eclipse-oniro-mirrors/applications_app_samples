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

import common from '@ohos.app.ability.common';

/**
 * 保存测试 Ability 的 UIAbilityContext。
 *
 * 用例进程里由 delegator 取到的 ApplicationContext 交给 preferences 会被判为
 * invalid（code 401），因此改用 TestAbility 启动时持有的 UIAbilityContext。
 */
export class TestContextHolder {
    private static abilityContext: common.Context | undefined = undefined;

    static setContext(context: common.Context): void {
        TestContextHolder.abilityContext = context;
    }

    static getContext(fallback: common.Context): common.Context {
        const saved: common.Context | undefined = TestContextHolder.abilityContext;
        if (saved === undefined) {
            return fallback;
        }
        return saved;
    }
}
