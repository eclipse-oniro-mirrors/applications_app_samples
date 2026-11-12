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
 * 文案解析层。
 *
 * 页面里的静态文案直接写 `$r('app.string.xxx')`；model 层要按状态、参数返回不同文案，
 * 而 `$r` 只接受编译期字面量，所以 model 统一返回「资源名」，再由这里在运行时解析成当前语言的字符串。
 *
 * 未绑定 ResourceManager 时（扩展被系统拉起的极早期、或纯逻辑单测）原样返回资源名，
 * 好处是初始化遗漏会直接暴露成界面上的 `link_stage_connected` 而不是静默的空串；
 * 资源名不存在时同样回落到资源名，不让缺一条文案把页面打崩。
 */

import { resourceManager } from '@kit.LocalizationKit';

let manager: resourceManager.ResourceManager | undefined = undefined;

/** 在 Ability 的 onCreate 与本进程 UI 入口各调一次；重复绑定是幂等的 */
export function bindResourceManager(res: resourceManager.ResourceManager): void {
  manager = res;
}

export function isResourceManagerBound(): boolean {
  return manager !== undefined;
}

export function text(name: string): string {
  const mgr: resourceManager.ResourceManager | undefined = manager;
  if (mgr === undefined) {
    return name;
  }
  try {
    return mgr.getStringByNameSync(name);
  } catch (err) {
    return name;
  }
}

export function text1(name: string, arg0: string | number): string {
  const mgr: resourceManager.ResourceManager | undefined = manager;
  if (mgr === undefined) {
    return name;
  }
  try {
    return mgr.getStringByNameSync(name, arg0);
  } catch (err) {
    return name;
  }
}

export function text2(name: string, arg0: string | number, arg1: string | number): string {
  const mgr: resourceManager.ResourceManager | undefined = manager;
  if (mgr === undefined) {
    return name;
  }
  try {
    return mgr.getStringByNameSync(name, arg0, arg1);
  } catch (err) {
    return name;
  }
}

export function text3(name: string, arg0: string | number, arg1: string | number, arg2: string | number): string {
  const mgr: resourceManager.ResourceManager | undefined = manager;
  if (mgr === undefined) {
    return name;
  }
  try {
    return mgr.getStringByNameSync(name, arg0, arg1, arg2);
  } catch (err) {
    return name;
  }
}

export function text4(name: string, arg0: string | number, arg1: string | number, arg2: string | number,
  arg3: string | number): string {
  const mgr: resourceManager.ResourceManager | undefined = manager;
  if (mgr === undefined) {
    return name;
  }
  try {
    return mgr.getStringByNameSync(name, arg0, arg1, arg2, arg3);
  } catch (err) {
    return name;
  }
}
