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
import { mediaquery, UIContext } from '@kit.ArkUI'

export default class BreakpointSystem {
  private uiContext: UIContext
  private currentBreakpoint: string = 'md'
  private smListener?: mediaquery.MediaQueryListener
  private mdListener?: mediaquery.MediaQueryListener
  private lgListener?: mediaquery.MediaQueryListener

  constructor(uiContext: UIContext) {
    this.uiContext = uiContext
  }

  private updateCurrentBreakpoint(breakpoint: string): void {
    if (this.currentBreakpoint !== breakpoint) {
      this.currentBreakpoint = breakpoint
      AppStorage.set<string>('currentBreakpoint', this.currentBreakpoint)
    }
  }

  private isBreakpointSM = (mediaQueryResult: mediaquery.MediaQueryResult): void => {
    if (mediaQueryResult.matches) {
      this.updateCurrentBreakpoint('sm')
      AppStorage.set<number>('fontSize', 14)
      AppStorage.set<number>('coverMargin', 10)
    }
  }

  private isBreakpointMD = (mediaQueryResult: mediaquery.MediaQueryResult): void => {
    if (mediaQueryResult.matches) {
      this.updateCurrentBreakpoint('md')
      AppStorage.set<number>('fontSize', 16)
      AppStorage.set<number>('coverMargin', 30)
    }
  }

  private isBreakpointLG = (mediaQueryResult: mediaquery.MediaQueryResult): void => {
    if (mediaQueryResult.matches) {
      this.updateCurrentBreakpoint('lg')
      AppStorage.set<number>('fontSize', 18)
      AppStorage.set<number>('coverMargin', 40)
    }
  }

  public register(): void {
    this.smListener = this.uiContext.getMediaQuery().matchMediaSync('(320vp<=width<600vp)')
    this.smListener?.on('change', this.isBreakpointSM)
    this.mdListener = this.uiContext.getMediaQuery().matchMediaSync('(600vp<=width<840vp)')
    this.mdListener?.on('change', this.isBreakpointMD)
    this.lgListener = this.uiContext.getMediaQuery().matchMediaSync('(840vp<=width)')
    this.lgListener?.on('change', this.isBreakpointLG)
  }

  public unregister(): void {
    this.smListener?.off('change', this.isBreakpointSM)
    this.mdListener?.off('change', this.isBreakpointMD)
    this.lgListener?.off('change', this.isBreakpointLG)
  }
}