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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaRoundTripMatrixPart3Test(): void {
  describe('MediaRoundTripMatrixPart3', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_18100
     * @tc.name      testRoundTrip0181
     * @tc.desc      Verify byte offset for 180 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0181 begin');
      const bytes: number = MediaTools.getOffsetFromTime(180);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 180) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0181 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_18200
     * @tc.name      testRoundTrip0182
     * @tc.desc      Verify byte offset for 181 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0182 begin');
      const bytes: number = MediaTools.getOffsetFromTime(181);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 181) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0182 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_18300
     * @tc.name      testRoundTrip0183
     * @tc.desc      Verify byte offset for 182 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0183 begin');
      const bytes: number = MediaTools.getOffsetFromTime(182);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 182) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0183 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_18400
     * @tc.name      testRoundTrip0184
     * @tc.desc      Verify byte offset for 183 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0184 begin');
      const bytes: number = MediaTools.getOffsetFromTime(183);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 183) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0184 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_18500
     * @tc.name      testRoundTrip0185
     * @tc.desc      Verify byte offset for 184 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0185 begin');
      const bytes: number = MediaTools.getOffsetFromTime(184);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 184) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0185 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_18600
     * @tc.name      testRoundTrip0186
     * @tc.desc      Verify byte offset for 185 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0186 begin');
      const bytes: number = MediaTools.getOffsetFromTime(185);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 185) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0186 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_18700
     * @tc.name      testRoundTrip0187
     * @tc.desc      Verify byte offset for 186 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0187 begin');
      const bytes: number = MediaTools.getOffsetFromTime(186);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 186) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0187 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_18800
     * @tc.name      testRoundTrip0188
     * @tc.desc      Verify byte offset for 187 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0188 begin');
      const bytes: number = MediaTools.getOffsetFromTime(187);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 187) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0188 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_18900
     * @tc.name      testRoundTrip0189
     * @tc.desc      Verify byte offset for 188 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0189 begin');
      const bytes: number = MediaTools.getOffsetFromTime(188);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 188) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0189 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_19000
     * @tc.name      testRoundTrip0190
     * @tc.desc      Verify byte offset for 189 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0190 begin');
      const bytes: number = MediaTools.getOffsetFromTime(189);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 189) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0190 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_19100
     * @tc.name      testRoundTrip0191
     * @tc.desc      Verify byte offset for 190 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0191 begin');
      const bytes: number = MediaTools.getOffsetFromTime(190);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 190) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0191 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_19200
     * @tc.name      testRoundTrip0192
     * @tc.desc      Verify byte offset for 191 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0192 begin');
      const bytes: number = MediaTools.getOffsetFromTime(191);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 191) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0192 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_19300
     * @tc.name      testRoundTrip0193
     * @tc.desc      Verify byte offset for 192 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0193 begin');
      const bytes: number = MediaTools.getOffsetFromTime(192);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 192) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0193 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_19400
     * @tc.name      testRoundTrip0194
     * @tc.desc      Verify byte offset for 193 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0194 begin');
      const bytes: number = MediaTools.getOffsetFromTime(193);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 193) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0194 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_19500
     * @tc.name      testRoundTrip0195
     * @tc.desc      Verify byte offset for 194 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0195 begin');
      const bytes: number = MediaTools.getOffsetFromTime(194);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 194) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0195 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_19600
     * @tc.name      testRoundTrip0196
     * @tc.desc      Verify byte offset for 195 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0196 begin');
      const bytes: number = MediaTools.getOffsetFromTime(195);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 195) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0196 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_19700
     * @tc.name      testRoundTrip0197
     * @tc.desc      Verify byte offset for 196 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0197 begin');
      const bytes: number = MediaTools.getOffsetFromTime(196);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 196) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0197 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_19800
     * @tc.name      testRoundTrip0198
     * @tc.desc      Verify byte offset for 197 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0198 begin');
      const bytes: number = MediaTools.getOffsetFromTime(197);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 197) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0198 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_19900
     * @tc.name      testRoundTrip0199
     * @tc.desc      Verify byte offset for 198 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0199 begin');
      const bytes: number = MediaTools.getOffsetFromTime(198);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 198) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0199 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_20000
     * @tc.name      testRoundTrip0200
     * @tc.desc      Verify byte offset for 199 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0200 begin');
      const bytes: number = MediaTools.getOffsetFromTime(199);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 199) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0200 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_20100
     * @tc.name      testRoundTrip0201
     * @tc.desc      Verify byte offset for 200 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0201 begin');
      const bytes: number = MediaTools.getOffsetFromTime(200);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 200) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0201 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_20200
     * @tc.name      testRoundTrip0202
     * @tc.desc      Verify byte offset for 201 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0202 begin');
      const bytes: number = MediaTools.getOffsetFromTime(201);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 201) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0202 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_20300
     * @tc.name      testRoundTrip0203
     * @tc.desc      Verify byte offset for 202 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0203 begin');
      const bytes: number = MediaTools.getOffsetFromTime(202);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 202) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0203 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_20400
     * @tc.name      testRoundTrip0204
     * @tc.desc      Verify byte offset for 203 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0204 begin');
      const bytes: number = MediaTools.getOffsetFromTime(203);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 203) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0204 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_20500
     * @tc.name      testRoundTrip0205
     * @tc.desc      Verify byte offset for 204 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0205 begin');
      const bytes: number = MediaTools.getOffsetFromTime(204);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 204) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0205 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_20600
     * @tc.name      testRoundTrip0206
     * @tc.desc      Verify byte offset for 205 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0206 begin');
      const bytes: number = MediaTools.getOffsetFromTime(205);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 205) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0206 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_20700
     * @tc.name      testRoundTrip0207
     * @tc.desc      Verify byte offset for 206 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0207 begin');
      const bytes: number = MediaTools.getOffsetFromTime(206);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 206) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0207 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_20800
     * @tc.name      testRoundTrip0208
     * @tc.desc      Verify byte offset for 207 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0208 begin');
      const bytes: number = MediaTools.getOffsetFromTime(207);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 207) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0208 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_20900
     * @tc.name      testRoundTrip0209
     * @tc.desc      Verify byte offset for 208 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0209 begin');
      const bytes: number = MediaTools.getOffsetFromTime(208);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 208) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0209 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_21000
     * @tc.name      testRoundTrip0210
     * @tc.desc      Verify byte offset for 209 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0210 begin');
      const bytes: number = MediaTools.getOffsetFromTime(209);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 209) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0210 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_21100
     * @tc.name      testRoundTrip0211
     * @tc.desc      Verify byte offset for 210 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0211 begin');
      const bytes: number = MediaTools.getOffsetFromTime(210);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 210) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0211 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_21200
     * @tc.name      testRoundTrip0212
     * @tc.desc      Verify byte offset for 211 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0212 begin');
      const bytes: number = MediaTools.getOffsetFromTime(211);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 211) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0212 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_21300
     * @tc.name      testRoundTrip0213
     * @tc.desc      Verify byte offset for 212 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0213 begin');
      const bytes: number = MediaTools.getOffsetFromTime(212);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 212) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0213 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_21400
     * @tc.name      testRoundTrip0214
     * @tc.desc      Verify byte offset for 213 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0214 begin');
      const bytes: number = MediaTools.getOffsetFromTime(213);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 213) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0214 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_21500
     * @tc.name      testRoundTrip0215
     * @tc.desc      Verify byte offset for 214 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0215 begin');
      const bytes: number = MediaTools.getOffsetFromTime(214);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 214) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0215 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_21600
     * @tc.name      testRoundTrip0216
     * @tc.desc      Verify byte offset for 215 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0216 begin');
      const bytes: number = MediaTools.getOffsetFromTime(215);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 215) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0216 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_21700
     * @tc.name      testRoundTrip0217
     * @tc.desc      Verify byte offset for 216 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0217 begin');
      const bytes: number = MediaTools.getOffsetFromTime(216);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 216) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0217 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_21800
     * @tc.name      testRoundTrip0218
     * @tc.desc      Verify byte offset for 217 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0218 begin');
      const bytes: number = MediaTools.getOffsetFromTime(217);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 217) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0218 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_21900
     * @tc.name      testRoundTrip0219
     * @tc.desc      Verify byte offset for 218 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0219 begin');
      const bytes: number = MediaTools.getOffsetFromTime(218);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 218) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0219 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_22000
     * @tc.name      testRoundTrip0220
     * @tc.desc      Verify byte offset for 219 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0220 begin');
      const bytes: number = MediaTools.getOffsetFromTime(219);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 219) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0220 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_22100
     * @tc.name      testRoundTrip0221
     * @tc.desc      Verify byte offset for 220 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0221 begin');
      const bytes: number = MediaTools.getOffsetFromTime(220);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 220) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0221 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_22200
     * @tc.name      testRoundTrip0222
     * @tc.desc      Verify byte offset for 221 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0222 begin');
      const bytes: number = MediaTools.getOffsetFromTime(221);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 221) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0222 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_22300
     * @tc.name      testRoundTrip0223
     * @tc.desc      Verify byte offset for 222 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0223 begin');
      const bytes: number = MediaTools.getOffsetFromTime(222);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 222) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0223 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_22400
     * @tc.name      testRoundTrip0224
     * @tc.desc      Verify byte offset for 223 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0224 begin');
      const bytes: number = MediaTools.getOffsetFromTime(223);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 223) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0224 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_22500
     * @tc.name      testRoundTrip0225
     * @tc.desc      Verify byte offset for 224 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0225 begin');
      const bytes: number = MediaTools.getOffsetFromTime(224);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 224) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0225 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_22600
     * @tc.name      testRoundTrip0226
     * @tc.desc      Verify byte offset for 225 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0226 begin');
      const bytes: number = MediaTools.getOffsetFromTime(225);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 225) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0226 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_22700
     * @tc.name      testRoundTrip0227
     * @tc.desc      Verify byte offset for 226 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0227 begin');
      const bytes: number = MediaTools.getOffsetFromTime(226);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 226) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0227 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_22800
     * @tc.name      testRoundTrip0228
     * @tc.desc      Verify byte offset for 227 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0228 begin');
      const bytes: number = MediaTools.getOffsetFromTime(227);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 227) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0228 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_22900
     * @tc.name      testRoundTrip0229
     * @tc.desc      Verify byte offset for 228 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0229 begin');
      const bytes: number = MediaTools.getOffsetFromTime(228);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 228) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0229 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_23000
     * @tc.name      testRoundTrip0230
     * @tc.desc      Verify byte offset for 229 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0230 begin');
      const bytes: number = MediaTools.getOffsetFromTime(229);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 229) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0230 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_23100
     * @tc.name      testRoundTrip0231
     * @tc.desc      Verify byte offset for 230 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0231 begin');
      const bytes: number = MediaTools.getOffsetFromTime(230);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 230) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0231 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_23200
     * @tc.name      testRoundTrip0232
     * @tc.desc      Verify byte offset for 231 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0232 begin');
      const bytes: number = MediaTools.getOffsetFromTime(231);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 231) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0232 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_23300
     * @tc.name      testRoundTrip0233
     * @tc.desc      Verify byte offset for 232 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0233 begin');
      const bytes: number = MediaTools.getOffsetFromTime(232);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 232) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0233 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_23400
     * @tc.name      testRoundTrip0234
     * @tc.desc      Verify byte offset for 233 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0234 begin');
      const bytes: number = MediaTools.getOffsetFromTime(233);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 233) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0234 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_23500
     * @tc.name      testRoundTrip0235
     * @tc.desc      Verify byte offset for 234 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0235 begin');
      const bytes: number = MediaTools.getOffsetFromTime(234);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 234) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0235 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_23600
     * @tc.name      testRoundTrip0236
     * @tc.desc      Verify byte offset for 235 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0236 begin');
      const bytes: number = MediaTools.getOffsetFromTime(235);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 235) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0236 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_23700
     * @tc.name      testRoundTrip0237
     * @tc.desc      Verify byte offset for 236 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0237 begin');
      const bytes: number = MediaTools.getOffsetFromTime(236);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 236) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0237 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_23800
     * @tc.name      testRoundTrip0238
     * @tc.desc      Verify byte offset for 237 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0238 begin');
      const bytes: number = MediaTools.getOffsetFromTime(237);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 237) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0238 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_23900
     * @tc.name      testRoundTrip0239
     * @tc.desc      Verify byte offset for 238 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0239 begin');
      const bytes: number = MediaTools.getOffsetFromTime(238);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 238) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0239 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_24000
     * @tc.name      testRoundTrip0240
     * @tc.desc      Verify byte offset for 239 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0240 begin');
      const bytes: number = MediaTools.getOffsetFromTime(239);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 239) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0240 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_24100
     * @tc.name      testRoundTrip0241
     * @tc.desc      Verify byte offset for 240 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0241 begin');
      const bytes: number = MediaTools.getOffsetFromTime(240);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 240) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0241 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_24200
     * @tc.name      testRoundTrip0242
     * @tc.desc      Verify byte offset for 241 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0242 begin');
      const bytes: number = MediaTools.getOffsetFromTime(241);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 241) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0242 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_24300
     * @tc.name      testRoundTrip0243
     * @tc.desc      Verify byte offset for 242 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0243 begin');
      const bytes: number = MediaTools.getOffsetFromTime(242);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 242) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0243 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_24400
     * @tc.name      testRoundTrip0244
     * @tc.desc      Verify byte offset for 243 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0244 begin');
      const bytes: number = MediaTools.getOffsetFromTime(243);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 243) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0244 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_24500
     * @tc.name      testRoundTrip0245
     * @tc.desc      Verify byte offset for 244 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0245 begin');
      const bytes: number = MediaTools.getOffsetFromTime(244);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 244) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0245 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_24600
     * @tc.name      testRoundTrip0246
     * @tc.desc      Verify byte offset for 245 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0246 begin');
      const bytes: number = MediaTools.getOffsetFromTime(245);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 245) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0246 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_24700
     * @tc.name      testRoundTrip0247
     * @tc.desc      Verify byte offset for 246 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0247 begin');
      const bytes: number = MediaTools.getOffsetFromTime(246);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 246) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0247 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_24800
     * @tc.name      testRoundTrip0248
     * @tc.desc      Verify byte offset for 247 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0248 begin');
      const bytes: number = MediaTools.getOffsetFromTime(247);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 247) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0248 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_24900
     * @tc.name      testRoundTrip0249
     * @tc.desc      Verify byte offset for 248 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0249 begin');
      const bytes: number = MediaTools.getOffsetFromTime(248);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 248) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0249 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_ROUNDTRIPP3_25000
     * @tc.name      testRoundTrip0250
     * @tc.desc      Verify byte offset for 249 ms converts back to the same duration.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRoundTrip0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0250 begin');
      const bytes: number = MediaTools.getOffsetFromTime(249);
      const back: number = MediaTools.getMsFromByteLength(bytes);
      expect(Math.abs(back - 249) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRoundTrip0250 end');
    })

  })
}
