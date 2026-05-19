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

// [Start watchOp_sta_sample]
import { describe, expect, it, Level, Size, TestType } from "../../../../../hypium/index";
// 导入测试依赖kit
import { Driver } from '@kit.TestKit';
import { BusinessError } from '@ohos.base';
import { Utils, startAbility, stopApplication } from '../../Util.test';

// 设备不支持时的错误代码
const CapabilityCode: int = 801;

export default function abilityTest(): void {
  describe('watchOp_sample', (): void => {
    // 手表场景，模拟表冠顺/逆时针旋转，从API version 20开始支持
    it('crownRotate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      try {
        // 顺时针旋转50格，旋转速度为30格/秒
        await driver.crownRotate(50, 30);
        // 逆时针旋转20格，旋转速度为30格/秒
        await driver.crownRotate(-20, 30);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        // driver.crownRotate接口仅在智能表设备上生效，其他设备调用时将抛出801错误码
        expect(err.code).assertEqual(CapabilityCode);
      }
    })
  })
}

// [End watchOp_sta_sample]
