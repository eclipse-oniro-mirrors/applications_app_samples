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

// 文案基线：按资源名从 entry（被测 main 模块）资源表取值，跟随设备语言。
// 若把 base 目录的英文写死，在中文设备上 main 取到 zh_CN 值就会误判。
import { common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { getTestContext } from './TestContext';

const ENTRY_MODULE: string = 'entry';

let entryResourceManager: resourceManager.ResourceManager | null = null;

function resolveEntryResourceManager(): resourceManager.ResourceManager {
    if (entryResourceManager !== null) {
        return entryResourceManager;
    }
    const base: common.Context = getTestContext();
    try {
        const moduleContext: common.Context = base.createModuleContext(ENTRY_MODULE);
        entryResourceManager = moduleContext.resourceManager;
    } catch (err) {
        entryResourceManager = base.resourceManager;
    }
    return entryResourceManager as resourceManager.ResourceManager;
}

/**
 * 按资源名读取 entry 模块的字符串（与 main 侧 getStringSync 同语言）。
 */
export function entryString(name: string): string {
    return resolveEntryResourceManager().getStringByNameSync(name);
}
