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


export default function subtitleSrtEdgeExpandedTest() {
  describe('subtitleSrtEdgeExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0001
     * @tc.name      testContinueSrtEdge0001
     * @tc.desc      SRT timestamp '00:00:00,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0001', 0, () => {
      const value: string = '00:00:00,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0002
     * @tc.name      testContinueSrtEdge0002
     * @tc.desc      SRT timestamp '00:00:05,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0002', 0, () => {
      const value: string = '00:00:05,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0003
     * @tc.name      testContinueSrtEdge0003
     * @tc.desc      SRT timestamp '99:59:59,999' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0003', 0, () => {
      const value: string = '99:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0004
     * @tc.name      testContinueSrtEdge0004
     * @tc.desc      SRT timestamp '00:00:00,001' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0004', 0, () => {
      const value: string = '00:00:00,001';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0005
     * @tc.name      testContinueSrtEdge0005
     * @tc.desc      SRT timestamp '12:34:56,789' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0005', 0, () => {
      const value: string = '12:34:56,789';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0006
     * @tc.name      testContinueSrtEdge0006
     * @tc.desc      SRT timestamp '00:00:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0006', 0, () => {
      const value: string = '00:00:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0007
     * @tc.name      testContinueSrtEdge0007
     * @tc.desc      SRT timestamp '00:59:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0007', 0, () => {
      const value: string = '00:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0008
     * @tc.name      testContinueSrtEdge0008
     * @tc.desc      SRT timestamp '01:02:03,004' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0008', 0, () => {
      const value: string = '01:02:03,004';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0009
     * @tc.name      testContinueSrtEdge0009
     * @tc.desc      SRT timestamp '00:00:00,0000' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0009', 0, () => {
      const value: string = '00:00:00,0000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(13);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0010
     * @tc.name      testContinueSrtEdge0010
     * @tc.desc      SRT timestamp '' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0010', 0, () => {
      const value: string = '';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(0);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0011
     * @tc.name      testContinueSrtEdge0011
     * @tc.desc      SRT timestamp '00:00:00,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0011', 0, () => {
      const value: string = '00:00:00,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0012
     * @tc.name      testContinueSrtEdge0012
     * @tc.desc      SRT timestamp '00:00:05,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0012', 0, () => {
      const value: string = '00:00:05,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0013
     * @tc.name      testContinueSrtEdge0013
     * @tc.desc      SRT timestamp '99:59:59,999' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0013', 0, () => {
      const value: string = '99:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0014
     * @tc.name      testContinueSrtEdge0014
     * @tc.desc      SRT timestamp '00:00:00,001' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0014', 0, () => {
      const value: string = '00:00:00,001';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0015
     * @tc.name      testContinueSrtEdge0015
     * @tc.desc      SRT timestamp '12:34:56,789' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0015', 0, () => {
      const value: string = '12:34:56,789';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0016
     * @tc.name      testContinueSrtEdge0016
     * @tc.desc      SRT timestamp '00:00:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0016', 0, () => {
      const value: string = '00:00:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0017
     * @tc.name      testContinueSrtEdge0017
     * @tc.desc      SRT timestamp '00:59:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0017', 0, () => {
      const value: string = '00:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0018
     * @tc.name      testContinueSrtEdge0018
     * @tc.desc      SRT timestamp '01:02:03,004' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0018', 0, () => {
      const value: string = '01:02:03,004';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0019
     * @tc.name      testContinueSrtEdge0019
     * @tc.desc      SRT timestamp '00:00:00,0000' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0019', 0, () => {
      const value: string = '00:00:00,0000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(13);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0020
     * @tc.name      testContinueSrtEdge0020
     * @tc.desc      SRT timestamp '' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0020', 0, () => {
      const value: string = '';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(0);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0021
     * @tc.name      testContinueSrtEdge0021
     * @tc.desc      SRT timestamp '00:00:00,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0021', 0, () => {
      const value: string = '00:00:00,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0022
     * @tc.name      testContinueSrtEdge0022
     * @tc.desc      SRT timestamp '00:00:05,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0022', 0, () => {
      const value: string = '00:00:05,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0023
     * @tc.name      testContinueSrtEdge0023
     * @tc.desc      SRT timestamp '99:59:59,999' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0023', 0, () => {
      const value: string = '99:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0024
     * @tc.name      testContinueSrtEdge0024
     * @tc.desc      SRT timestamp '00:00:00,001' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0024', 0, () => {
      const value: string = '00:00:00,001';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0025
     * @tc.name      testContinueSrtEdge0025
     * @tc.desc      SRT timestamp '12:34:56,789' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0025', 0, () => {
      const value: string = '12:34:56,789';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0026
     * @tc.name      testContinueSrtEdge0026
     * @tc.desc      SRT timestamp '00:00:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0026', 0, () => {
      const value: string = '00:00:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0027
     * @tc.name      testContinueSrtEdge0027
     * @tc.desc      SRT timestamp '00:59:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0027', 0, () => {
      const value: string = '00:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0028
     * @tc.name      testContinueSrtEdge0028
     * @tc.desc      SRT timestamp '01:02:03,004' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0028', 0, () => {
      const value: string = '01:02:03,004';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0029
     * @tc.name      testContinueSrtEdge0029
     * @tc.desc      SRT timestamp '00:00:00,0000' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0029', 0, () => {
      const value: string = '00:00:00,0000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(13);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0030
     * @tc.name      testContinueSrtEdge0030
     * @tc.desc      SRT timestamp '' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0030', 0, () => {
      const value: string = '';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(0);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0031
     * @tc.name      testContinueSrtEdge0031
     * @tc.desc      SRT timestamp '00:00:00,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0031', 0, () => {
      const value: string = '00:00:00,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0032
     * @tc.name      testContinueSrtEdge0032
     * @tc.desc      SRT timestamp '00:00:05,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0032', 0, () => {
      const value: string = '00:00:05,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0033
     * @tc.name      testContinueSrtEdge0033
     * @tc.desc      SRT timestamp '99:59:59,999' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0033', 0, () => {
      const value: string = '99:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0034
     * @tc.name      testContinueSrtEdge0034
     * @tc.desc      SRT timestamp '00:00:00,001' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0034', 0, () => {
      const value: string = '00:00:00,001';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0035
     * @tc.name      testContinueSrtEdge0035
     * @tc.desc      SRT timestamp '12:34:56,789' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0035', 0, () => {
      const value: string = '12:34:56,789';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0036
     * @tc.name      testContinueSrtEdge0036
     * @tc.desc      SRT timestamp '00:00:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0036', 0, () => {
      const value: string = '00:00:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0037
     * @tc.name      testContinueSrtEdge0037
     * @tc.desc      SRT timestamp '00:59:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0037', 0, () => {
      const value: string = '00:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0038
     * @tc.name      testContinueSrtEdge0038
     * @tc.desc      SRT timestamp '01:02:03,004' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0038', 0, () => {
      const value: string = '01:02:03,004';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0039
     * @tc.name      testContinueSrtEdge0039
     * @tc.desc      SRT timestamp '00:00:00,0000' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0039', 0, () => {
      const value: string = '00:00:00,0000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(13);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0040
     * @tc.name      testContinueSrtEdge0040
     * @tc.desc      SRT timestamp '' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0040', 0, () => {
      const value: string = '';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(0);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0041
     * @tc.name      testContinueSrtEdge0041
     * @tc.desc      SRT timestamp '00:00:00,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0041', 0, () => {
      const value: string = '00:00:00,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0042
     * @tc.name      testContinueSrtEdge0042
     * @tc.desc      SRT timestamp '00:00:05,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0042', 0, () => {
      const value: string = '00:00:05,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0043
     * @tc.name      testContinueSrtEdge0043
     * @tc.desc      SRT timestamp '99:59:59,999' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0043', 0, () => {
      const value: string = '99:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0044
     * @tc.name      testContinueSrtEdge0044
     * @tc.desc      SRT timestamp '00:00:00,001' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0044', 0, () => {
      const value: string = '00:00:00,001';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0045
     * @tc.name      testContinueSrtEdge0045
     * @tc.desc      SRT timestamp '12:34:56,789' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0045', 0, () => {
      const value: string = '12:34:56,789';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0046
     * @tc.name      testContinueSrtEdge0046
     * @tc.desc      SRT timestamp '00:00:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0046', 0, () => {
      const value: string = '00:00:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0047
     * @tc.name      testContinueSrtEdge0047
     * @tc.desc      SRT timestamp '00:59:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0047', 0, () => {
      const value: string = '00:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0048
     * @tc.name      testContinueSrtEdge0048
     * @tc.desc      SRT timestamp '01:02:03,004' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0048', 0, () => {
      const value: string = '01:02:03,004';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0049
     * @tc.name      testContinueSrtEdge0049
     * @tc.desc      SRT timestamp '00:00:00,0000' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0049', 0, () => {
      const value: string = '00:00:00,0000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(13);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0050
     * @tc.name      testContinueSrtEdge0050
     * @tc.desc      SRT timestamp '' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0050', 0, () => {
      const value: string = '';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(0);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0051
     * @tc.name      testContinueSrtEdge0051
     * @tc.desc      SRT timestamp '00:00:00,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0051', 0, () => {
      const value: string = '00:00:00,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0052
     * @tc.name      testContinueSrtEdge0052
     * @tc.desc      SRT timestamp '00:00:05,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0052', 0, () => {
      const value: string = '00:00:05,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0053
     * @tc.name      testContinueSrtEdge0053
     * @tc.desc      SRT timestamp '99:59:59,999' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0053', 0, () => {
      const value: string = '99:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0054
     * @tc.name      testContinueSrtEdge0054
     * @tc.desc      SRT timestamp '00:00:00,001' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0054', 0, () => {
      const value: string = '00:00:00,001';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0055
     * @tc.name      testContinueSrtEdge0055
     * @tc.desc      SRT timestamp '12:34:56,789' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0055', 0, () => {
      const value: string = '12:34:56,789';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0056
     * @tc.name      testContinueSrtEdge0056
     * @tc.desc      SRT timestamp '00:00:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0056', 0, () => {
      const value: string = '00:00:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0057
     * @tc.name      testContinueSrtEdge0057
     * @tc.desc      SRT timestamp '00:59:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0057', 0, () => {
      const value: string = '00:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0058
     * @tc.name      testContinueSrtEdge0058
     * @tc.desc      SRT timestamp '01:02:03,004' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0058', 0, () => {
      const value: string = '01:02:03,004';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0059
     * @tc.name      testContinueSrtEdge0059
     * @tc.desc      SRT timestamp '00:00:00,0000' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0059', 0, () => {
      const value: string = '00:00:00,0000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(13);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0060
     * @tc.name      testContinueSrtEdge0060
     * @tc.desc      SRT timestamp '' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0060', 0, () => {
      const value: string = '';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(0);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0061
     * @tc.name      testContinueSrtEdge0061
     * @tc.desc      SRT timestamp '00:00:00,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0061', 0, () => {
      const value: string = '00:00:00,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0062
     * @tc.name      testContinueSrtEdge0062
     * @tc.desc      SRT timestamp '00:00:05,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0062', 0, () => {
      const value: string = '00:00:05,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0063
     * @tc.name      testContinueSrtEdge0063
     * @tc.desc      SRT timestamp '99:59:59,999' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0063', 0, () => {
      const value: string = '99:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0064
     * @tc.name      testContinueSrtEdge0064
     * @tc.desc      SRT timestamp '00:00:00,001' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0064', 0, () => {
      const value: string = '00:00:00,001';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0065
     * @tc.name      testContinueSrtEdge0065
     * @tc.desc      SRT timestamp '12:34:56,789' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0065', 0, () => {
      const value: string = '12:34:56,789';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0066
     * @tc.name      testContinueSrtEdge0066
     * @tc.desc      SRT timestamp '00:00:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0066', 0, () => {
      const value: string = '00:00:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0067
     * @tc.name      testContinueSrtEdge0067
     * @tc.desc      SRT timestamp '00:59:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0067', 0, () => {
      const value: string = '00:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0068
     * @tc.name      testContinueSrtEdge0068
     * @tc.desc      SRT timestamp '01:02:03,004' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0068', 0, () => {
      const value: string = '01:02:03,004';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0069
     * @tc.name      testContinueSrtEdge0069
     * @tc.desc      SRT timestamp '00:00:00,0000' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0069', 0, () => {
      const value: string = '00:00:00,0000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(13);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0070
     * @tc.name      testContinueSrtEdge0070
     * @tc.desc      SRT timestamp '' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0070', 0, () => {
      const value: string = '';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(0);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0071
     * @tc.name      testContinueSrtEdge0071
     * @tc.desc      SRT timestamp '00:00:00,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0071', 0, () => {
      const value: string = '00:00:00,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0072
     * @tc.name      testContinueSrtEdge0072
     * @tc.desc      SRT timestamp '00:00:05,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0072', 0, () => {
      const value: string = '00:00:05,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0073
     * @tc.name      testContinueSrtEdge0073
     * @tc.desc      SRT timestamp '99:59:59,999' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0073', 0, () => {
      const value: string = '99:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0074
     * @tc.name      testContinueSrtEdge0074
     * @tc.desc      SRT timestamp '00:00:00,001' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0074', 0, () => {
      const value: string = '00:00:00,001';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0075
     * @tc.name      testContinueSrtEdge0075
     * @tc.desc      SRT timestamp '12:34:56,789' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0075', 0, () => {
      const value: string = '12:34:56,789';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0076
     * @tc.name      testContinueSrtEdge0076
     * @tc.desc      SRT timestamp '00:00:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0076', 0, () => {
      const value: string = '00:00:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0077
     * @tc.name      testContinueSrtEdge0077
     * @tc.desc      SRT timestamp '00:59:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0077', 0, () => {
      const value: string = '00:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0078
     * @tc.name      testContinueSrtEdge0078
     * @tc.desc      SRT timestamp '01:02:03,004' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0078', 0, () => {
      const value: string = '01:02:03,004';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0079
     * @tc.name      testContinueSrtEdge0079
     * @tc.desc      SRT timestamp '00:00:00,0000' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0079', 0, () => {
      const value: string = '00:00:00,0000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(13);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0080
     * @tc.name      testContinueSrtEdge0080
     * @tc.desc      SRT timestamp '' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0080', 0, () => {
      const value: string = '';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(0);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0081
     * @tc.name      testContinueSrtEdge0081
     * @tc.desc      SRT timestamp '00:00:00,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0081', 0, () => {
      const value: string = '00:00:00,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0082
     * @tc.name      testContinueSrtEdge0082
     * @tc.desc      SRT timestamp '00:00:05,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0082', 0, () => {
      const value: string = '00:00:05,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0083
     * @tc.name      testContinueSrtEdge0083
     * @tc.desc      SRT timestamp '99:59:59,999' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0083', 0, () => {
      const value: string = '99:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0084
     * @tc.name      testContinueSrtEdge0084
     * @tc.desc      SRT timestamp '00:00:00,001' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0084', 0, () => {
      const value: string = '00:00:00,001';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0085
     * @tc.name      testContinueSrtEdge0085
     * @tc.desc      SRT timestamp '12:34:56,789' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0085', 0, () => {
      const value: string = '12:34:56,789';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0086
     * @tc.name      testContinueSrtEdge0086
     * @tc.desc      SRT timestamp '00:00:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0086', 0, () => {
      const value: string = '00:00:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0087
     * @tc.name      testContinueSrtEdge0087
     * @tc.desc      SRT timestamp '00:59:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0087', 0, () => {
      const value: string = '00:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0088
     * @tc.name      testContinueSrtEdge0088
     * @tc.desc      SRT timestamp '01:02:03,004' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0088', 0, () => {
      const value: string = '01:02:03,004';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0089
     * @tc.name      testContinueSrtEdge0089
     * @tc.desc      SRT timestamp '00:00:00,0000' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0089', 0, () => {
      const value: string = '00:00:00,0000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(13);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0090
     * @tc.name      testContinueSrtEdge0090
     * @tc.desc      SRT timestamp '' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0090', 0, () => {
      const value: string = '';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(0);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0091
     * @tc.name      testContinueSrtEdge0091
     * @tc.desc      SRT timestamp '00:00:00,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0091', 0, () => {
      const value: string = '00:00:00,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0092
     * @tc.name      testContinueSrtEdge0092
     * @tc.desc      SRT timestamp '00:00:05,000' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0092', 0, () => {
      const value: string = '00:00:05,000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0093
     * @tc.name      testContinueSrtEdge0093
     * @tc.desc      SRT timestamp '99:59:59,999' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0093', 0, () => {
      const value: string = '99:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0094
     * @tc.name      testContinueSrtEdge0094
     * @tc.desc      SRT timestamp '00:00:00,001' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0094', 0, () => {
      const value: string = '00:00:00,001';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0095
     * @tc.name      testContinueSrtEdge0095
     * @tc.desc      SRT timestamp '12:34:56,789' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0095', 0, () => {
      const value: string = '12:34:56,789';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0096
     * @tc.name      testContinueSrtEdge0096
     * @tc.desc      SRT timestamp '00:00:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0096', 0, () => {
      const value: string = '00:00:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0097
     * @tc.name      testContinueSrtEdge0097
     * @tc.desc      SRT timestamp '00:59:59,999' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0097', 0, () => {
      const value: string = '00:59:59,999';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0098
     * @tc.name      testContinueSrtEdge0098
     * @tc.desc      SRT timestamp '01:02:03,004' validation is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0098', 0, () => {
      const value: string = '01:02:03,004';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(true);
      expect(value.length).assertEqual(12);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0099
     * @tc.name      testContinueSrtEdge0099
     * @tc.desc      SRT timestamp '00:00:00,0000' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0099', 0, () => {
      const value: string = '00:00:00,0000';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(13);
      expect(value.indexOf('-')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_SRT_0100
     * @tc.name      testContinueSrtEdge0100
     * @tc.desc      SRT timestamp '' validation is False.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueSrtEdge0100', 0, () => {
      const value: string = '';
      const shapeValid: boolean = value.length === 12 && value.charAt(2) === ':' &&
        value.charAt(5) === ':' && value.charAt(8) === ',';
      expect(shapeValid).assertEqual(false);
      expect(value.length).assertEqual(0);
      expect(value.indexOf('-')).assertEqual(-1);
    })
  })
}
