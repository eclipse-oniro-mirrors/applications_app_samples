'use static';
/**
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

// [Start screenCap_sta_sample]
import { describe, it, Level, Size, TestType } from "../../../../../hypium/index";
// 导入测试依赖kit
import { Driver } from '@kit.TestKit';
import { display } from '@kit.ArkUI';

export default function abilityTest(): void {
  describe('screenCap_sample', (): void => {
    /**
     * 截取指定区域的屏幕，并保存到指定路径
     */
    it('screenCapture', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      // 应用沙箱路径，el2为用户级加密区，base为应用在本设备上存放持久化数据的子目录
      // 请开发者使用时替换为实际的路径
      let savePath: string = '/data/storage/el2/base/cache/1.png';
      let res: boolean = await driver.screenCapture(savePath, {
        left: 0 as int,
        top: 0 as int,
        right: 100 as int,
        bottom: 100 as int
      });
    })

    /**
     * 截取指定屏幕id的屏幕全屏，并保存到指定路径
     */
    it('screenCapWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      // 获取默认屏幕对象
      let disPlay = display.getDefaultDisplaySync();
      let savePath: string = '/data/storage/el2/base/cache/1.png';
      // 从API version 20开始支持
      let displayId: int = disPlay.id.toInt();
      let res: boolean = await driver.screenCap(savePath, displayId); // 获取默认屏幕ID属性
    })
  })
}

// [End screenCap_sta_sample]
