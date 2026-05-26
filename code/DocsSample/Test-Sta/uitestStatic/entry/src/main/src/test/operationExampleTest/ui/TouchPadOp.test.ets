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

// [Start touchPadOp_sta_sample]
import { describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';
// 导入测试依赖kit
import { Driver, UiDirection } from '@kit.TestKit';
import { BusinessError } from '@ohos.base';

// 设备不支持时的错误代码
const DeviceErrorCode: int = 17000005;

export default function abilityTest(): void {
  describe('touchPadOp_sample', (): void => {
    // PC/2in1场景，模拟触摸板三指上滑（界面返回桌面），三指下滑（界面恢复窗口）操作
    it('touchPadOperation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      try {
        // 触摸板三指上滑返回桌面
        await driver.touchPadMultiFingerSwipe(3, UiDirection.UP);
        // 触摸板三指下滑恢复窗口
        await driver.touchPadMultiFingerSwipe(3, UiDirection.DOWN);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        // 在不支持触摸板操作的设备上调用时，将抛出17000005错误码
        expect(err.code).assertEqual(DeviceErrorCode);
      }
    })
  })
}

// [End touchPadOp_sta_sample]
