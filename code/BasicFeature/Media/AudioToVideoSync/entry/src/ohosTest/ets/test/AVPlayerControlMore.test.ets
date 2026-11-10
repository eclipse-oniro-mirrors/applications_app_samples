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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';

export default function avPlayerControlMoreTest() {
  describe('avPlayerControlMoreTest', () => {
    /**
     * @tc.number    SUB_AVS_MORE_PC_0001
     * @tc.name      testMorePlayerControl0001
     * @tc.desc      Playback at 0.5x from 0ms keeps 600ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 600;
      const speed: number = 0.5;
      const target: number = 0;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(600);
      expect(effective).assertEqual(1200.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0002
     * @tc.name      testMorePlayerControl0002
     * @tc.desc      Playback at 1x from 29ms keeps 584ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 613;
      const speed: number = 1;
      const target: number = 29;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(584);
      expect(effective).assertEqual(613.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0003
     * @tc.name      testMorePlayerControl0003
     * @tc.desc      Playback at 1.5x from 58ms keeps 568ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 626;
      const speed: number = 1.5;
      const target: number = 58;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(568);
      expect(effective).assertEqual(417.3333333333333);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0004
     * @tc.name      testMorePlayerControl0004
     * @tc.desc      Playback at 2x from 87ms keeps 552ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 639;
      const speed: number = 2;
      const target: number = 87;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(552);
      expect(effective).assertEqual(319.5);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0005
     * @tc.name      testMorePlayerControl0005
     * @tc.desc      Playback at 3x from 116ms keeps 536ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 652;
      const speed: number = 3;
      const target: number = 116;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(536);
      expect(effective).assertEqual(217.33333333333334);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0006
     * @tc.name      testMorePlayerControl0006
     * @tc.desc      Playback at 0.5x from 145ms keeps 520ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 665;
      const speed: number = 0.5;
      const target: number = 145;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(520);
      expect(effective).assertEqual(1330.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0007
     * @tc.name      testMorePlayerControl0007
     * @tc.desc      Playback at 1x from 174ms keeps 504ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 678;
      const speed: number = 1;
      const target: number = 174;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(504);
      expect(effective).assertEqual(678.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0008
     * @tc.name      testMorePlayerControl0008
     * @tc.desc      Playback at 1.5x from 203ms keeps 488ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 691;
      const speed: number = 1.5;
      const target: number = 203;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(488);
      expect(effective).assertEqual(460.6666666666667);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0009
     * @tc.name      testMorePlayerControl0009
     * @tc.desc      Playback at 2x from 232ms keeps 472ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 704;
      const speed: number = 2;
      const target: number = 232;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(472);
      expect(effective).assertEqual(352.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0010
     * @tc.name      testMorePlayerControl0010
     * @tc.desc      Playback at 3x from 261ms keeps 456ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 717;
      const speed: number = 3;
      const target: number = 261;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(456);
      expect(effective).assertEqual(239.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0011
     * @tc.name      testMorePlayerControl0011
     * @tc.desc      Playback at 0.5x from 290ms keeps 440ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 730;
      const speed: number = 0.5;
      const target: number = 290;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(440);
      expect(effective).assertEqual(1460.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0012
     * @tc.name      testMorePlayerControl0012
     * @tc.desc      Playback at 1x from 319ms keeps 424ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 743;
      const speed: number = 1;
      const target: number = 319;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(424);
      expect(effective).assertEqual(743.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0013
     * @tc.name      testMorePlayerControl0013
     * @tc.desc      Playback at 1.5x from 348ms keeps 408ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 756;
      const speed: number = 1.5;
      const target: number = 348;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(408);
      expect(effective).assertEqual(504.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0014
     * @tc.name      testMorePlayerControl0014
     * @tc.desc      Playback at 2x from 377ms keeps 392ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 769;
      const speed: number = 2;
      const target: number = 377;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(392);
      expect(effective).assertEqual(384.5);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0015
     * @tc.name      testMorePlayerControl0015
     * @tc.desc      Playback at 3x from 406ms keeps 376ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 782;
      const speed: number = 3;
      const target: number = 406;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(376);
      expect(effective).assertEqual(260.6666666666667);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0016
     * @tc.name      testMorePlayerControl0016
     * @tc.desc      Playback at 0.5x from 435ms keeps 360ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 795;
      const speed: number = 0.5;
      const target: number = 435;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(360);
      expect(effective).assertEqual(1590.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0017
     * @tc.name      testMorePlayerControl0017
     * @tc.desc      Playback at 1x from 464ms keeps 344ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 808;
      const speed: number = 1;
      const target: number = 464;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(344);
      expect(effective).assertEqual(808.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0018
     * @tc.name      testMorePlayerControl0018
     * @tc.desc      Playback at 1.5x from 493ms keeps 328ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 821;
      const speed: number = 1.5;
      const target: number = 493;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(328);
      expect(effective).assertEqual(547.3333333333334);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0019
     * @tc.name      testMorePlayerControl0019
     * @tc.desc      Playback at 2x from 522ms keeps 312ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 834;
      const speed: number = 2;
      const target: number = 522;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(312);
      expect(effective).assertEqual(417.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0020
     * @tc.name      testMorePlayerControl0020
     * @tc.desc      Playback at 3x from 551ms keeps 296ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 847;
      const speed: number = 3;
      const target: number = 551;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(296);
      expect(effective).assertEqual(282.3333333333333);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0021
     * @tc.name      testMorePlayerControl0021
     * @tc.desc      Playback at 0.5x from 580ms keeps 280ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 860;
      const speed: number = 0.5;
      const target: number = 580;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(280);
      expect(effective).assertEqual(1720.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0022
     * @tc.name      testMorePlayerControl0022
     * @tc.desc      Playback at 1x from 609ms keeps 264ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 873;
      const speed: number = 1;
      const target: number = 609;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(264);
      expect(effective).assertEqual(873.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0023
     * @tc.name      testMorePlayerControl0023
     * @tc.desc      Playback at 1.5x from 638ms keeps 248ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 886;
      const speed: number = 1.5;
      const target: number = 638;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(248);
      expect(effective).assertEqual(590.6666666666666);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0024
     * @tc.name      testMorePlayerControl0024
     * @tc.desc      Playback at 2x from 667ms keeps 232ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 899;
      const speed: number = 2;
      const target: number = 667;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(232);
      expect(effective).assertEqual(449.5);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0025
     * @tc.name      testMorePlayerControl0025
     * @tc.desc      Playback at 3x from 696ms keeps 216ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 912;
      const speed: number = 3;
      const target: number = 696;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(216);
      expect(effective).assertEqual(304.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0026
     * @tc.name      testMorePlayerControl0026
     * @tc.desc      Playback at 0.5x from 725ms keeps 200ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 925;
      const speed: number = 0.5;
      const target: number = 725;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(200);
      expect(effective).assertEqual(1850.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0027
     * @tc.name      testMorePlayerControl0027
     * @tc.desc      Playback at 1x from 754ms keeps 184ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 938;
      const speed: number = 1;
      const target: number = 754;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(184);
      expect(effective).assertEqual(938.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0028
     * @tc.name      testMorePlayerControl0028
     * @tc.desc      Playback at 1.5x from 783ms keeps 168ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 951;
      const speed: number = 1.5;
      const target: number = 783;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(168);
      expect(effective).assertEqual(634.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0029
     * @tc.name      testMorePlayerControl0029
     * @tc.desc      Playback at 2x from 812ms keeps 152ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 964;
      const speed: number = 2;
      const target: number = 812;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(152);
      expect(effective).assertEqual(482.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0030
     * @tc.name      testMorePlayerControl0030
     * @tc.desc      Playback at 3x from 841ms keeps 136ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 977;
      const speed: number = 3;
      const target: number = 841;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(136);
      expect(effective).assertEqual(325.6666666666667);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0031
     * @tc.name      testMorePlayerControl0031
     * @tc.desc      Playback at 0.5x from 870ms keeps 120ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 990;
      const speed: number = 0.5;
      const target: number = 870;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(120);
      expect(effective).assertEqual(1980.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0032
     * @tc.name      testMorePlayerControl0032
     * @tc.desc      Playback at 1x from 899ms keeps 104ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1003;
      const speed: number = 1;
      const target: number = 899;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(104);
      expect(effective).assertEqual(1003.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0033
     * @tc.name      testMorePlayerControl0033
     * @tc.desc      Playback at 1.5x from 928ms keeps 88ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1016;
      const speed: number = 1.5;
      const target: number = 928;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(88);
      expect(effective).assertEqual(677.3333333333334);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0034
     * @tc.name      testMorePlayerControl0034
     * @tc.desc      Playback at 2x from 957ms keeps 72ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1029;
      const speed: number = 2;
      const target: number = 957;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(72);
      expect(effective).assertEqual(514.5);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0035
     * @tc.name      testMorePlayerControl0035
     * @tc.desc      Playback at 3x from 986ms keeps 56ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1042;
      const speed: number = 3;
      const target: number = 986;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(56);
      expect(effective).assertEqual(347.3333333333333);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0036
     * @tc.name      testMorePlayerControl0036
     * @tc.desc      Playback at 0.5x from 1015ms keeps 40ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1055;
      const speed: number = 0.5;
      const target: number = 1015;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(40);
      expect(effective).assertEqual(2110.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0037
     * @tc.name      testMorePlayerControl0037
     * @tc.desc      Playback at 1x from 1044ms keeps 24ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1068;
      const speed: number = 1;
      const target: number = 1044;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(24);
      expect(effective).assertEqual(1068.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0038
     * @tc.name      testMorePlayerControl0038
     * @tc.desc      Playback at 1.5x from 1073ms keeps 8ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1081;
      const speed: number = 1.5;
      const target: number = 1073;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(8);
      expect(effective).assertEqual(720.6666666666666);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0039
     * @tc.name      testMorePlayerControl0039
     * @tc.desc      Playback at 2x from 8ms keeps 1086ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1094;
      const speed: number = 2;
      const target: number = 8;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1086);
      expect(effective).assertEqual(547.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0040
     * @tc.name      testMorePlayerControl0040
     * @tc.desc      Playback at 3x from 24ms keeps 1083ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1107;
      const speed: number = 3;
      const target: number = 24;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1083);
      expect(effective).assertEqual(369.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0041
     * @tc.name      testMorePlayerControl0041
     * @tc.desc      Playback at 0.5x from 40ms keeps 1080ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1120;
      const speed: number = 0.5;
      const target: number = 40;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1080);
      expect(effective).assertEqual(2240.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0042
     * @tc.name      testMorePlayerControl0042
     * @tc.desc      Playback at 1x from 56ms keeps 1077ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1133;
      const speed: number = 1;
      const target: number = 56;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1077);
      expect(effective).assertEqual(1133.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0043
     * @tc.name      testMorePlayerControl0043
     * @tc.desc      Playback at 1.5x from 72ms keeps 1074ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1146;
      const speed: number = 1.5;
      const target: number = 72;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1074);
      expect(effective).assertEqual(764.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0044
     * @tc.name      testMorePlayerControl0044
     * @tc.desc      Playback at 2x from 88ms keeps 1071ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1159;
      const speed: number = 2;
      const target: number = 88;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1071);
      expect(effective).assertEqual(579.5);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0045
     * @tc.name      testMorePlayerControl0045
     * @tc.desc      Playback at 3x from 104ms keeps 1068ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1172;
      const speed: number = 3;
      const target: number = 104;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1068);
      expect(effective).assertEqual(390.6666666666667);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0046
     * @tc.name      testMorePlayerControl0046
     * @tc.desc      Playback at 0.5x from 120ms keeps 1065ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1185;
      const speed: number = 0.5;
      const target: number = 120;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1065);
      expect(effective).assertEqual(2370.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0047
     * @tc.name      testMorePlayerControl0047
     * @tc.desc      Playback at 1x from 136ms keeps 1062ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1198;
      const speed: number = 1;
      const target: number = 136;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1062);
      expect(effective).assertEqual(1198.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0048
     * @tc.name      testMorePlayerControl0048
     * @tc.desc      Playback at 1.5x from 152ms keeps 1059ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1211;
      const speed: number = 1.5;
      const target: number = 152;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1059);
      expect(effective).assertEqual(807.3333333333334);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0049
     * @tc.name      testMorePlayerControl0049
     * @tc.desc      Playback at 2x from 168ms keeps 1056ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1224;
      const speed: number = 2;
      const target: number = 168;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1056);
      expect(effective).assertEqual(612.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0050
     * @tc.name      testMorePlayerControl0050
     * @tc.desc      Playback at 3x from 184ms keeps 1053ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1237;
      const speed: number = 3;
      const target: number = 184;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1053);
      expect(effective).assertEqual(412.3333333333333);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0051
     * @tc.name      testMorePlayerControl0051
     * @tc.desc      Playback at 0.5x from 200ms keeps 1050ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1250;
      const speed: number = 0.5;
      const target: number = 200;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1050);
      expect(effective).assertEqual(2500.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0052
     * @tc.name      testMorePlayerControl0052
     * @tc.desc      Playback at 1x from 216ms keeps 1047ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1263;
      const speed: number = 1;
      const target: number = 216;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1047);
      expect(effective).assertEqual(1263.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0053
     * @tc.name      testMorePlayerControl0053
     * @tc.desc      Playback at 1.5x from 232ms keeps 1044ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1276;
      const speed: number = 1.5;
      const target: number = 232;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1044);
      expect(effective).assertEqual(850.6666666666666);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0054
     * @tc.name      testMorePlayerControl0054
     * @tc.desc      Playback at 2x from 248ms keeps 1041ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1289;
      const speed: number = 2;
      const target: number = 248;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1041);
      expect(effective).assertEqual(644.5);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0055
     * @tc.name      testMorePlayerControl0055
     * @tc.desc      Playback at 3x from 264ms keeps 1038ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1302;
      const speed: number = 3;
      const target: number = 264;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1038);
      expect(effective).assertEqual(434.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0056
     * @tc.name      testMorePlayerControl0056
     * @tc.desc      Playback at 0.5x from 280ms keeps 1035ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1315;
      const speed: number = 0.5;
      const target: number = 280;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1035);
      expect(effective).assertEqual(2630.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0057
     * @tc.name      testMorePlayerControl0057
     * @tc.desc      Playback at 1x from 296ms keeps 1032ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1328;
      const speed: number = 1;
      const target: number = 296;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1032);
      expect(effective).assertEqual(1328.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0058
     * @tc.name      testMorePlayerControl0058
     * @tc.desc      Playback at 1.5x from 312ms keeps 1029ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1341;
      const speed: number = 1.5;
      const target: number = 312;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1029);
      expect(effective).assertEqual(894.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0059
     * @tc.name      testMorePlayerControl0059
     * @tc.desc      Playback at 2x from 328ms keeps 1026ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1354;
      const speed: number = 2;
      const target: number = 328;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1026);
      expect(effective).assertEqual(677.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0060
     * @tc.name      testMorePlayerControl0060
     * @tc.desc      Playback at 3x from 344ms keeps 1023ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1367;
      const speed: number = 3;
      const target: number = 344;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1023);
      expect(effective).assertEqual(455.6666666666667);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0061
     * @tc.name      testMorePlayerControl0061
     * @tc.desc      Playback at 0.5x from 360ms keeps 1020ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1380;
      const speed: number = 0.5;
      const target: number = 360;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1020);
      expect(effective).assertEqual(2760.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0062
     * @tc.name      testMorePlayerControl0062
     * @tc.desc      Playback at 1x from 376ms keeps 1017ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1393;
      const speed: number = 1;
      const target: number = 376;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1017);
      expect(effective).assertEqual(1393.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0063
     * @tc.name      testMorePlayerControl0063
     * @tc.desc      Playback at 1.5x from 392ms keeps 1014ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1406;
      const speed: number = 1.5;
      const target: number = 392;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1014);
      expect(effective).assertEqual(937.3333333333334);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0064
     * @tc.name      testMorePlayerControl0064
     * @tc.desc      Playback at 2x from 408ms keeps 1011ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1419;
      const speed: number = 2;
      const target: number = 408;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1011);
      expect(effective).assertEqual(709.5);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0065
     * @tc.name      testMorePlayerControl0065
     * @tc.desc      Playback at 3x from 424ms keeps 1008ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1432;
      const speed: number = 3;
      const target: number = 424;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1008);
      expect(effective).assertEqual(477.3333333333333);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0066
     * @tc.name      testMorePlayerControl0066
     * @tc.desc      Playback at 0.5x from 440ms keeps 1005ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1445;
      const speed: number = 0.5;
      const target: number = 440;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1005);
      expect(effective).assertEqual(2890.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0067
     * @tc.name      testMorePlayerControl0067
     * @tc.desc      Playback at 1x from 456ms keeps 1002ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1458;
      const speed: number = 1;
      const target: number = 456;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(1002);
      expect(effective).assertEqual(1458.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0068
     * @tc.name      testMorePlayerControl0068
     * @tc.desc      Playback at 1.5x from 472ms keeps 999ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1471;
      const speed: number = 1.5;
      const target: number = 472;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(999);
      expect(effective).assertEqual(980.6666666666666);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0069
     * @tc.name      testMorePlayerControl0069
     * @tc.desc      Playback at 2x from 488ms keeps 996ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1484;
      const speed: number = 2;
      const target: number = 488;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(996);
      expect(effective).assertEqual(742.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0070
     * @tc.name      testMorePlayerControl0070
     * @tc.desc      Playback at 3x from 504ms keeps 993ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1497;
      const speed: number = 3;
      const target: number = 504;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(993);
      expect(effective).assertEqual(499.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0071
     * @tc.name      testMorePlayerControl0071
     * @tc.desc      Playback at 0.5x from 520ms keeps 990ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1510;
      const speed: number = 0.5;
      const target: number = 520;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(990);
      expect(effective).assertEqual(3020.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0072
     * @tc.name      testMorePlayerControl0072
     * @tc.desc      Playback at 1x from 536ms keeps 987ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1523;
      const speed: number = 1;
      const target: number = 536;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(987);
      expect(effective).assertEqual(1523.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0073
     * @tc.name      testMorePlayerControl0073
     * @tc.desc      Playback at 1.5x from 552ms keeps 984ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1536;
      const speed: number = 1.5;
      const target: number = 552;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(984);
      expect(effective).assertEqual(1024.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0074
     * @tc.name      testMorePlayerControl0074
     * @tc.desc      Playback at 2x from 568ms keeps 981ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1549;
      const speed: number = 2;
      const target: number = 568;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(981);
      expect(effective).assertEqual(774.5);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0075
     * @tc.name      testMorePlayerControl0075
     * @tc.desc      Playback at 3x from 584ms keeps 978ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1562;
      const speed: number = 3;
      const target: number = 584;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(978);
      expect(effective).assertEqual(520.6666666666666);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0076
     * @tc.name      testMorePlayerControl0076
     * @tc.desc      Playback at 0.5x from 600ms keeps 975ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1575;
      const speed: number = 0.5;
      const target: number = 600;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(975);
      expect(effective).assertEqual(3150.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0077
     * @tc.name      testMorePlayerControl0077
     * @tc.desc      Playback at 1x from 616ms keeps 972ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1588;
      const speed: number = 1;
      const target: number = 616;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(972);
      expect(effective).assertEqual(1588.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0078
     * @tc.name      testMorePlayerControl0078
     * @tc.desc      Playback at 1.5x from 632ms keeps 969ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1601;
      const speed: number = 1.5;
      const target: number = 632;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(969);
      expect(effective).assertEqual(1067.3333333333333);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0079
     * @tc.name      testMorePlayerControl0079
     * @tc.desc      Playback at 2x from 648ms keeps 966ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1614;
      const speed: number = 2;
      const target: number = 648;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(966);
      expect(effective).assertEqual(807.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0080
     * @tc.name      testMorePlayerControl0080
     * @tc.desc      Playback at 3x from 664ms keeps 963ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1627;
      const speed: number = 3;
      const target: number = 664;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(963);
      expect(effective).assertEqual(542.3333333333334);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0081
     * @tc.name      testMorePlayerControl0081
     * @tc.desc      Playback at 0.5x from 680ms keeps 960ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1640;
      const speed: number = 0.5;
      const target: number = 680;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(960);
      expect(effective).assertEqual(3280.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0082
     * @tc.name      testMorePlayerControl0082
     * @tc.desc      Playback at 1x from 696ms keeps 957ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1653;
      const speed: number = 1;
      const target: number = 696;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(957);
      expect(effective).assertEqual(1653.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0083
     * @tc.name      testMorePlayerControl0083
     * @tc.desc      Playback at 1.5x from 712ms keeps 954ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1666;
      const speed: number = 1.5;
      const target: number = 712;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(954);
      expect(effective).assertEqual(1110.6666666666667);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0084
     * @tc.name      testMorePlayerControl0084
     * @tc.desc      Playback at 2x from 728ms keeps 951ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1679;
      const speed: number = 2;
      const target: number = 728;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(951);
      expect(effective).assertEqual(839.5);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0085
     * @tc.name      testMorePlayerControl0085
     * @tc.desc      Playback at 3x from 744ms keeps 948ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1692;
      const speed: number = 3;
      const target: number = 744;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(948);
      expect(effective).assertEqual(564.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_PC_0086
     * @tc.name      testMorePlayerControl0086
     * @tc.desc      Playback at 0.5x from 760ms keeps 945ms remaining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlayerControl0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1705;
      const speed: number = 0.5;
      const target: number = 760;
      const remaining: number = duration - target;
      const effective: number = duration / speed;
      expect(remaining).assertEqual(945);
      expect(effective).assertEqual(3410.0);
      expect(remaining >= 0 && remaining <= duration).assertTrue();
      expect(speed > 0).assertTrue();
    })
  })
}
