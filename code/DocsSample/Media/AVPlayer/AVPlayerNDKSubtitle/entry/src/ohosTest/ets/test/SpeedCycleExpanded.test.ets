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
import { describe, it, expect } from '@ohos/hypium';

export default function speedCycleExpandedTest() {
  describe('speedCycleExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0001
     * @tc.name      testMoreSpeedCycle0001
     * @tc.desc      Start speed 0 after 0 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0001', 0, () => {
      const start: number = 0;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0002
     * @tc.name      testMoreSpeedCycle0002
     * @tc.desc      Start speed 1 after 0 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0002', 0, () => {
      const start: number = 1;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0003
     * @tc.name      testMoreSpeedCycle0003
     * @tc.desc      Start speed 2 after 0 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0003', 0, () => {
      const start: number = 2;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0004
     * @tc.name      testMoreSpeedCycle0004
     * @tc.desc      Start speed 3 after 0 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0004', 0, () => {
      const start: number = 3;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0005
     * @tc.name      testMoreSpeedCycle0005
     * @tc.desc      Start speed 0 after 1 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0005', 0, () => {
      const start: number = 0;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0006
     * @tc.name      testMoreSpeedCycle0006
     * @tc.desc      Start speed 1 after 1 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0006', 0, () => {
      const start: number = 1;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0007
     * @tc.name      testMoreSpeedCycle0007
     * @tc.desc      Start speed 2 after 1 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0007', 0, () => {
      const start: number = 2;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0008
     * @tc.name      testMoreSpeedCycle0008
     * @tc.desc      Start speed 3 after 1 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0008', 0, () => {
      const start: number = 3;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0009
     * @tc.name      testMoreSpeedCycle0009
     * @tc.desc      Start speed 0 after 2 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0009', 0, () => {
      const start: number = 0;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0010
     * @tc.name      testMoreSpeedCycle0010
     * @tc.desc      Start speed 1 after 2 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0010', 0, () => {
      const start: number = 1;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0011
     * @tc.name      testMoreSpeedCycle0011
     * @tc.desc      Start speed 2 after 2 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0011', 0, () => {
      const start: number = 2;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0012
     * @tc.name      testMoreSpeedCycle0012
     * @tc.desc      Start speed 3 after 2 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0012', 0, () => {
      const start: number = 3;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0013
     * @tc.name      testMoreSpeedCycle0013
     * @tc.desc      Start speed 0 after 3 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0013', 0, () => {
      const start: number = 0;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0014
     * @tc.name      testMoreSpeedCycle0014
     * @tc.desc      Start speed 1 after 3 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0014', 0, () => {
      const start: number = 1;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0015
     * @tc.name      testMoreSpeedCycle0015
     * @tc.desc      Start speed 2 after 3 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0015', 0, () => {
      const start: number = 2;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0016
     * @tc.name      testMoreSpeedCycle0016
     * @tc.desc      Start speed 3 after 3 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0016', 0, () => {
      const start: number = 3;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0017
     * @tc.name      testMoreSpeedCycle0017
     * @tc.desc      Start speed 0 after 4 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0017', 0, () => {
      const start: number = 0;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0018
     * @tc.name      testMoreSpeedCycle0018
     * @tc.desc      Start speed 1 after 4 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0018', 0, () => {
      const start: number = 1;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0019
     * @tc.name      testMoreSpeedCycle0019
     * @tc.desc      Start speed 2 after 4 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0019', 0, () => {
      const start: number = 2;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0020
     * @tc.name      testMoreSpeedCycle0020
     * @tc.desc      Start speed 3 after 4 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0020', 0, () => {
      const start: number = 3;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0021
     * @tc.name      testMoreSpeedCycle0021
     * @tc.desc      Start speed 0 after 5 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0021', 0, () => {
      const start: number = 0;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0022
     * @tc.name      testMoreSpeedCycle0022
     * @tc.desc      Start speed 1 after 5 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0022', 0, () => {
      const start: number = 1;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0023
     * @tc.name      testMoreSpeedCycle0023
     * @tc.desc      Start speed 2 after 5 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0023', 0, () => {
      const start: number = 2;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0024
     * @tc.name      testMoreSpeedCycle0024
     * @tc.desc      Start speed 3 after 5 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0024', 0, () => {
      const start: number = 3;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0025
     * @tc.name      testMoreSpeedCycle0025
     * @tc.desc      Start speed 0 after 6 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0025', 0, () => {
      const start: number = 0;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0026
     * @tc.name      testMoreSpeedCycle0026
     * @tc.desc      Start speed 1 after 6 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0026', 0, () => {
      const start: number = 1;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0027
     * @tc.name      testMoreSpeedCycle0027
     * @tc.desc      Start speed 2 after 6 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0027', 0, () => {
      const start: number = 2;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0028
     * @tc.name      testMoreSpeedCycle0028
     * @tc.desc      Start speed 3 after 6 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0028', 0, () => {
      const start: number = 3;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0029
     * @tc.name      testMoreSpeedCycle0029
     * @tc.desc      Start speed 0 after 7 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0029', 0, () => {
      const start: number = 0;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0030
     * @tc.name      testMoreSpeedCycle0030
     * @tc.desc      Start speed 1 after 7 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0030', 0, () => {
      const start: number = 1;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0031
     * @tc.name      testMoreSpeedCycle0031
     * @tc.desc      Start speed 2 after 7 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0031', 0, () => {
      const start: number = 2;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0032
     * @tc.name      testMoreSpeedCycle0032
     * @tc.desc      Start speed 3 after 7 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0032', 0, () => {
      const start: number = 3;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0033
     * @tc.name      testMoreSpeedCycle0033
     * @tc.desc      Start speed 0 after 0 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0033', 0, () => {
      const start: number = 0;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0034
     * @tc.name      testMoreSpeedCycle0034
     * @tc.desc      Start speed 1 after 0 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0034', 0, () => {
      const start: number = 1;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0035
     * @tc.name      testMoreSpeedCycle0035
     * @tc.desc      Start speed 2 after 0 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0035', 0, () => {
      const start: number = 2;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0036
     * @tc.name      testMoreSpeedCycle0036
     * @tc.desc      Start speed 3 after 0 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0036', 0, () => {
      const start: number = 3;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0037
     * @tc.name      testMoreSpeedCycle0037
     * @tc.desc      Start speed 0 after 1 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0037', 0, () => {
      const start: number = 0;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0038
     * @tc.name      testMoreSpeedCycle0038
     * @tc.desc      Start speed 1 after 1 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0038', 0, () => {
      const start: number = 1;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0039
     * @tc.name      testMoreSpeedCycle0039
     * @tc.desc      Start speed 2 after 1 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0039', 0, () => {
      const start: number = 2;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0040
     * @tc.name      testMoreSpeedCycle0040
     * @tc.desc      Start speed 3 after 1 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0040', 0, () => {
      const start: number = 3;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0041
     * @tc.name      testMoreSpeedCycle0041
     * @tc.desc      Start speed 0 after 2 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0041', 0, () => {
      const start: number = 0;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0042
     * @tc.name      testMoreSpeedCycle0042
     * @tc.desc      Start speed 1 after 2 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0042', 0, () => {
      const start: number = 1;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0043
     * @tc.name      testMoreSpeedCycle0043
     * @tc.desc      Start speed 2 after 2 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0043', 0, () => {
      const start: number = 2;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0044
     * @tc.name      testMoreSpeedCycle0044
     * @tc.desc      Start speed 3 after 2 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0044', 0, () => {
      const start: number = 3;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0045
     * @tc.name      testMoreSpeedCycle0045
     * @tc.desc      Start speed 0 after 3 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0045', 0, () => {
      const start: number = 0;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0046
     * @tc.name      testMoreSpeedCycle0046
     * @tc.desc      Start speed 1 after 3 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0046', 0, () => {
      const start: number = 1;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0047
     * @tc.name      testMoreSpeedCycle0047
     * @tc.desc      Start speed 2 after 3 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0047', 0, () => {
      const start: number = 2;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0048
     * @tc.name      testMoreSpeedCycle0048
     * @tc.desc      Start speed 3 after 3 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0048', 0, () => {
      const start: number = 3;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0049
     * @tc.name      testMoreSpeedCycle0049
     * @tc.desc      Start speed 0 after 4 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0049', 0, () => {
      const start: number = 0;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0050
     * @tc.name      testMoreSpeedCycle0050
     * @tc.desc      Start speed 1 after 4 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0050', 0, () => {
      const start: number = 1;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0051
     * @tc.name      testMoreSpeedCycle0051
     * @tc.desc      Start speed 2 after 4 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0051', 0, () => {
      const start: number = 2;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0052
     * @tc.name      testMoreSpeedCycle0052
     * @tc.desc      Start speed 3 after 4 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0052', 0, () => {
      const start: number = 3;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0053
     * @tc.name      testMoreSpeedCycle0053
     * @tc.desc      Start speed 0 after 5 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0053', 0, () => {
      const start: number = 0;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0054
     * @tc.name      testMoreSpeedCycle0054
     * @tc.desc      Start speed 1 after 5 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0054', 0, () => {
      const start: number = 1;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0055
     * @tc.name      testMoreSpeedCycle0055
     * @tc.desc      Start speed 2 after 5 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0055', 0, () => {
      const start: number = 2;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0056
     * @tc.name      testMoreSpeedCycle0056
     * @tc.desc      Start speed 3 after 5 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0056', 0, () => {
      const start: number = 3;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0057
     * @tc.name      testMoreSpeedCycle0057
     * @tc.desc      Start speed 0 after 6 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0057', 0, () => {
      const start: number = 0;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0058
     * @tc.name      testMoreSpeedCycle0058
     * @tc.desc      Start speed 1 after 6 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0058', 0, () => {
      const start: number = 1;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0059
     * @tc.name      testMoreSpeedCycle0059
     * @tc.desc      Start speed 2 after 6 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0059', 0, () => {
      const start: number = 2;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0060
     * @tc.name      testMoreSpeedCycle0060
     * @tc.desc      Start speed 3 after 6 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0060', 0, () => {
      const start: number = 3;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0061
     * @tc.name      testMoreSpeedCycle0061
     * @tc.desc      Start speed 0 after 7 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0061', 0, () => {
      const start: number = 0;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0062
     * @tc.name      testMoreSpeedCycle0062
     * @tc.desc      Start speed 1 after 7 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0062', 0, () => {
      const start: number = 1;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0063
     * @tc.name      testMoreSpeedCycle0063
     * @tc.desc      Start speed 2 after 7 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0063', 0, () => {
      const start: number = 2;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0064
     * @tc.name      testMoreSpeedCycle0064
     * @tc.desc      Start speed 3 after 7 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0064', 0, () => {
      const start: number = 3;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0065
     * @tc.name      testMoreSpeedCycle0065
     * @tc.desc      Start speed 0 after 0 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0065', 0, () => {
      const start: number = 0;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0066
     * @tc.name      testMoreSpeedCycle0066
     * @tc.desc      Start speed 1 after 0 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0066', 0, () => {
      const start: number = 1;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0067
     * @tc.name      testMoreSpeedCycle0067
     * @tc.desc      Start speed 2 after 0 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0067', 0, () => {
      const start: number = 2;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0068
     * @tc.name      testMoreSpeedCycle0068
     * @tc.desc      Start speed 3 after 0 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0068', 0, () => {
      const start: number = 3;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0069
     * @tc.name      testMoreSpeedCycle0069
     * @tc.desc      Start speed 0 after 1 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0069', 0, () => {
      const start: number = 0;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0070
     * @tc.name      testMoreSpeedCycle0070
     * @tc.desc      Start speed 1 after 1 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0070', 0, () => {
      const start: number = 1;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0071
     * @tc.name      testMoreSpeedCycle0071
     * @tc.desc      Start speed 2 after 1 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0071', 0, () => {
      const start: number = 2;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0072
     * @tc.name      testMoreSpeedCycle0072
     * @tc.desc      Start speed 3 after 1 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0072', 0, () => {
      const start: number = 3;
      const clicks: number = 1;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0073
     * @tc.name      testMoreSpeedCycle0073
     * @tc.desc      Start speed 0 after 2 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0073', 0, () => {
      const start: number = 0;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0074
     * @tc.name      testMoreSpeedCycle0074
     * @tc.desc      Start speed 1 after 2 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0074', 0, () => {
      const start: number = 1;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0075
     * @tc.name      testMoreSpeedCycle0075
     * @tc.desc      Start speed 2 after 2 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0075', 0, () => {
      const start: number = 2;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0076
     * @tc.name      testMoreSpeedCycle0076
     * @tc.desc      Start speed 3 after 2 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0076', 0, () => {
      const start: number = 3;
      const clicks: number = 2;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0077
     * @tc.name      testMoreSpeedCycle0077
     * @tc.desc      Start speed 0 after 3 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0077', 0, () => {
      const start: number = 0;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0078
     * @tc.name      testMoreSpeedCycle0078
     * @tc.desc      Start speed 1 after 3 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0078', 0, () => {
      const start: number = 1;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0079
     * @tc.name      testMoreSpeedCycle0079
     * @tc.desc      Start speed 2 after 3 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0079', 0, () => {
      const start: number = 2;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0080
     * @tc.name      testMoreSpeedCycle0080
     * @tc.desc      Start speed 3 after 3 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0080', 0, () => {
      const start: number = 3;
      const clicks: number = 3;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0081
     * @tc.name      testMoreSpeedCycle0081
     * @tc.desc      Start speed 0 after 4 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0081', 0, () => {
      const start: number = 0;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0082
     * @tc.name      testMoreSpeedCycle0082
     * @tc.desc      Start speed 1 after 4 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0082', 0, () => {
      const start: number = 1;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0083
     * @tc.name      testMoreSpeedCycle0083
     * @tc.desc      Start speed 2 after 4 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0083', 0, () => {
      const start: number = 2;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0084
     * @tc.name      testMoreSpeedCycle0084
     * @tc.desc      Start speed 3 after 4 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0084', 0, () => {
      const start: number = 3;
      const clicks: number = 4;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0085
     * @tc.name      testMoreSpeedCycle0085
     * @tc.desc      Start speed 0 after 5 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0085', 0, () => {
      const start: number = 0;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0086
     * @tc.name      testMoreSpeedCycle0086
     * @tc.desc      Start speed 1 after 5 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0086', 0, () => {
      const start: number = 1;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0087
     * @tc.name      testMoreSpeedCycle0087
     * @tc.desc      Start speed 2 after 5 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0087', 0, () => {
      const start: number = 2;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0088
     * @tc.name      testMoreSpeedCycle0088
     * @tc.desc      Start speed 3 after 5 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0088', 0, () => {
      const start: number = 3;
      const clicks: number = 5;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0089
     * @tc.name      testMoreSpeedCycle0089
     * @tc.desc      Start speed 0 after 6 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0089', 0, () => {
      const start: number = 0;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0090
     * @tc.name      testMoreSpeedCycle0090
     * @tc.desc      Start speed 1 after 6 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0090', 0, () => {
      const start: number = 1;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0091
     * @tc.name      testMoreSpeedCycle0091
     * @tc.desc      Start speed 2 after 6 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0091', 0, () => {
      const start: number = 2;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0092
     * @tc.name      testMoreSpeedCycle0092
     * @tc.desc      Start speed 3 after 6 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0092', 0, () => {
      const start: number = 3;
      const clicks: number = 6;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0093
     * @tc.name      testMoreSpeedCycle0093
     * @tc.desc      Start speed 0 after 7 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0093', 0, () => {
      const start: number = 0;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0094
     * @tc.name      testMoreSpeedCycle0094
     * @tc.desc      Start speed 1 after 7 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0094', 0, () => {
      const start: number = 1;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0095
     * @tc.name      testMoreSpeedCycle0095
     * @tc.desc      Start speed 2 after 7 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0095', 0, () => {
      const start: number = 2;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0096
     * @tc.name      testMoreSpeedCycle0096
     * @tc.desc      Start speed 3 after 7 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0096', 0, () => {
      const start: number = 3;
      const clicks: number = 7;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0097
     * @tc.name      testMoreSpeedCycle0097
     * @tc.desc      Start speed 0 after 0 clicks reaches 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0097', 0, () => {
      const start: number = 0;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(0);
      expect(names[index]).assertEqual('1.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0098
     * @tc.name      testMoreSpeedCycle0098
     * @tc.desc      Start speed 1 after 0 clicks reaches 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0098', 0, () => {
      const start: number = 1;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(1);
      expect(names[index]).assertEqual('1.25X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0099
     * @tc.name      testMoreSpeedCycle0099
     * @tc.desc      Start speed 2 after 0 clicks reaches 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0099', 0, () => {
      const start: number = 2;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(2);
      expect(names[index]).assertEqual('1.75X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_MORE_SPD_0100
     * @tc.name      testMoreSpeedCycle0100
     * @tc.desc      Start speed 3 after 0 clicks reaches 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSpeedCycle0100', 0, () => {
      const start: number = 3;
      const clicks: number = 0;
      const index: number = (start + clicks) % 4;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      expect(index).assertEqual(3);
      expect(names[index]).assertEqual('2.0X');
      expect(index >= 0 && index < 4).assertTrue();
      expect(names.length).assertEqual(4);
    })
  })
}
