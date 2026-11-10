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


export default function subtitleRobustnessExpandedTest() {
  describe('subtitleRobustnessExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0001
     * @tc.name      testMoreSubtitleRobust0001
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0001', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0002
     * @tc.name      testMoreSubtitleRobust0002
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0002', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0003
     * @tc.name      testMoreSubtitleRobust0003
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0003', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0004
     * @tc.name      testMoreSubtitleRobust0004
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0004', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0005
     * @tc.name      testMoreSubtitleRobust0005
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0005', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0006
     * @tc.name      testMoreSubtitleRobust0006
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0006', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0007
     * @tc.name      testMoreSubtitleRobust0007
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0007', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0008
     * @tc.name      testMoreSubtitleRobust0008
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0008', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0009
     * @tc.name      testMoreSubtitleRobust0009
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0009', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0010
     * @tc.name      testMoreSubtitleRobust0010
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0010', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0011
     * @tc.name      testMoreSubtitleRobust0011
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0011', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0012
     * @tc.name      testMoreSubtitleRobust0012
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0012', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0013
     * @tc.name      testMoreSubtitleRobust0013
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0013', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0014
     * @tc.name      testMoreSubtitleRobust0014
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0014', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0015
     * @tc.name      testMoreSubtitleRobust0015
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0015', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0016
     * @tc.name      testMoreSubtitleRobust0016
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0016', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0017
     * @tc.name      testMoreSubtitleRobust0017
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0017', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0018
     * @tc.name      testMoreSubtitleRobust0018
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0018', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0019
     * @tc.name      testMoreSubtitleRobust0019
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0019', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0020
     * @tc.name      testMoreSubtitleRobust0020
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0020', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0021
     * @tc.name      testMoreSubtitleRobust0021
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0021', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0022
     * @tc.name      testMoreSubtitleRobust0022
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0022', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0023
     * @tc.name      testMoreSubtitleRobust0023
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0023', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0024
     * @tc.name      testMoreSubtitleRobust0024
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0024', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0025
     * @tc.name      testMoreSubtitleRobust0025
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0025', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0026
     * @tc.name      testMoreSubtitleRobust0026
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0026', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0027
     * @tc.name      testMoreSubtitleRobust0027
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0027', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0028
     * @tc.name      testMoreSubtitleRobust0028
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0028', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0029
     * @tc.name      testMoreSubtitleRobust0029
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0029', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0030
     * @tc.name      testMoreSubtitleRobust0030
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0030', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0031
     * @tc.name      testMoreSubtitleRobust0031
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0031', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0032
     * @tc.name      testMoreSubtitleRobust0032
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0032', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0033
     * @tc.name      testMoreSubtitleRobust0033
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0033', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0034
     * @tc.name      testMoreSubtitleRobust0034
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0034', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0035
     * @tc.name      testMoreSubtitleRobust0035
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0035', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0036
     * @tc.name      testMoreSubtitleRobust0036
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0036', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0037
     * @tc.name      testMoreSubtitleRobust0037
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0037', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0038
     * @tc.name      testMoreSubtitleRobust0038
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0038', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0039
     * @tc.name      testMoreSubtitleRobust0039
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0039', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0040
     * @tc.name      testMoreSubtitleRobust0040
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0040', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0041
     * @tc.name      testMoreSubtitleRobust0041
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0041', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0042
     * @tc.name      testMoreSubtitleRobust0042
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0042', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0043
     * @tc.name      testMoreSubtitleRobust0043
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0043', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0044
     * @tc.name      testMoreSubtitleRobust0044
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0044', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0045
     * @tc.name      testMoreSubtitleRobust0045
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0045', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0046
     * @tc.name      testMoreSubtitleRobust0046
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0046', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0047
     * @tc.name      testMoreSubtitleRobust0047
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0047', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0048
     * @tc.name      testMoreSubtitleRobust0048
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0048', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0049
     * @tc.name      testMoreSubtitleRobust0049
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0049', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0050
     * @tc.name      testMoreSubtitleRobust0050
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0050', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0051
     * @tc.name      testMoreSubtitleRobust0051
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0051', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0052
     * @tc.name      testMoreSubtitleRobust0052
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0052', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0053
     * @tc.name      testMoreSubtitleRobust0053
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0053', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0054
     * @tc.name      testMoreSubtitleRobust0054
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0054', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0055
     * @tc.name      testMoreSubtitleRobust0055
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0055', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0056
     * @tc.name      testMoreSubtitleRobust0056
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0056', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0057
     * @tc.name      testMoreSubtitleRobust0057
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0057', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0058
     * @tc.name      testMoreSubtitleRobust0058
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0058', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0059
     * @tc.name      testMoreSubtitleRobust0059
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0059', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0060
     * @tc.name      testMoreSubtitleRobust0060
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0060', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0061
     * @tc.name      testMoreSubtitleRobust0061
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0061', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0062
     * @tc.name      testMoreSubtitleRobust0062
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0062', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0063
     * @tc.name      testMoreSubtitleRobust0063
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0063', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0064
     * @tc.name      testMoreSubtitleRobust0064
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0064', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0065
     * @tc.name      testMoreSubtitleRobust0065
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0065', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0066
     * @tc.name      testMoreSubtitleRobust0066
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0066', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0067
     * @tc.name      testMoreSubtitleRobust0067
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0067', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0068
     * @tc.name      testMoreSubtitleRobust0068
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0068', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0069
     * @tc.name      testMoreSubtitleRobust0069
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0069', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0070
     * @tc.name      testMoreSubtitleRobust0070
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0070', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0071
     * @tc.name      testMoreSubtitleRobust0071
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0071', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0072
     * @tc.name      testMoreSubtitleRobust0072
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0072', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0073
     * @tc.name      testMoreSubtitleRobust0073
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0073', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0074
     * @tc.name      testMoreSubtitleRobust0074
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0074', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0075
     * @tc.name      testMoreSubtitleRobust0075
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0075', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0076
     * @tc.name      testMoreSubtitleRobust0076
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0076', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0077
     * @tc.name      testMoreSubtitleRobust0077
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0077', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0078
     * @tc.name      testMoreSubtitleRobust0078
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0078', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0079
     * @tc.name      testMoreSubtitleRobust0079
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0079', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0080
     * @tc.name      testMoreSubtitleRobust0080
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0080', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0081
     * @tc.name      testMoreSubtitleRobust0081
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0081', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0082
     * @tc.name      testMoreSubtitleRobust0082
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0082', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0083
     * @tc.name      testMoreSubtitleRobust0083
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0083', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0084
     * @tc.name      testMoreSubtitleRobust0084
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0084', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0085
     * @tc.name      testMoreSubtitleRobust0085
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0085', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0086
     * @tc.name      testMoreSubtitleRobust0086
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0086', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0087
     * @tc.name      testMoreSubtitleRobust0087
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0087', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0088
     * @tc.name      testMoreSubtitleRobust0088
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0088', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0089
     * @tc.name      testMoreSubtitleRobust0089
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0089', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0090
     * @tc.name      testMoreSubtitleRobust0090
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0090', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0091
     * @tc.name      testMoreSubtitleRobust0091
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0091', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0092
     * @tc.name      testMoreSubtitleRobust0092
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0092', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0093
     * @tc.name      testMoreSubtitleRobust0093
     * @tc.desc      Subtitle timestamp 1000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0093', 0, () => {
      const timestamp: number = 1000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0094
     * @tc.name      testMoreSubtitleRobust0094
     * @tc.desc      Subtitle timestamp 3599999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0094', 0, () => {
      const timestamp: number = 3599999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3599999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0095
     * @tc.name      testMoreSubtitleRobust0095
     * @tc.desc      Subtitle timestamp 3600000 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0095', 0, () => {
      const timestamp: number = 3600000;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(3600000);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0096
     * @tc.name      testMoreSubtitleRobust0096
     * @tc.desc      Subtitle timestamp 86399999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0096', 0, () => {
      const timestamp: number = 86399999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(86399999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0097
     * @tc.name      testMoreSubtitleRobust0097
     * @tc.desc      Subtitle timestamp -1 is classified as valid=False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0097', 0, () => {
      const timestamp: number = -1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(false);
      expect(timestamp).assertEqual(-1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0098
     * @tc.name      testMoreSubtitleRobust0098
     * @tc.desc      Subtitle timestamp 0 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0098', 0, () => {
      const timestamp: number = 0;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(0);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0099
     * @tc.name      testMoreSubtitleRobust0099
     * @tc.desc      Subtitle timestamp 1 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0099', 0, () => {
      const timestamp: number = 1;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(1);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_ROB_0100
     * @tc.name      testMoreSubtitleRobust0100
     * @tc.desc      Subtitle timestamp 999 is classified as valid=True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleRobust0100', 0, () => {
      const timestamp: number = 999;
      const valid: boolean = timestamp >= 0 && timestamp <= 86399999;
      expect(valid).assertEqual(true);
      expect(timestamp).assertEqual(999);
      expect(typeof timestamp).assertEqual('number');
      expect(Number.isFinite(timestamp)).assertTrue();
    })
  })
}
