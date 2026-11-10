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


export default function playbackSpeedExpandedTest() {
  describe('playbackSpeedExpandedTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0001
     * @tc.name      testExpPlaybackSpeed0001
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0001', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0002
     * @tc.name      testExpPlaybackSpeed0002
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0002', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0003
     * @tc.name      testExpPlaybackSpeed0003
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0003', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0004
     * @tc.name      testExpPlaybackSpeed0004
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0004', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0005
     * @tc.name      testExpPlaybackSpeed0005
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0005', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0006
     * @tc.name      testExpPlaybackSpeed0006
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0006', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0007
     * @tc.name      testExpPlaybackSpeed0007
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0007', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0008
     * @tc.name      testExpPlaybackSpeed0008
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0008', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0009
     * @tc.name      testExpPlaybackSpeed0009
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0009', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0010
     * @tc.name      testExpPlaybackSpeed0010
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0010', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0011
     * @tc.name      testExpPlaybackSpeed0011
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0011', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0012
     * @tc.name      testExpPlaybackSpeed0012
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0012', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0013
     * @tc.name      testExpPlaybackSpeed0013
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0013', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0014
     * @tc.name      testExpPlaybackSpeed0014
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0014', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0015
     * @tc.name      testExpPlaybackSpeed0015
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0015', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0016
     * @tc.name      testExpPlaybackSpeed0016
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0016', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0017
     * @tc.name      testExpPlaybackSpeed0017
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0017', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0018
     * @tc.name      testExpPlaybackSpeed0018
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0018', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0019
     * @tc.name      testExpPlaybackSpeed0019
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0019', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0020
     * @tc.name      testExpPlaybackSpeed0020
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0020', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0021
     * @tc.name      testExpPlaybackSpeed0021
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0021', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0022
     * @tc.name      testExpPlaybackSpeed0022
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0022', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0023
     * @tc.name      testExpPlaybackSpeed0023
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0023', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0024
     * @tc.name      testExpPlaybackSpeed0024
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0024', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0025
     * @tc.name      testExpPlaybackSpeed0025
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0025', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0026
     * @tc.name      testExpPlaybackSpeed0026
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0026', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0027
     * @tc.name      testExpPlaybackSpeed0027
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0027', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0028
     * @tc.name      testExpPlaybackSpeed0028
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0028', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0029
     * @tc.name      testExpPlaybackSpeed0029
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0029', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0030
     * @tc.name      testExpPlaybackSpeed0030
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0030', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0031
     * @tc.name      testExpPlaybackSpeed0031
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0031', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0032
     * @tc.name      testExpPlaybackSpeed0032
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0032', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0033
     * @tc.name      testExpPlaybackSpeed0033
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0033', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0034
     * @tc.name      testExpPlaybackSpeed0034
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0034', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0035
     * @tc.name      testExpPlaybackSpeed0035
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0035', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0036
     * @tc.name      testExpPlaybackSpeed0036
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0036', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0037
     * @tc.name      testExpPlaybackSpeed0037
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0037', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0038
     * @tc.name      testExpPlaybackSpeed0038
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0038', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0039
     * @tc.name      testExpPlaybackSpeed0039
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0039', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0040
     * @tc.name      testExpPlaybackSpeed0040
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0040', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0041
     * @tc.name      testExpPlaybackSpeed0041
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0041', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0042
     * @tc.name      testExpPlaybackSpeed0042
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0042', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0043
     * @tc.name      testExpPlaybackSpeed0043
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0043', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0044
     * @tc.name      testExpPlaybackSpeed0044
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0044', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0045
     * @tc.name      testExpPlaybackSpeed0045
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0045', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0046
     * @tc.name      testExpPlaybackSpeed0046
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0046', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0047
     * @tc.name      testExpPlaybackSpeed0047
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0047', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0048
     * @tc.name      testExpPlaybackSpeed0048
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0048', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0049
     * @tc.name      testExpPlaybackSpeed0049
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0049', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0050
     * @tc.name      testExpPlaybackSpeed0050
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0050', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0051
     * @tc.name      testExpPlaybackSpeed0051
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0051', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0052
     * @tc.name      testExpPlaybackSpeed0052
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0052', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0053
     * @tc.name      testExpPlaybackSpeed0053
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0053', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0054
     * @tc.name      testExpPlaybackSpeed0054
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0054', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0055
     * @tc.name      testExpPlaybackSpeed0055
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0055', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0056
     * @tc.name      testExpPlaybackSpeed0056
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0056', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0057
     * @tc.name      testExpPlaybackSpeed0057
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0057', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0058
     * @tc.name      testExpPlaybackSpeed0058
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0058', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0059
     * @tc.name      testExpPlaybackSpeed0059
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0059', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0060
     * @tc.name      testExpPlaybackSpeed0060
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0060', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0061
     * @tc.name      testExpPlaybackSpeed0061
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0061', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0062
     * @tc.name      testExpPlaybackSpeed0062
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0062', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0063
     * @tc.name      testExpPlaybackSpeed0063
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0063', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0064
     * @tc.name      testExpPlaybackSpeed0064
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0064', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0065
     * @tc.name      testExpPlaybackSpeed0065
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0065', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0066
     * @tc.name      testExpPlaybackSpeed0066
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0066', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0067
     * @tc.name      testExpPlaybackSpeed0067
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0067', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0068
     * @tc.name      testExpPlaybackSpeed0068
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0068', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0069
     * @tc.name      testExpPlaybackSpeed0069
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0069', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0070
     * @tc.name      testExpPlaybackSpeed0070
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0070', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0071
     * @tc.name      testExpPlaybackSpeed0071
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0071', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0072
     * @tc.name      testExpPlaybackSpeed0072
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0072', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0073
     * @tc.name      testExpPlaybackSpeed0073
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0073', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0074
     * @tc.name      testExpPlaybackSpeed0074
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0074', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0075
     * @tc.name      testExpPlaybackSpeed0075
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0075', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0076
     * @tc.name      testExpPlaybackSpeed0076
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0076', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0077
     * @tc.name      testExpPlaybackSpeed0077
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0077', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0078
     * @tc.name      testExpPlaybackSpeed0078
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0078', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0079
     * @tc.name      testExpPlaybackSpeed0079
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0079', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0080
     * @tc.name      testExpPlaybackSpeed0080
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0080', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0081
     * @tc.name      testExpPlaybackSpeed0081
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0081', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0082
     * @tc.name      testExpPlaybackSpeed0082
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0082', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0083
     * @tc.name      testExpPlaybackSpeed0083
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0083', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0084
     * @tc.name      testExpPlaybackSpeed0084
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0084', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0085
     * @tc.name      testExpPlaybackSpeed0085
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0085', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0086
     * @tc.name      testExpPlaybackSpeed0086
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0086', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0087
     * @tc.name      testExpPlaybackSpeed0087
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0087', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0088
     * @tc.name      testExpPlaybackSpeed0088
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0088', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0089
     * @tc.name      testExpPlaybackSpeed0089
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0089', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0090
     * @tc.name      testExpPlaybackSpeed0090
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0090', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0091
     * @tc.name      testExpPlaybackSpeed0091
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0091', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0092
     * @tc.name      testExpPlaybackSpeed0092
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0092', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0093
     * @tc.name      testExpPlaybackSpeed0093
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0093', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0094
     * @tc.name      testExpPlaybackSpeed0094
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0094', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0095
     * @tc.name      testExpPlaybackSpeed0095
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0095', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0096
     * @tc.name      testExpPlaybackSpeed0096
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0096', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0097
     * @tc.name      testExpPlaybackSpeed0097
     * @tc.desc      Speed index 0 maps to 1.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0097', 0, () => {
      const index: number = 0;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_00_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0098
     * @tc.name      testExpPlaybackSpeed0098
     * @tc.desc      Speed index 1 maps to 1.25X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0098', 0, () => {
      const index: number = 1;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.25X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_25_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0099
     * @tc.name      testExpPlaybackSpeed0099
     * @tc.desc      Speed index 2 maps to 1.75X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0099', 0, () => {
      const index: number = 2;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('1.75X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_1_75_X');
      expect(index).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SPD_0100
     * @tc.name      testExpPlaybackSpeed0100
     * @tc.desc      Speed index 3 maps to 2.0X.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpPlaybackSpeed0100', 0, () => {
      const index: number = 3;
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      const enumNames: string[] = ['SPEED_FORWARD_1_00_X', 'SPEED_FORWARD_1_25_X',
        'SPEED_FORWARD_1_75_X', 'SPEED_FORWARD_2_00_X'];
      expect(names.length).assertEqual(4);
      expect(names[index]).assertEqual('2.0X');
      expect(enumNames[index]).assertEqual('SPEED_FORWARD_2_00_X');
      expect(index).assertLargerOrEqual(0);
    })
  })
}
