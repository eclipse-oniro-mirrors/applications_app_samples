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

// [Start displayOp_sta_sample]
import { expect, describe, it, Level, Size, TestType } from '../../../../../hypium/index';
// 导入测试依赖kit
import { DisplayRotation, Driver, Point } from '@kit.TestKit';
const waitUiReadyMs: int = 1000;

export default function abilityTest(): void {
  describe('displayOp_sample', (): void => {
    // 屏幕属性获取和屏幕操作
    it('displayOperation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      // 获取屏幕大小
      let size: Point = await driver.getDisplaySize();
      // 获取屏幕清晰度
      let density: Point = await driver.getDisplayDensity();
      // 唤醒屏幕
      await driver.wakeUpDisplay();
      // 屏幕顺时针旋转垂直
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(waitUiReadyMs);
      let rotation = await driver!.getDisplayRotation();
      if (rotation == DisplayRotation.ROTATION_90) {
        console.info('The device is displayed in horizontal on default');
        await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
        await driver.delayMs(waitUiReadyMs);
        let rotation1 = await driver!.getDisplayRotation();
        expect(rotation1 == DisplayRotation.ROTATION_0).assertTrue();

        await driver.setDisplayRotation(DisplayRotation.ROTATION_180);
        await driver.delayMs(waitUiReadyMs);
        let rotation2 = await driver!.getDisplayRotation();
        expect(rotation2 == DisplayRotation.ROTATION_270).assertTrue();

        await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
        await driver.delayMs(waitUiReadyMs);
        let rotation3 = await driver!.getDisplayRotation();
        expect(rotation3 == DisplayRotation.ROTATION_180).assertTrue();

        await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      } else if (rotation == DisplayRotation.ROTATION_0) {
        console.info('The device is displayed in vertical on default');
        await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
        await driver.delayMs(waitUiReadyMs)
        let rotation1 = await driver!.getDisplayRotation();
        expect(rotation1 == DisplayRotation.ROTATION_90).assertTrue();

        await driver.setDisplayRotation(DisplayRotation.ROTATION_180);
        await driver.delayMs(waitUiReadyMs);
        let rotation2 = await driver!.getDisplayRotation();
        expect(rotation2 == DisplayRotation.ROTATION_180).assertTrue();

        await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
        await driver.delayMs(waitUiReadyMs);
        let rotation3 = await driver!.getDisplayRotation();
        expect(rotation3 == DisplayRotation.ROTATION_270).assertTrue();

        await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
        await driver.delayMs(waitUiReadyMs);
      }
    })
  })
}

// [End displayOp_sta_sample]
