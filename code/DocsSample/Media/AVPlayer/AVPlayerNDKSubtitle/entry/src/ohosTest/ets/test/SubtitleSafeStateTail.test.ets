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
import {beforeEach, describe, it, expect} from '@ohos/hypium';

export default function subtitleSafeStateTailTest() {
  describe('subtitleSafeStateTailTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0001
     * @tc.name      testSafeSeekSpeed0001
     * @tc.desc      Seek -100 clamps to 0; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0001', 0, () => {
      const duration: number = 10000;
      const value: number = -100;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(0);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0002
     * @tc.name      testSafeSeekSpeed0002
     * @tc.desc      Seek 37 clamps to 37; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0002', 0, () => {
      const duration: number = 10000;
      const value: number = 37;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(37);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0003
     * @tc.name      testSafeSeekSpeed0003
     * @tc.desc      Seek 174 clamps to 174; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0003', 0, () => {
      const duration: number = 10000;
      const value: number = 174;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(174);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0004
     * @tc.name      testSafeSeekSpeed0004
     * @tc.desc      Seek 311 clamps to 311; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0004', 0, () => {
      const duration: number = 10000;
      const value: number = 311;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(311);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0005
     * @tc.name      testSafeSeekSpeed0005
     * @tc.desc      Seek 448 clamps to 448; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0005', 0, () => {
      const duration: number = 10000;
      const value: number = 448;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(448);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0006
     * @tc.name      testSafeSeekSpeed0006
     * @tc.desc      Seek 585 clamps to 585; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0006', 0, () => {
      const duration: number = 10000;
      const value: number = 585;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(585);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0007
     * @tc.name      testSafeSeekSpeed0007
     * @tc.desc      Seek 722 clamps to 722; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0007', 0, () => {
      const duration: number = 10000;
      const value: number = 722;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(722);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0008
     * @tc.name      testSafeSeekSpeed0008
     * @tc.desc      Seek 859 clamps to 859; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0008', 0, () => {
      const duration: number = 10000;
      const value: number = 859;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(859);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0009
     * @tc.name      testSafeSeekSpeed0009
     * @tc.desc      Seek 996 clamps to 996; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0009', 0, () => {
      const duration: number = 10000;
      const value: number = 996;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(996);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0010
     * @tc.name      testSafeSeekSpeed0010
     * @tc.desc      Seek 1133 clamps to 1133; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0010', 0, () => {
      const duration: number = 10000;
      const value: number = 1133;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(1133);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0011
     * @tc.name      testSafeSeekSpeed0011
     * @tc.desc      Seek 1270 clamps to 1270; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0011', 0, () => {
      const duration: number = 10000;
      const value: number = 1270;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(1270);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0012
     * @tc.name      testSafeSeekSpeed0012
     * @tc.desc      Seek 1407 clamps to 1407; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0012', 0, () => {
      const duration: number = 10000;
      const value: number = 1407;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(1407);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0013
     * @tc.name      testSafeSeekSpeed0013
     * @tc.desc      Seek 1544 clamps to 1544; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0013', 0, () => {
      const duration: number = 10000;
      const value: number = 1544;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(1544);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0014
     * @tc.name      testSafeSeekSpeed0014
     * @tc.desc      Seek 1681 clamps to 1681; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0014', 0, () => {
      const duration: number = 10000;
      const value: number = 1681;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(1681);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0015
     * @tc.name      testSafeSeekSpeed0015
     * @tc.desc      Seek 1818 clamps to 1818; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0015', 0, () => {
      const duration: number = 10000;
      const value: number = 1818;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(1818);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0016
     * @tc.name      testSafeSeekSpeed0016
     * @tc.desc      Seek 1955 clamps to 1955; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0016', 0, () => {
      const duration: number = 10000;
      const value: number = 1955;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(1955);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0017
     * @tc.name      testSafeSeekSpeed0017
     * @tc.desc      Seek 2092 clamps to 2092; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0017', 0, () => {
      const duration: number = 10000;
      const value: number = 2092;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(2092);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0018
     * @tc.name      testSafeSeekSpeed0018
     * @tc.desc      Seek 2229 clamps to 2229; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0018', 0, () => {
      const duration: number = 10000;
      const value: number = 2229;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(2229);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0019
     * @tc.name      testSafeSeekSpeed0019
     * @tc.desc      Seek 2366 clamps to 2366; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0019', 0, () => {
      const duration: number = 10000;
      const value: number = 2366;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(2366);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0020
     * @tc.name      testSafeSeekSpeed0020
     * @tc.desc      Seek 2503 clamps to 2503; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0020', 0, () => {
      const duration: number = 10000;
      const value: number = 2503;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(2503);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0021
     * @tc.name      testSafeSeekSpeed0021
     * @tc.desc      Seek 2640 clamps to 2640; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0021', 0, () => {
      const duration: number = 10000;
      const value: number = 2640;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(2640);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0022
     * @tc.name      testSafeSeekSpeed0022
     * @tc.desc      Seek 2777 clamps to 2777; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0022', 0, () => {
      const duration: number = 10000;
      const value: number = 2777;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(2777);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0023
     * @tc.name      testSafeSeekSpeed0023
     * @tc.desc      Seek 2914 clamps to 2914; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0023', 0, () => {
      const duration: number = 10000;
      const value: number = 2914;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(2914);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0024
     * @tc.name      testSafeSeekSpeed0024
     * @tc.desc      Seek 3051 clamps to 3051; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0024', 0, () => {
      const duration: number = 10000;
      const value: number = 3051;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(3051);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0025
     * @tc.name      testSafeSeekSpeed0025
     * @tc.desc      Seek 3188 clamps to 3188; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0025', 0, () => {
      const duration: number = 10000;
      const value: number = 3188;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 6;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(3188);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0026
     * @tc.name      testSafeSeekSpeed0026
     * @tc.desc      Seek 3325 clamps to 3325; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0026', 0, () => {
      const duration: number = 10000;
      const value: number = 3325;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 6;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(3325);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0027
     * @tc.name      testSafeSeekSpeed0027
     * @tc.desc      Seek 3462 clamps to 3462; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0027', 0, () => {
      const duration: number = 10000;
      const value: number = 3462;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 6;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(3462);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0028
     * @tc.name      testSafeSeekSpeed0028
     * @tc.desc      Seek 3599 clamps to 3599; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0028', 0, () => {
      const duration: number = 10000;
      const value: number = 3599;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 6;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(3599);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0029
     * @tc.name      testSafeSeekSpeed0029
     * @tc.desc      Seek 3736 clamps to 3736; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0029', 0, () => {
      const duration: number = 10000;
      const value: number = 3736;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 7;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(3736);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0030
     * @tc.name      testSafeSeekSpeed0030
     * @tc.desc      Seek 3873 clamps to 3873; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0030', 0, () => {
      const duration: number = 10000;
      const value: number = 3873;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 7;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(3873);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0031
     * @tc.name      testSafeSeekSpeed0031
     * @tc.desc      Seek 4010 clamps to 4010; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0031', 0, () => {
      const duration: number = 10000;
      const value: number = 4010;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 7;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(4010);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0032
     * @tc.name      testSafeSeekSpeed0032
     * @tc.desc      Seek 4147 clamps to 4147; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0032', 0, () => {
      const duration: number = 10000;
      const value: number = 4147;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 7;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(4147);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0033
     * @tc.name      testSafeSeekSpeed0033
     * @tc.desc      Seek 4284 clamps to 4284; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0033', 0, () => {
      const duration: number = 10000;
      const value: number = 4284;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(4284);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0034
     * @tc.name      testSafeSeekSpeed0034
     * @tc.desc      Seek 4421 clamps to 4421; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0034', 0, () => {
      const duration: number = 10000;
      const value: number = 4421;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(4421);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0035
     * @tc.name      testSafeSeekSpeed0035
     * @tc.desc      Seek 4558 clamps to 4558; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0035', 0, () => {
      const duration: number = 10000;
      const value: number = 4558;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(4558);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0036
     * @tc.name      testSafeSeekSpeed0036
     * @tc.desc      Seek 4695 clamps to 4695; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0036', 0, () => {
      const duration: number = 10000;
      const value: number = 4695;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(4695);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0037
     * @tc.name      testSafeSeekSpeed0037
     * @tc.desc      Seek 4832 clamps to 4832; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0037', 0, () => {
      const duration: number = 10000;
      const value: number = 4832;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(4832);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0038
     * @tc.name      testSafeSeekSpeed0038
     * @tc.desc      Seek 4969 clamps to 4969; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0038', 0, () => {
      const duration: number = 10000;
      const value: number = 4969;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(4969);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0039
     * @tc.name      testSafeSeekSpeed0039
     * @tc.desc      Seek 5106 clamps to 5106; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0039', 0, () => {
      const duration: number = 10000;
      const value: number = 5106;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(5106);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0040
     * @tc.name      testSafeSeekSpeed0040
     * @tc.desc      Seek 5243 clamps to 5243; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0040', 0, () => {
      const duration: number = 10000;
      const value: number = 5243;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(5243);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0041
     * @tc.name      testSafeSeekSpeed0041
     * @tc.desc      Seek 5380 clamps to 5380; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0041', 0, () => {
      const duration: number = 10000;
      const value: number = 5380;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(5380);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0042
     * @tc.name      testSafeSeekSpeed0042
     * @tc.desc      Seek 5517 clamps to 5517; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0042', 0, () => {
      const duration: number = 10000;
      const value: number = 5517;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(5517);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0043
     * @tc.name      testSafeSeekSpeed0043
     * @tc.desc      Seek 5654 clamps to 5654; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0043', 0, () => {
      const duration: number = 10000;
      const value: number = 5654;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(5654);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0044
     * @tc.name      testSafeSeekSpeed0044
     * @tc.desc      Seek 5791 clamps to 5791; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0044', 0, () => {
      const duration: number = 10000;
      const value: number = 5791;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(5791);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0045
     * @tc.name      testSafeSeekSpeed0045
     * @tc.desc      Seek 5928 clamps to 5928; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0045', 0, () => {
      const duration: number = 10000;
      const value: number = 5928;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(5928);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0046
     * @tc.name      testSafeSeekSpeed0046
     * @tc.desc      Seek 6065 clamps to 6065; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0046', 0, () => {
      const duration: number = 10000;
      const value: number = 6065;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(6065);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0047
     * @tc.name      testSafeSeekSpeed0047
     * @tc.desc      Seek 6202 clamps to 6202; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0047', 0, () => {
      const duration: number = 10000;
      const value: number = 6202;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(6202);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0048
     * @tc.name      testSafeSeekSpeed0048
     * @tc.desc      Seek 6339 clamps to 6339; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0048', 0, () => {
      const duration: number = 10000;
      const value: number = 6339;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(6339);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0049
     * @tc.name      testSafeSeekSpeed0049
     * @tc.desc      Seek 6476 clamps to 6476; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0049', 0, () => {
      const duration: number = 10000;
      const value: number = 6476;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(6476);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0050
     * @tc.name      testSafeSeekSpeed0050
     * @tc.desc      Seek 6613 clamps to 6613; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0050', 0, () => {
      const duration: number = 10000;
      const value: number = 6613;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(6613);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0051
     * @tc.name      testSafeSeekSpeed0051
     * @tc.desc      Seek 6750 clamps to 6750; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0051', 0, () => {
      const duration: number = 10000;
      const value: number = 6750;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(6750);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0052
     * @tc.name      testSafeSeekSpeed0052
     * @tc.desc      Seek 6887 clamps to 6887; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0052', 0, () => {
      const duration: number = 10000;
      const value: number = 6887;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(6887);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0053
     * @tc.name      testSafeSeekSpeed0053
     * @tc.desc      Seek 7024 clamps to 7024; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0053', 0, () => {
      const duration: number = 10000;
      const value: number = 7024;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(7024);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0054
     * @tc.name      testSafeSeekSpeed0054
     * @tc.desc      Seek 7161 clamps to 7161; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0054', 0, () => {
      const duration: number = 10000;
      const value: number = 7161;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(7161);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0055
     * @tc.name      testSafeSeekSpeed0055
     * @tc.desc      Seek 7298 clamps to 7298; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0055', 0, () => {
      const duration: number = 10000;
      const value: number = 7298;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(7298);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0056
     * @tc.name      testSafeSeekSpeed0056
     * @tc.desc      Seek 7435 clamps to 7435; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0056', 0, () => {
      const duration: number = 10000;
      const value: number = 7435;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(7435);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0057
     * @tc.name      testSafeSeekSpeed0057
     * @tc.desc      Seek 7572 clamps to 7572; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0057', 0, () => {
      const duration: number = 10000;
      const value: number = 7572;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 6;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(7572);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0058
     * @tc.name      testSafeSeekSpeed0058
     * @tc.desc      Seek 7709 clamps to 7709; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0058', 0, () => {
      const duration: number = 10000;
      const value: number = 7709;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 6;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(7709);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0059
     * @tc.name      testSafeSeekSpeed0059
     * @tc.desc      Seek 7846 clamps to 7846; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0059', 0, () => {
      const duration: number = 10000;
      const value: number = 7846;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 6;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(7846);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0060
     * @tc.name      testSafeSeekSpeed0060
     * @tc.desc      Seek 7983 clamps to 7983; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0060', 0, () => {
      const duration: number = 10000;
      const value: number = 7983;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 6;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(7983);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0061
     * @tc.name      testSafeSeekSpeed0061
     * @tc.desc      Seek 8120 clamps to 8120; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0061', 0, () => {
      const duration: number = 10000;
      const value: number = 8120;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 7;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(8120);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0062
     * @tc.name      testSafeSeekSpeed0062
     * @tc.desc      Seek 8257 clamps to 8257; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0062', 0, () => {
      const duration: number = 10000;
      const value: number = 8257;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 7;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(8257);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0063
     * @tc.name      testSafeSeekSpeed0063
     * @tc.desc      Seek 8394 clamps to 8394; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0063', 0, () => {
      const duration: number = 10000;
      const value: number = 8394;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 7;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(8394);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0064
     * @tc.name      testSafeSeekSpeed0064
     * @tc.desc      Seek 8531 clamps to 8531; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0064', 0, () => {
      const duration: number = 10000;
      const value: number = 8531;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 7;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(8531);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0065
     * @tc.name      testSafeSeekSpeed0065
     * @tc.desc      Seek 8668 clamps to 8668; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0065', 0, () => {
      const duration: number = 10000;
      const value: number = 8668;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(8668);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0066
     * @tc.name      testSafeSeekSpeed0066
     * @tc.desc      Seek 8805 clamps to 8805; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0066', 0, () => {
      const duration: number = 10000;
      const value: number = 8805;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(8805);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0067
     * @tc.name      testSafeSeekSpeed0067
     * @tc.desc      Seek 8942 clamps to 8942; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0067', 0, () => {
      const duration: number = 10000;
      const value: number = 8942;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(8942);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0068
     * @tc.name      testSafeSeekSpeed0068
     * @tc.desc      Seek 9079 clamps to 9079; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0068', 0, () => {
      const duration: number = 10000;
      const value: number = 9079;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 0;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(9079);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0069
     * @tc.name      testSafeSeekSpeed0069
     * @tc.desc      Seek 9216 clamps to 9216; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0069', 0, () => {
      const duration: number = 10000;
      const value: number = 9216;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(9216);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0070
     * @tc.name      testSafeSeekSpeed0070
     * @tc.desc      Seek 9353 clamps to 9353; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0070', 0, () => {
      const duration: number = 10000;
      const value: number = 9353;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(9353);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0071
     * @tc.name      testSafeSeekSpeed0071
     * @tc.desc      Seek 9490 clamps to 9490; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0071', 0, () => {
      const duration: number = 10000;
      const value: number = 9490;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(9490);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0072
     * @tc.name      testSafeSeekSpeed0072
     * @tc.desc      Seek 9627 clamps to 9627; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0072', 0, () => {
      const duration: number = 10000;
      const value: number = 9627;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 1;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(9627);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0073
     * @tc.name      testSafeSeekSpeed0073
     * @tc.desc      Seek 9764 clamps to 9764; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0073', 0, () => {
      const duration: number = 10000;
      const value: number = 9764;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(9764);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0074
     * @tc.name      testSafeSeekSpeed0074
     * @tc.desc      Seek 9901 clamps to 9901; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0074', 0, () => {
      const duration: number = 10000;
      const value: number = 9901;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(9901);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0075
     * @tc.name      testSafeSeekSpeed0075
     * @tc.desc      Seek 10038 clamps to 10000; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0075', 0, () => {
      const duration: number = 10000;
      const value: number = 10038;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0076
     * @tc.name      testSafeSeekSpeed0076
     * @tc.desc      Seek 10175 clamps to 10000; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0076', 0, () => {
      const duration: number = 10000;
      const value: number = 10175;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 2;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0077
     * @tc.name      testSafeSeekSpeed0077
     * @tc.desc      Seek 10312 clamps to 10000; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0077', 0, () => {
      const duration: number = 10000;
      const value: number = 10312;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0078
     * @tc.name      testSafeSeekSpeed0078
     * @tc.desc      Seek 10449 clamps to 10000; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0078', 0, () => {
      const duration: number = 10000;
      const value: number = 10449;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0079
     * @tc.name      testSafeSeekSpeed0079
     * @tc.desc      Seek 10586 clamps to 10000; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0079', 0, () => {
      const duration: number = 10000;
      const value: number = 10586;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0080
     * @tc.name      testSafeSeekSpeed0080
     * @tc.desc      Seek 10723 clamps to 10000; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0080', 0, () => {
      const duration: number = 10000;
      const value: number = 10723;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 3;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0081
     * @tc.name      testSafeSeekSpeed0081
     * @tc.desc      Seek 10860 clamps to 10000; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0081', 0, () => {
      const duration: number = 10000;
      const value: number = 10860;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0082
     * @tc.name      testSafeSeekSpeed0082
     * @tc.desc      Seek 10997 clamps to 10000; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0082', 0, () => {
      const duration: number = 10000;
      const value: number = 10997;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0083
     * @tc.name      testSafeSeekSpeed0083
     * @tc.desc      Seek 11134 clamps to 10000; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0083', 0, () => {
      const duration: number = 10000;
      const value: number = 11134;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0084
     * @tc.name      testSafeSeekSpeed0084
     * @tc.desc      Seek 11271 clamps to 10000; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0084', 0, () => {
      const duration: number = 10000;
      const value: number = 11271;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 4;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0085
     * @tc.name      testSafeSeekSpeed0085
     * @tc.desc      Seek 11408 clamps to 10000; speed index becomes 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0085', 0, () => {
      const duration: number = 10000;
      const value: number = 11408;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 0;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(1);
      expect(names[speedIndex]).assertEqual('1.25X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0086
     * @tc.name      testSafeSeekSpeed0086
     * @tc.desc      Seek 11545 clamps to 10000; speed index becomes 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0086', 0, () => {
      const duration: number = 10000;
      const value: number = 11545;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 1;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(2);
      expect(names[speedIndex]).assertEqual('1.75X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0087
     * @tc.name      testSafeSeekSpeed0087
     * @tc.desc      Seek 11682 clamps to 10000; speed index becomes 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0087', 0, () => {
      const duration: number = 10000;
      const value: number = 11682;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 2;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(3);
      expect(names[speedIndex]).assertEqual('2.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_SB_0088
     * @tc.name      testSafeSeekSpeed0088
     * @tc.desc      Seek 11819 clamps to 10000; speed index becomes 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeSeekSpeed0088', 0, () => {
      const duration: number = 10000;
      const value: number = 11819;
      const clamped: number = Math.max(0, Math.min(value, duration));
      const start: number = 3;
      const clicks: number = 5;
      const speedIndex: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(clamped).assertEqual(10000);
      expect(speedIndex).assertEqual(0);
      expect(names[speedIndex]).assertEqual('1.0X');
      expect(clamped >= 0 && clamped <= duration).assertTrue();
    })
  })
}
