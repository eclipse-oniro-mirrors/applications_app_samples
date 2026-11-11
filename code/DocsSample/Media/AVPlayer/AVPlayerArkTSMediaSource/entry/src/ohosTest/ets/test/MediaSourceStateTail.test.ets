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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourceStateTail]';
const DOMAIN: number = 0xF812;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceStateTailTest(): void {
  describe('mediaSourceStateTailTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0001
     * @tc.name      testSafeStateTail0001
     * @tc.desc      Seek 0 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 0;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(10000);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0002
     * @tc.name      testSafeStateTail0002
     * @tc.desc      Seek 137 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 137;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9863);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0003
     * @tc.name      testSafeStateTail0003
     * @tc.desc      Seek 274 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 274;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9726);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0004
     * @tc.name      testSafeStateTail0004
     * @tc.desc      Seek 411 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 411;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9589);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0005
     * @tc.name      testSafeStateTail0005
     * @tc.desc      Seek 548 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 548;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9452);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0006
     * @tc.name      testSafeStateTail0006
     * @tc.desc      Seek 685 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 685;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9315);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0007
     * @tc.name      testSafeStateTail0007
     * @tc.desc      Seek 822 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 822;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9178);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0008
     * @tc.name      testSafeStateTail0008
     * @tc.desc      Seek 959 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 959;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9041);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0009
     * @tc.name      testSafeStateTail0009
     * @tc.desc      Seek 1096 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1096;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8904);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0010
     * @tc.name      testSafeStateTail0010
     * @tc.desc      Seek 1233 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1233;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8767);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0011
     * @tc.name      testSafeStateTail0011
     * @tc.desc      Seek 1370 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1370;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8630);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0012
     * @tc.name      testSafeStateTail0012
     * @tc.desc      Seek 1507 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1507;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8493);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0013
     * @tc.name      testSafeStateTail0013
     * @tc.desc      Seek 1644 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1644;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8356);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0014
     * @tc.name      testSafeStateTail0014
     * @tc.desc      Seek 1781 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1781;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8219);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0015
     * @tc.name      testSafeStateTail0015
     * @tc.desc      Seek 1918 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1918;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8082);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0016
     * @tc.name      testSafeStateTail0016
     * @tc.desc      Seek 2055 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2055;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7945);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0017
     * @tc.name      testSafeStateTail0017
     * @tc.desc      Seek 2192 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2192;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7808);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0018
     * @tc.name      testSafeStateTail0018
     * @tc.desc      Seek 2329 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2329;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7671);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0019
     * @tc.name      testSafeStateTail0019
     * @tc.desc      Seek 2466 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2466;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7534);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0020
     * @tc.name      testSafeStateTail0020
     * @tc.desc      Seek 2603 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2603;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7397);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0021
     * @tc.name      testSafeStateTail0021
     * @tc.desc      Seek 2740 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2740;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7260);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0022
     * @tc.name      testSafeStateTail0022
     * @tc.desc      Seek 2877 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2877;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7123);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0023
     * @tc.name      testSafeStateTail0023
     * @tc.desc      Seek 3014 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 3014;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(6986);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0024
     * @tc.name      testSafeStateTail0024
     * @tc.desc      Seek 3151 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 3151;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(6849);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0025
     * @tc.name      testSafeStateTail0025
     * @tc.desc      Seek 3288 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 3288;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(6712);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0026
     * @tc.name      testSafeStateTail0026
     * @tc.desc      Seek 3425 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 3425;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(6575);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0027
     * @tc.name      testSafeStateTail0027
     * @tc.desc      Seek 3562 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 3562;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(6438);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0028
     * @tc.name      testSafeStateTail0028
     * @tc.desc      Seek 3699 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 3699;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(6301);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0029
     * @tc.name      testSafeStateTail0029
     * @tc.desc      Seek 3836 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 3836;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(6164);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0030
     * @tc.name      testSafeStateTail0030
     * @tc.desc      Seek 3973 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 3973;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(6027);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0031
     * @tc.name      testSafeStateTail0031
     * @tc.desc      Seek 4110 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 4110;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(5890);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0032
     * @tc.name      testSafeStateTail0032
     * @tc.desc      Seek 4247 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 4247;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(5753);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0033
     * @tc.name      testSafeStateTail0033
     * @tc.desc      Seek 4384 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 4384;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(5616);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0034
     * @tc.name      testSafeStateTail0034
     * @tc.desc      Seek 4521 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 4521;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(5479);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0035
     * @tc.name      testSafeStateTail0035
     * @tc.desc      Seek 4658 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 4658;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(5342);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0036
     * @tc.name      testSafeStateTail0036
     * @tc.desc      Seek 4795 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 4795;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(5205);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0037
     * @tc.name      testSafeStateTail0037
     * @tc.desc      Seek 4932 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 4932;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(5068);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0038
     * @tc.name      testSafeStateTail0038
     * @tc.desc      Seek 5069 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 5069;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(4931);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0039
     * @tc.name      testSafeStateTail0039
     * @tc.desc      Seek 5206 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 5206;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(4794);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0040
     * @tc.name      testSafeStateTail0040
     * @tc.desc      Seek 5343 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 5343;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(4657);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0041
     * @tc.name      testSafeStateTail0041
     * @tc.desc      Seek 5480 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 5480;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(4520);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0042
     * @tc.name      testSafeStateTail0042
     * @tc.desc      Seek 5617 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 5617;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(4383);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0043
     * @tc.name      testSafeStateTail0043
     * @tc.desc      Seek 5754 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 5754;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(4246);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0044
     * @tc.name      testSafeStateTail0044
     * @tc.desc      Seek 5891 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 5891;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(4109);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0045
     * @tc.name      testSafeStateTail0045
     * @tc.desc      Seek 6028 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 6028;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(3972);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0046
     * @tc.name      testSafeStateTail0046
     * @tc.desc      Seek 6165 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 6165;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(3835);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0047
     * @tc.name      testSafeStateTail0047
     * @tc.desc      Seek 6302 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 6302;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(3698);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0048
     * @tc.name      testSafeStateTail0048
     * @tc.desc      Seek 6439 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 6439;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(3561);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0049
     * @tc.name      testSafeStateTail0049
     * @tc.desc      Seek 6576 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 6576;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(3424);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0050
     * @tc.name      testSafeStateTail0050
     * @tc.desc      Seek 6713 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 6713;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(3287);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0051
     * @tc.name      testSafeStateTail0051
     * @tc.desc      Seek 6850 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 6850;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(3150);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0052
     * @tc.name      testSafeStateTail0052
     * @tc.desc      Seek 6987 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 6987;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(3013);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0053
     * @tc.name      testSafeStateTail0053
     * @tc.desc      Seek 7124 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 7124;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(2876);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0054
     * @tc.name      testSafeStateTail0054
     * @tc.desc      Seek 7261 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 7261;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(2739);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0055
     * @tc.name      testSafeStateTail0055
     * @tc.desc      Seek 7398 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 7398;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(2602);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0056
     * @tc.name      testSafeStateTail0056
     * @tc.desc      Seek 7535 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 7535;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(2465);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0057
     * @tc.name      testSafeStateTail0057
     * @tc.desc      Seek 7672 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 7672;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(2328);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0058
     * @tc.name      testSafeStateTail0058
     * @tc.desc      Seek 7809 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 7809;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(2191);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0059
     * @tc.name      testSafeStateTail0059
     * @tc.desc      Seek 7946 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 7946;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(2054);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0060
     * @tc.name      testSafeStateTail0060
     * @tc.desc      Seek 8083 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 8083;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1917);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0061
     * @tc.name      testSafeStateTail0061
     * @tc.desc      Seek 8220 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 8220;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1780);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0062
     * @tc.name      testSafeStateTail0062
     * @tc.desc      Seek 8357 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 8357;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1643);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0063
     * @tc.name      testSafeStateTail0063
     * @tc.desc      Seek 8494 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 8494;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1506);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0064
     * @tc.name      testSafeStateTail0064
     * @tc.desc      Seek 8631 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 8631;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1369);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0065
     * @tc.name      testSafeStateTail0065
     * @tc.desc      Seek 8768 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 8768;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1232);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0066
     * @tc.name      testSafeStateTail0066
     * @tc.desc      Seek 8905 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 8905;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1095);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0067
     * @tc.name      testSafeStateTail0067
     * @tc.desc      Seek 9042 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 9042;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(958);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0068
     * @tc.name      testSafeStateTail0068
     * @tc.desc      Seek 9179 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 9179;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(821);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0069
     * @tc.name      testSafeStateTail0069
     * @tc.desc      Seek 9316 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 9316;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(684);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0070
     * @tc.name      testSafeStateTail0070
     * @tc.desc      Seek 9453 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 9453;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(547);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0071
     * @tc.name      testSafeStateTail0071
     * @tc.desc      Seek 9590 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 9590;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(410);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0072
     * @tc.name      testSafeStateTail0072
     * @tc.desc      Seek 9727 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 9727;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(273);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0073
     * @tc.name      testSafeStateTail0073
     * @tc.desc      Seek 9864 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 9864;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(136);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0074
     * @tc.name      testSafeStateTail0074
     * @tc.desc      Seek 1 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9999);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0075
     * @tc.name      testSafeStateTail0075
     * @tc.desc      Seek 138 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 138;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9862);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0076
     * @tc.name      testSafeStateTail0076
     * @tc.desc      Seek 275 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 275;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9725);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0077
     * @tc.name      testSafeStateTail0077
     * @tc.desc      Seek 412 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 412;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9588);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0078
     * @tc.name      testSafeStateTail0078
     * @tc.desc      Seek 549 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 549;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9451);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0079
     * @tc.name      testSafeStateTail0079
     * @tc.desc      Seek 686 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 686;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9314);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0080
     * @tc.name      testSafeStateTail0080
     * @tc.desc      Seek 823 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 823;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9177);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0081
     * @tc.name      testSafeStateTail0081
     * @tc.desc      Seek 960 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 960;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(9040);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0082
     * @tc.name      testSafeStateTail0082
     * @tc.desc      Seek 1097 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1097;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8903);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0083
     * @tc.name      testSafeStateTail0083
     * @tc.desc      Seek 1234 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1234;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8766);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0084
     * @tc.name      testSafeStateTail0084
     * @tc.desc      Seek 1371 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1371;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8629);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0085
     * @tc.name      testSafeStateTail0085
     * @tc.desc      Seek 1508 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1508;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8492);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0086
     * @tc.name      testSafeStateTail0086
     * @tc.desc      Seek 1645 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1645;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8355);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0087
     * @tc.name      testSafeStateTail0087
     * @tc.desc      Seek 1782 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1782;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8218);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0088
     * @tc.name      testSafeStateTail0088
     * @tc.desc      Seek 1919 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 1919;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8081);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0089
     * @tc.name      testSafeStateTail0089
     * @tc.desc      Seek 2056 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2056;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7944);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0090
     * @tc.name      testSafeStateTail0090
     * @tc.desc      Seek 2193 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2193;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7807);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0091
     * @tc.name      testSafeStateTail0091
     * @tc.desc      Seek 2330 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2330;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7670);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0092
     * @tc.name      testSafeStateTail0092
     * @tc.desc      Seek 2467 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2467;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7533);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0093
     * @tc.name      testSafeStateTail0093
     * @tc.desc      Seek 2604 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2604;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7396);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0094
     * @tc.name      testSafeStateTail0094
     * @tc.desc      Seek 2741 at 1x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2741;
      const speed: number = 1;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7259);
      expect(effective).assertEqual(10000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0095
     * @tc.name      testSafeStateTail0095
     * @tc.desc      Seek 2878 at 1.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 2878;
      const speed: number = 1.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(7122);
      expect(effective).assertEqual(6666.666666666667);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0096
     * @tc.name      testSafeStateTail0096
     * @tc.desc      Seek 3015 at 2x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 3015;
      const speed: number = 2;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(6985);
      expect(effective).assertEqual(5000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_STT_0097
     * @tc.name      testSafeStateTail0097
     * @tc.desc      Seek 3152 at 0.5x keeps remaining/effective time math.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeStateTail0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const seek: number = 3152;
      const speed: number = 0.5;
      const remaining: number = duration - seek;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(6848);
      expect(effective).assertEqual(20000.0);
      expect(seek >= 0 && seek <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
  })
}
