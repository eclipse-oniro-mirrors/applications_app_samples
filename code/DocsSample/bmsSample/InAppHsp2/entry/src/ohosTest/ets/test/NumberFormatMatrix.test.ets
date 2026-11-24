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
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function numberMatrixTest() {
  describe('NumberMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0001
     * @tc.name      testNumber0001
     * @tc.desc      Parse integer 12 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('12', 10);
      logCase('testNumber0001', 'parse 12 -> ' + parsed);
      expect(parsed).assertEqual(12);
      expect(parsed + 1).assertEqual(13);
      expect(parsed.toString(10)).assertEqual('12');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0002
     * @tc.name      testNumber0002
     * @tc.desc      Parse integer 45 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('45', 10);
      logCase('testNumber0002', 'parse 45 -> ' + parsed);
      expect(parsed).assertEqual(45);
      expect(parsed + 1).assertEqual(46);
      expect(parsed.toString(10)).assertEqual('45');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0003
     * @tc.name      testNumber0003
     * @tc.desc      Parse integer 78 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('78', 10);
      logCase('testNumber0003', 'parse 78 -> ' + parsed);
      expect(parsed).assertEqual(78);
      expect(parsed + 1).assertEqual(79);
      expect(parsed.toString(10)).assertEqual('78');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0004
     * @tc.name      testNumber0004
     * @tc.desc      Parse integer 123 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('123', 10);
      logCase('testNumber0004', 'parse 123 -> ' + parsed);
      expect(parsed).assertEqual(123);
      expect(parsed + 1).assertEqual(124);
      expect(parsed.toString(10)).assertEqual('123');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0005
     * @tc.name      testNumber0005
     * @tc.desc      Parse integer 456 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('456', 10);
      logCase('testNumber0005', 'parse 456 -> ' + parsed);
      expect(parsed).assertEqual(456);
      expect(parsed + 1).assertEqual(457);
      expect(parsed.toString(10)).assertEqual('456');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0006
     * @tc.name      testNumber0006
     * @tc.desc      Parse integer 789 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('789', 10);
      logCase('testNumber0006', 'parse 789 -> ' + parsed);
      expect(parsed).assertEqual(789);
      expect(parsed + 1).assertEqual(790);
      expect(parsed.toString(10)).assertEqual('789');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0007
     * @tc.name      testNumber0007
     * @tc.desc      Parse integer 1024 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('1024', 10);
      logCase('testNumber0007', 'parse 1024 -> ' + parsed);
      expect(parsed).assertEqual(1024);
      expect(parsed + 1).assertEqual(1025);
      expect(parsed.toString(10)).assertEqual('1024');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0008
     * @tc.name      testNumber0008
     * @tc.desc      Parse integer 2048 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('2048', 10);
      logCase('testNumber0008', 'parse 2048 -> ' + parsed);
      expect(parsed).assertEqual(2048);
      expect(parsed + 1).assertEqual(2049);
      expect(parsed.toString(10)).assertEqual('2048');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0009
     * @tc.name      testNumber0009
     * @tc.desc      Parse integer 375 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('375', 10);
      logCase('testNumber0009', 'parse 375 -> ' + parsed);
      expect(parsed).assertEqual(375);
      expect(parsed + 1).assertEqual(376);
      expect(parsed.toString(10)).assertEqual('375');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0010
     * @tc.name      testNumber0010
     * @tc.desc      Parse integer 625 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('625', 10);
      logCase('testNumber0010', 'parse 625 -> ' + parsed);
      expect(parsed).assertEqual(625);
      expect(parsed + 1).assertEqual(626);
      expect(parsed.toString(10)).assertEqual('625');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0011
     * @tc.name      testNumber0011
     * @tc.desc      Parse integer 999 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('999', 10);
      logCase('testNumber0011', 'parse 999 -> ' + parsed);
      expect(parsed).assertEqual(999);
      expect(parsed + 1).assertEqual(1000);
      expect(parsed.toString(10)).assertEqual('999');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0012
     * @tc.name      testNumber0012
     * @tc.desc      Parse integer 1000 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('1000', 10);
      logCase('testNumber0012', 'parse 1000 -> ' + parsed);
      expect(parsed).assertEqual(1000);
      expect(parsed + 1).assertEqual(1001);
      expect(parsed.toString(10)).assertEqual('1000');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0013
     * @tc.name      testNumber0013
     * @tc.desc      Parse integer 250 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('250', 10);
      logCase('testNumber0013', 'parse 250 -> ' + parsed);
      expect(parsed).assertEqual(250);
      expect(parsed + 1).assertEqual(251);
      expect(parsed.toString(10)).assertEqual('250');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0014
     * @tc.name      testNumber0014
     * @tc.desc      Parse integer 750 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('750', 10);
      logCase('testNumber0014', 'parse 750 -> ' + parsed);
      expect(parsed).assertEqual(750);
      expect(parsed + 1).assertEqual(751);
      expect(parsed.toString(10)).assertEqual('750');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0015
     * @tc.name      testNumber0015
     * @tc.desc      Parse integer 125 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('125', 10);
      logCase('testNumber0015', 'parse 125 -> ' + parsed);
      expect(parsed).assertEqual(125);
      expect(parsed + 1).assertEqual(126);
      expect(parsed.toString(10)).assertEqual('125');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0016
     * @tc.name      testNumber0016
     * @tc.desc      Parse integer 175 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('175', 10);
      logCase('testNumber0016', 'parse 175 -> ' + parsed);
      expect(parsed).assertEqual(175);
      expect(parsed + 1).assertEqual(176);
      expect(parsed.toString(10)).assertEqual('175');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0017
     * @tc.name      testNumber0017
     * @tc.desc      Parse integer 225 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('225', 10);
      logCase('testNumber0017', 'parse 225 -> ' + parsed);
      expect(parsed).assertEqual(225);
      expect(parsed + 1).assertEqual(226);
      expect(parsed.toString(10)).assertEqual('225');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0018
     * @tc.name      testNumber0018
     * @tc.desc      Parse integer 275 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('275', 10);
      logCase('testNumber0018', 'parse 275 -> ' + parsed);
      expect(parsed).assertEqual(275);
      expect(parsed + 1).assertEqual(276);
      expect(parsed.toString(10)).assertEqual('275');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0019
     * @tc.name      testNumber0019
     * @tc.desc      Parse integer 325 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('325', 10);
      logCase('testNumber0019', 'parse 325 -> ' + parsed);
      expect(parsed).assertEqual(325);
      expect(parsed + 1).assertEqual(326);
      expect(parsed.toString(10)).assertEqual('325');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0020
     * @tc.name      testNumber0020
     * @tc.desc      Parse integer 425 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('425', 10);
      logCase('testNumber0020', 'parse 425 -> ' + parsed);
      expect(parsed).assertEqual(425);
      expect(parsed + 1).assertEqual(426);
      expect(parsed.toString(10)).assertEqual('425');
      expect(parsed % 2).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0021
     * @tc.name      testNumber0021
     * @tc.desc      Parse integer 512 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('512', 10);
      logCase('testNumber0021', 'parse 512 -> ' + parsed);
      expect(parsed).assertEqual(512);
      expect(parsed + 1).assertEqual(513);
      expect(parsed.toString(10)).assertEqual('512');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0022
     * @tc.name      testNumber0022
     * @tc.desc      Parse integer 640 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNumber0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parsed: number = parseInt('640', 10);
      logCase('testNumber0022', 'parse 640 -> ' + parsed);
      expect(parsed).assertEqual(640);
      expect(parsed + 1).assertEqual(641);
      expect(parsed.toString(10)).assertEqual('640');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0023
     * @tc.name      testNumber0023
     * @tc.desc      Parse integer 768 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumber0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parsed: number = parseInt('768', 10);
      logCase('testNumber0023', 'parse 768 -> ' + parsed);
      expect(parsed).assertEqual(768);
      expect(parsed + 1).assertEqual(769);
      expect(parsed.toString(10)).assertEqual('768');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0024
     * @tc.name      testNumber0024
     * @tc.desc      Parse integer 896 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumber0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parsed: number = parseInt('896', 10);
      logCase('testNumber0024', 'parse 896 -> ' + parsed);
      expect(parsed).assertEqual(896);
      expect(parsed + 1).assertEqual(897);
      expect(parsed.toString(10)).assertEqual('896');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0025
     * @tc.name      testNumber0025
     * @tc.desc      Parse integer 1536 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumber0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parsed: number = parseInt('1536', 10);
      logCase('testNumber0025', 'parse 1536 -> ' + parsed);
      expect(parsed).assertEqual(1536);
      expect(parsed + 1).assertEqual(1537);
      expect(parsed.toString(10)).assertEqual('1536');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0026
     * @tc.name      testNumber0026
     * @tc.desc      Parse integer 3072 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumber0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parsed: number = parseInt('3072', 10);
      logCase('testNumber0026', 'parse 3072 -> ' + parsed);
      expect(parsed).assertEqual(3072);
      expect(parsed + 1).assertEqual(3073);
      expect(parsed.toString(10)).assertEqual('3072');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0027
     * @tc.name      testNumber0027
     * @tc.desc      Parse integer 480 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumber0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parsed: number = parseInt('480', 10);
      logCase('testNumber0027', 'parse 480 -> ' + parsed);
      expect(parsed).assertEqual(480);
      expect(parsed + 1).assertEqual(481);
      expect(parsed.toString(10)).assertEqual('480');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0028
     * @tc.name      testNumber0028
     * @tc.desc      Parse integer 720 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumber0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parsed: number = parseInt('720', 10);
      logCase('testNumber0028', 'parse 720 -> ' + parsed);
      expect(parsed).assertEqual(720);
      expect(parsed + 1).assertEqual(721);
      expect(parsed.toString(10)).assertEqual('720');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0029
     * @tc.name      testNumber0029
     * @tc.desc      Parse integer 1080 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumber0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parsed: number = parseInt('1080', 10);
      logCase('testNumber0029', 'parse 1080 -> ' + parsed);
      expect(parsed).assertEqual(1080);
      expect(parsed + 1).assertEqual(1081);
      expect(parsed.toString(10)).assertEqual('1080');
      expect(parsed % 2).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_NUM_0030
     * @tc.name      testNumber0030
     * @tc.desc      Parse integer 960 with radix ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumber0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parsed: number = parseInt('960', 10);
      logCase('testNumber0030', 'parse 960 -> ' + parsed);
      expect(parsed).assertEqual(960);
      expect(parsed + 1).assertEqual(961);
      expect(parsed.toString(10)).assertEqual('960');
      expect(parsed % 2).assertEqual(0);
    });
;
  });
}
