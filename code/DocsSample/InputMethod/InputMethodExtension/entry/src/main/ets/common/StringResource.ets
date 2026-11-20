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

/**
 * 字符串资源读取层：model/utils 只产出资源名称，真正的文本统一从 string.json 读取。
 *
 * 为什么不直接用 $r()：$r 的入参必须是编译期字面量，而这一层要按状态返回不同资源
 * （例如 ApiStatus 有 6 种取值），只能用字符串名查表。bind 之后 text() 返回本地化文本；
 * 未 bind（纯逻辑单测早期）时原样返回资源名称，便于直接发现初始化遗漏，不会静默给出错误文本。
 */

import { resourceManager } from '@kit.LocalizationKit';

let manager: resourceManager.ResourceManager | undefined = undefined;

export function bindResourceManager(mgr: resourceManager.ResourceManager): void {
  manager = mgr;
}

export function hasResourceManager(): boolean {
  return manager !== undefined;
}

/** 按资源名称获取文本；带占位符的模板最多支持三个参数（%s 传字符串，%d 传数字） */
export function text(name: string, first?: string | number, second?: string | number,
                     third?: string | number): string {
  const current = manager;
  if (current === undefined) {
    return name;
  }
  try {
    if (first === undefined) {
      return current.getStringByNameSync(name);
    }
    if (second === undefined) {
      return current.getStringByNameSync(name, first);
    }
    if (third === undefined) {
      return current.getStringByNameSync(name, first, second);
    }
    return current.getStringByNameSync(name, first, second, third);
  } catch (err) {
    return name;
  }
}
