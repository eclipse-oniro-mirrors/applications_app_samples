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


export default function nativeSeekContractExpandedTest() {
  describe('nativeSeekContractExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0001
     * @tc.name      testExpSeekMode0001
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 0ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0001', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 0;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0002
     * @tc.name      testExpSeekMode0002
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0002', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 250;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0003
     * @tc.name      testExpSeekMode0003
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0003', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 500;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0004
     * @tc.name      testExpSeekMode0004
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0004', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 750;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0005
     * @tc.name      testExpSeekMode0005
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 1000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0005', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 1000;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0006
     * @tc.name      testExpSeekMode0006
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 1250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0006', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 1250;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0007
     * @tc.name      testExpSeekMode0007
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 1500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0007', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 1500;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0008
     * @tc.name      testExpSeekMode0008
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 1750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0008', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 1750;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0009
     * @tc.name      testExpSeekMode0009
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 2000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0009', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 2000;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0010
     * @tc.name      testExpSeekMode0010
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 2250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0010', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 2250;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0011
     * @tc.name      testExpSeekMode0011
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 2500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0011', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 2500;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0012
     * @tc.name      testExpSeekMode0012
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 2750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0012', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 2750;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0013
     * @tc.name      testExpSeekMode0013
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 3000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0013', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 3000;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0014
     * @tc.name      testExpSeekMode0014
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 3250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0014', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 3250;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0015
     * @tc.name      testExpSeekMode0015
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 3500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0015', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 3500;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0016
     * @tc.name      testExpSeekMode0016
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 3750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0016', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 3750;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0017
     * @tc.name      testExpSeekMode0017
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 4000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0017', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 4000;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0018
     * @tc.name      testExpSeekMode0018
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 4250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0018', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 4250;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0019
     * @tc.name      testExpSeekMode0019
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 4500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0019', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 4500;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0020
     * @tc.name      testExpSeekMode0020
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 4750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0020', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 4750;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0021
     * @tc.name      testExpSeekMode0021
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 5000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0021', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 5000;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0022
     * @tc.name      testExpSeekMode0022
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 5250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0022', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 5250;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0023
     * @tc.name      testExpSeekMode0023
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 5500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0023', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 5500;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0024
     * @tc.name      testExpSeekMode0024
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 5750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0024', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 5750;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0025
     * @tc.name      testExpSeekMode0025
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 6000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0025', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 6000;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0026
     * @tc.name      testExpSeekMode0026
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 6250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0026', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 6250;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0027
     * @tc.name      testExpSeekMode0027
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 6500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0027', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 6500;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0028
     * @tc.name      testExpSeekMode0028
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 6750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0028', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 6750;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0029
     * @tc.name      testExpSeekMode0029
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 7000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0029', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 7000;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0030
     * @tc.name      testExpSeekMode0030
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 7250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0030', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 7250;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0031
     * @tc.name      testExpSeekMode0031
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 7500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0031', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 7500;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0032
     * @tc.name      testExpSeekMode0032
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 7750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0032', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 7750;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0033
     * @tc.name      testExpSeekMode0033
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 8000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0033', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 8000;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0034
     * @tc.name      testExpSeekMode0034
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 8250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0034', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 8250;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0035
     * @tc.name      testExpSeekMode0035
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 8500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0035', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 8500;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0036
     * @tc.name      testExpSeekMode0036
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 8750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0036', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 8750;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0037
     * @tc.name      testExpSeekMode0037
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 9000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0037', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 9000;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0038
     * @tc.name      testExpSeekMode0038
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 9250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0038', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 9250;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0039
     * @tc.name      testExpSeekMode0039
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 9500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0039', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 9500;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0040
     * @tc.name      testExpSeekMode0040
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 9750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0040', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 9750;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0041
     * @tc.name      testExpSeekMode0041
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 10000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0041', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 10000;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0042
     * @tc.name      testExpSeekMode0042
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 10250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0042', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 10250;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0043
     * @tc.name      testExpSeekMode0043
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 10500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0043', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 10500;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0044
     * @tc.name      testExpSeekMode0044
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 10750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0044', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 10750;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0045
     * @tc.name      testExpSeekMode0045
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 11000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0045', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 11000;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0046
     * @tc.name      testExpSeekMode0046
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 11250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0046', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 11250;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0047
     * @tc.name      testExpSeekMode0047
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 11500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0047', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 11500;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0048
     * @tc.name      testExpSeekMode0048
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 11750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0048', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 11750;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0049
     * @tc.name      testExpSeekMode0049
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 12000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0049', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 12000;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0050
     * @tc.name      testExpSeekMode0050
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 12250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0050', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 12250;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0051
     * @tc.name      testExpSeekMode0051
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 12500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0051', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 12500;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0052
     * @tc.name      testExpSeekMode0052
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 12750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0052', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 12750;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0053
     * @tc.name      testExpSeekMode0053
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 13000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0053', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 13000;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0054
     * @tc.name      testExpSeekMode0054
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 13250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0054', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 13250;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0055
     * @tc.name      testExpSeekMode0055
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 13500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0055', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 13500;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0056
     * @tc.name      testExpSeekMode0056
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 13750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0056', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 13750;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0057
     * @tc.name      testExpSeekMode0057
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 14000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0057', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 14000;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0058
     * @tc.name      testExpSeekMode0058
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 14250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0058', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 14250;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0059
     * @tc.name      testExpSeekMode0059
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 14500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0059', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 14500;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0060
     * @tc.name      testExpSeekMode0060
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 14750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0060', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 14750;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0061
     * @tc.name      testExpSeekMode0061
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 15000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0061', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 15000;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0062
     * @tc.name      testExpSeekMode0062
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 15250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0062', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 15250;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0063
     * @tc.name      testExpSeekMode0063
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 15500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0063', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 15500;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0064
     * @tc.name      testExpSeekMode0064
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 15750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0064', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 15750;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0065
     * @tc.name      testExpSeekMode0065
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 16000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0065', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 16000;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0066
     * @tc.name      testExpSeekMode0066
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 16250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0066', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 16250;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0067
     * @tc.name      testExpSeekMode0067
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 16500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0067', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 16500;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0068
     * @tc.name      testExpSeekMode0068
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 16750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0068', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 16750;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0069
     * @tc.name      testExpSeekMode0069
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 17000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0069', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 17000;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0070
     * @tc.name      testExpSeekMode0070
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 17250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0070', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 17250;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0071
     * @tc.name      testExpSeekMode0071
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 17500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0071', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 17500;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0072
     * @tc.name      testExpSeekMode0072
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 17750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0072', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 17750;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0073
     * @tc.name      testExpSeekMode0073
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 18000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0073', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 18000;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0074
     * @tc.name      testExpSeekMode0074
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 18250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0074', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 18250;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0075
     * @tc.name      testExpSeekMode0075
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 18500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0075', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 18500;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0076
     * @tc.name      testExpSeekMode0076
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 18750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0076', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 18750;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0077
     * @tc.name      testExpSeekMode0077
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 19000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0077', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 19000;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0078
     * @tc.name      testExpSeekMode0078
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 19250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0078', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 19250;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0079
     * @tc.name      testExpSeekMode0079
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 19500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0079', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 19500;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0080
     * @tc.name      testExpSeekMode0080
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 19750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0080', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 19750;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0081
     * @tc.name      testExpSeekMode0081
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 20000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0081', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 20000;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0082
     * @tc.name      testExpSeekMode0082
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 20250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0082', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 20250;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0083
     * @tc.name      testExpSeekMode0083
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 20500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0083', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 20500;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0084
     * @tc.name      testExpSeekMode0084
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 20750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0084', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 20750;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0085
     * @tc.name      testExpSeekMode0085
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 21000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0085', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 21000;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0086
     * @tc.name      testExpSeekMode0086
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 21250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0086', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 21250;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0087
     * @tc.name      testExpSeekMode0087
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 21500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0087', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 21500;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0088
     * @tc.name      testExpSeekMode0088
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 21750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0088', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 21750;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0089
     * @tc.name      testExpSeekMode0089
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 22000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0089', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 22000;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0090
     * @tc.name      testExpSeekMode0090
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 22250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0090', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 22250;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0091
     * @tc.name      testExpSeekMode0091
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 22500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0091', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 22500;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0092
     * @tc.name      testExpSeekMode0092
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 22750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0092', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 22750;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0093
     * @tc.name      testExpSeekMode0093
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 23000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0093', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 23000;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0094
     * @tc.name      testExpSeekMode0094
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 23250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0094', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 23250;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0095
     * @tc.name      testExpSeekMode0095
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 23500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0095', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 23500;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0096
     * @tc.name      testExpSeekMode0096
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 23750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0096', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 23750;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0097
     * @tc.name      testExpSeekMode0097
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 24000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0097', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 24000;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0098
     * @tc.name      testExpSeekMode0098
     * @tc.desc      Seek mode 1 maps to AV_SEEK_PREVIOUS_SYNC for 24250ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0098', 0, () => {
      const mode: number = 1;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 24250;
      expect(names[mode]).assertEqual('AV_SEEK_PREVIOUS_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0099
     * @tc.name      testExpSeekMode0099
     * @tc.desc      Seek mode 2 maps to AV_SEEK_CLOSEST for 24500ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0099', 0, () => {
      const mode: number = 2;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 24500;
      expect(names[mode]).assertEqual('AV_SEEK_CLOSEST');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_SEEK_0100
     * @tc.name      testExpSeekMode0100
     * @tc.desc      Seek mode 0 maps to AV_SEEK_NEXT_SYNC for 24750ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSeekMode0100', 0, () => {
      const mode: number = 0;
      const names: string[] = ['AV_SEEK_NEXT_SYNC', 'AV_SEEK_PREVIOUS_SYNC', 'AV_SEEK_CLOSEST'];
      const value: number = 24750;
      expect(names[mode]).assertEqual('AV_SEEK_NEXT_SYNC');
      expect(value).assertLargerOrEqual(0);
      expect(mode >= 0 && mode < names.length).assertTrue();
      expect(names.length).assertEqual(3);
    })
  })
}
