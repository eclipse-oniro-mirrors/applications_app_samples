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

import { StartOptions, Want, wantConstant } from '@kit.AbilityKit';
import {
  NEW_ABILITY_NAME,
  START_OPTIONS_DISPLAY_ID,
  START_OPTIONS_WINDOW_HEIGHT,
  START_OPTIONS_WINDOW_LEFT,
  START_OPTIONS_WINDOW_TOP,
  START_OPTIONS_WINDOW_WIDTH,
  TEXT_PLAIN_TYPE,
  VIEW_DATA_ACTION,
  ZERO_MATCH_URI
} from '../common/AppConstants';

/**
 * 隐式启动意图。两个开关的差别只有一个 flag：
 * 带 FLAG_START_WITHOUT_TIPS 时，匹配个数为 0 不弹系统提示框。
 */
export function buildImplicitViewWant(withoutTips: boolean): Want {
  const want: Want = {
    action: VIEW_DATA_ACTION,
    type: TEXT_PLAIN_TYPE,
    parameters: {
      uri: ZERO_MATCH_URI
    }
  };
  if (withoutTips) {
    want.flags = wantConstant.Flags.FLAG_START_WITHOUT_TIPS;
  }
  return want;
}

/**
 * 显式启动示例里的 NewAbility。
 */
export function buildNewAbilityWant(bundleName: string): Want {
  return {
    bundleName: bundleName,
    abilityName: NEW_ABILITY_NAME
  };
}

/**
 * StartOptions 支持指定窗口位置、大小以及是否携带动效。
 */
export function buildStartOptions(withAnimation: boolean): StartOptions {
  return {
    displayId: START_OPTIONS_DISPLAY_ID,
    withAnimation: withAnimation,
    windowLeft: START_OPTIONS_WINDOW_LEFT,
    windowTop: START_OPTIONS_WINDOW_TOP,
    windowWidth: START_OPTIONS_WINDOW_WIDTH,
    windowHeight: START_OPTIONS_WINDOW_HEIGHT
  };
}

export function hasStartWithoutTipsFlag(want: Want): boolean {
  const flags: number = want.flags === undefined ? 0 : want.flags;
  return (flags & wantConstant.Flags.FLAG_START_WITHOUT_TIPS) !== 0;
}

export function formatStartOptions(options: StartOptions): string {
  const position: string = `left=${options.windowLeft}, top=${options.windowTop}`;
  const size: string = `width=${options.windowWidth}, height=${options.windowHeight}`;
  return `displayId=${options.displayId}, withAnimation=${options.withAnimation}, ${position}, ${size}`;
}
