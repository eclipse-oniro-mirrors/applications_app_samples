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

import { Entry, Component, Builder, ComponentContent, UIContext, wrapBuilder, State, HitTestMode } from '@kit.ArkUI'
import { OverlayManager } from '@ohos.arkui.UIContext'

interface Position {
  x: int;
  y: int;
}

class Params {
  private context: UIContext;
  private position: Position;

  constructor(context: UIContext, position: Position) {
    this.context = context;
    this.position = position;
  }
}

let uiContext: UIContext;

// [Start overlay_manager]
@Builder
function builderOverlay() {
  Component1().hitTestBehavior(HitTestMode.Transparent)
}

// [StartExclude overlay_manager]
@Entry
@Component
struct OverlayManagerPage {
  private overlayManager?: OverlayManager;
  @State context: UIContext = this.getUIContext();

  // [EndExclude overlay_manager]
  aboutToAppear(): void {
    // [StartExclude overlay_manager]
    this.overlayManager = this.context.getOverlayManager();
    // [EndExclude overlay_manager]
    let componentContent: ComponentContent = new ComponentContent(
      this.context,
      wrapBuilder(builderOverlay)
    );
    this.overlayManager!.addComponentContent(componentContent, 0);
  }
  // [End overlay_manager]

  build() {
  }
}

@Component
struct Component1 {
  build() {
  }
}
