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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { display } from '@kit.ArkUI';
import { deviceInfo } from '@kit.BasicServicesKit';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function displayMatrixTest() {
  describe('DisplayMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0001
     * @tc.name      testDisplay0001
     * @tc.desc      Display field id is present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0001', 'display facts');
      expect(d.id >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0002
     * @tc.name      testDisplay0002
     * @tc.desc      Display field id stays sane
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0002', 'display facts');
      expect(d.id <= 16).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0003
     * @tc.name      testDisplay0003
     * @tc.desc      Display field id is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0003', 'display facts');
      expect(d.id).assertEqual(d2.id);
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0004
     * @tc.name      testDisplay0004
     * @tc.desc      Display field name is present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0004', 'display facts');
      expect(d.name.length > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0005
     * @tc.name      testDisplay0005
     * @tc.desc      Display field name stays sane
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0005', 'display facts');
      expect(d.name.length <= 64).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0006
     * @tc.name      testDisplay0006
     * @tc.desc      Display field name is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0006', 'display facts');
      expect(d.name).assertEqual(d2.name);
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0007
     * @tc.name      testDisplay0007
     * @tc.desc      Display field alive is present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0007', 'display facts');
      expect(d.alive === true || d.alive === false).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0008
     * @tc.name      testDisplay0008
     * @tc.desc      Display field alive stays sane
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0008', 'display facts');
      expect(d.alive !== undefined).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0009
     * @tc.name      testDisplay0009
     * @tc.desc      Display field alive is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0009', 'display facts');
      expect(d.alive).assertEqual(d2.alive);
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0010
     * @tc.name      testDisplay0010
     * @tc.desc      Display field state is present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0010', 'display facts');
      const state: number = Number(d.state);
      expect(state >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0011
     * @tc.name      testDisplay0011
     * @tc.desc      Display field state stays sane
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0011', 'display facts');
      const state: number = Number(d.state);
      expect(state <= 10).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0012
     * @tc.name      testDisplay0012
     * @tc.desc      Display field state is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testDisplay0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0012', 'display facts');
      expect(Number(d.state)).assertEqual(Number(d2.state));
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0013
     * @tc.name      testDisplay0013
     * @tc.desc      Display field refreshRate is present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0013', 'display facts');
      expect(d.refreshRate > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0014
     * @tc.name      testDisplay0014
     * @tc.desc      Display field refreshRate stays sane
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0014', 'display facts');
      expect(d.refreshRate <= 240).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0015
     * @tc.name      testDisplay0015
     * @tc.desc      Display field refreshRate is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0015', 'display facts');
      expect(d.refreshRate).assertEqual(d2.refreshRate);
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0016
     * @tc.name      testDisplay0016
     * @tc.desc      Display field rotation is present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0016', 'display facts');
      const rotation: number = Number(d.rotation);
      expect(rotation >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0017
     * @tc.name      testDisplay0017
     * @tc.desc      Display field rotation stays sane
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0017', 'display facts');
      const rotation: number = Number(d.rotation);
      expect(rotation <= 3).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0018
     * @tc.name      testDisplay0018
     * @tc.desc      Display field rotation is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0018', 'display facts');
      expect(Number(d.rotation)).assertEqual(Number(d2.rotation));
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0019
     * @tc.name      testDisplay0019
     * @tc.desc      Display field width is present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0019', 'display facts');
      expect(d.width > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0020
     * @tc.name      testDisplay0020
     * @tc.desc      Display field width stays sane
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0020', 'display facts');
      expect(d.width >= 200).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0021
     * @tc.name      testDisplay0021
     * @tc.desc      Display field width is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0021', 'display facts');
      expect(d.width).assertEqual(d2.width);
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0022
     * @tc.name      testDisplay0022
     * @tc.desc      Display field height is present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0022', 'display facts');
      expect(d.height > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0023
     * @tc.name      testDisplay0023
     * @tc.desc      Display field height stays sane
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0023', 'display facts');
      expect(d.height >= 200).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0024
     * @tc.name      testDisplay0024
     * @tc.desc      Display field height is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0024', 'display facts');
      expect(d.height).assertEqual(d2.height);
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0025
     * @tc.name      testDisplay0025
     * @tc.desc      Display field availableWidth is present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0025', 'display facts');
      expect(d.width > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0026
     * @tc.name      testDisplay0026
     * @tc.desc      Display field availableWidth stays sane
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0026', 'display facts');
      expect(d.availableWidth <= d.width).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0027
     * @tc.name      testDisplay0027
     * @tc.desc      Display field availableWidth is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0027', 'display facts');
      expect(d.availableWidth).assertEqual(d2.availableWidth);
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0028
     * @tc.name      testDisplay0028
     * @tc.desc      Display field availableHeight is present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0028', 'display facts');
      expect(d.height > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0029
     * @tc.name      testDisplay0029
     * @tc.desc      Display field availableHeight stays sane
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0029', 'display facts');
      expect(d.availableHeight <= d.height).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_DISP_0030
     * @tc.name      testDisplay0030
     * @tc.desc      Display field availableHeight is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDisplay0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const d: display.Display = display.getDefaultDisplaySync();
      const d2: display.Display = display.getDefaultDisplaySync();
      logCase('testDisplay0030', 'display facts');
      expect(d.availableHeight).assertEqual(d2.availableHeight);
    });
;
  });
}
