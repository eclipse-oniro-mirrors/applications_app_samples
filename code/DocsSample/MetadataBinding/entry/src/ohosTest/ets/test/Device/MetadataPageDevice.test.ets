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

import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  TestType,
  Size,
  Level
} from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  launchMetadataBindingApp,
  waitForMetadataPage,
  readMetadataTitle,
  checkTextContent,
  resetDriver
} from '../Shared/SharedDriver';

export default function metadataPageDeviceTest(): void {
  describe('metadataPageDeviceTest', (): void => {
    let driver: Driver = getDriver();
    beforeAll(async (): Promise<void> => {
      await launchMetadataBindingApp();
      await waitForMetadataPage(driver);
    });
    beforeEach(async (): Promise<void> => {
      const yieldDelayMs: number = 30;
      await new Promise<void>((resolve): void => {
        setTimeout((): void => {
          resolve();
        }, yieldDelayMs);
      });
    });
    afterEach((): void => {});
    afterAll(async (): Promise<void> => { await resetDriver(); });
    /**
     * @tc.number SUB_METADATA_BINDING_DEVICE_0100
     * @tc.name metadataPageText001
     * @tc.desc Verify Index displays screenshot instruction 1 on the real device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataPageText001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const expectedText: string = '系统截图进行编码操作';
      const actualText: string = await readMetadataTitle(driver);
      expect(actualText).assertEqual(expectedText);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_DEVICE_0200
     * @tc.name metadataPageText002
     * @tc.desc Verify Index displays screenshot instruction 2 on the real device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataPageText002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const expectedText: string = '方式一、同时按住电源键和音量下键';
      const visible: boolean = await checkTextContent(driver, expectedText);
      expect(visible).assertTrue();
    });

    /**
     * @tc.number SUB_METADATA_BINDING_DEVICE_0300
     * @tc.name metadataPageText003
     * @tc.desc Verify Index displays screenshot instruction 3 on the real device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('metadataPageText003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const expectedText: string = '方式二、指关节双击截屏';
      const visible: boolean = await checkTextContent(driver, expectedText);
      expect(visible).assertTrue();
    });

  });
}
