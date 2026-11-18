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

import { common } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import { Logger } from '../common/Logger';
import { loadPixelMap, releasePixelMap } from '../common/PixelMapUtil';
import { CapabilityController } from '../core/SceneRenderNode';
import { PIXELMAP_GROUP } from '../schema/CapabilityPixelMap';
import { GroupHost } from '../widgets/GroupHost';

// PixelMap 能力域页面：布局、场景切换与参数面板全部由 GroupHost 提供，图片解码后注入渲染节点。
@Entry
@Component
struct CapabilityPixelMapDemo {
  private host: CapabilityController | undefined = undefined;
  private pixelMap: image.PixelMap | undefined = undefined;

  aboutToAppear(): void {
    // getHostContext 替代已废弃的全局 getContext。
    const context: common.Context | undefined = this.getUIContext().getHostContext();
    if (context === undefined) {
      Logger.warn('host context is unavailable');
      return;
    }
    loadPixelMap(context.resourceManager, 'test.jpg').then((pMap: image.PixelMap | undefined) => {
      if (pMap === undefined) {
        return;
      }
      this.pixelMap = pMap;
      if (this.host !== undefined) {
        this.host.applyPixelMap(pMap);
      }
    });
  }

  aboutToDisappear(): void {
    if (this.host !== undefined) {
      this.host.applyPixelMap(undefined);
    }
    this.host = undefined;
    releasePixelMap(this.pixelMap).then(() => {
      this.pixelMap = undefined;
    });
  }

  build() {
    Column() {
      GroupHost({
        group: PIXELMAP_GROUP,
        onControllerReady: (controller: CapabilityController) => {
          this.host = controller;
          if (this.pixelMap !== undefined) {
            controller.applyPixelMap(this.pixelMap);
          }
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}
