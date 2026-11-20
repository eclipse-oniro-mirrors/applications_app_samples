/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import mediaQuery from '@ohos.mediaquery'

declare interface Breakpoint {
  name: string
  size: number
  mediaQueryListener?: mediaQuery.MediaQueryListener
}

export default class BreakpointSystem {
  private currentBreakpoint: string = 'md'
  private breakpoints: Breakpoint[] = [
    { name: 'sm', size: 320 } as Breakpoint,
    { name: 'md', size: 600 } as Breakpoint,
    { name: 'lg', size: 840 } as Breakpoint
  ]

  private updateCurrentBreakpoint(breakpoint: string) {
    if (this.currentBreakpoint !== breakpoint) {
      this.currentBreakpoint = breakpoint
      AppStorage.Set<string>('currentBreakpoint', this.currentBreakpoint)
    }
  }

  public register() {
    this.breakpoints.forEach((breakpoint: Breakpoint, index) => {
      let condition: string
      if (index === this.breakpoints.length - 1) {
        condition = "(" + breakpoint.size + "vp<=width" + ")"
      } else {
        condition = "(" + breakpoint.size + "vp<=width<" + this.breakpoints[index + 1].size + "vp)"
      }
      breakpoint.mediaQueryListener = mediaQuery.matchMediaSync(condition)
      const listener: mediaQuery.MediaQueryListener = breakpoint.mediaQueryListener
      listener.on('change', (mediaQueryResult) => {
        if (mediaQueryResult.matches) {
          this.updateCurrentBreakpoint(breakpoint.name)
        }
      })
    })
  }

  public unregister() {
    this.breakpoints.forEach((breakpoint: Breakpoint) => {
      const listener: mediaQuery.MediaQueryListener | undefined = breakpoint.mediaQueryListener
      if (listener) {
        listener.off('change')
      }
    })
  }
}
