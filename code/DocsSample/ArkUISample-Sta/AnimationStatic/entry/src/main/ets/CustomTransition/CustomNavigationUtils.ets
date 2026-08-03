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

// [Start custom_navigation_utils]
// CustomNavigationUtils.ets
// 配置Navigation自定义转场动画
import { NavigationTransitionProxy } from '@ohos.arkui.component';

export interface AnimateCallback {
  animation: ((isPush: boolean, isExit: boolean, transitionProxy: NavigationTransitionProxy) => void | undefined)
    | undefined;
  timeout: (int | undefined) | undefined;
}

const customTransitionMap: Map<int, AnimateCallback> = new Map<int, AnimateCallback>();

export class CustomTransition {
  private constructor() {
  }

  static delegate: CustomTransition = new CustomTransition();

  static getInstance(): CustomTransition {
    return CustomTransition.delegate;
  }

  // 注册页面的动画回调，name是注册页面的动画的回调
  // animationCallback是需要执行的动画内容，timeout是转场结束的超时时间
  registerNavParam(
    name: int,
    animationCallback: (operation: boolean, isExit: boolean, transitionProxy: NavigationTransitionProxy) => void,
    timeout: int): void {
    if (customTransitionMap.has(name)) {
      let param: AnimateCallback | undefined = customTransitionMap.get(name);
      if (param != undefined) {
        param.animation = animationCallback;
        param.timeout = timeout;
        return;
      }
    }
    let params: AnimateCallback = { timeout: timeout, animation: animationCallback };
    customTransitionMap.set(name, params);
  }

  unRegisterNavParam(name: int): void {
    customTransitionMap.delete(name);
  }

  getAnimateParam(name: int): AnimateCallback {
    let result: AnimateCallback = {
      animation: customTransitionMap.get(name)?.animation,
      timeout: customTransitionMap.get(name)?.timeout,
    };
    return result;
  }
}

// [End custom_navigation_utils]
