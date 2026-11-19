/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

// @volume rule=BreakpointType<string> frozen triple -> GetValue selects exact frozen token basis=main-frozen cases=75
// Volume cases are driven by a frozen data table; the first rows are hand-tuned Anchor boundary cases.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_BPS2]';

export default function bpStrVol02Test() {
  describe('MultiColumnsBpStrVol02', () => {

    /**
     * @tc.name   testBpStrVol0226
     * @tc.number SUB_MC_BPG_0226
     * @tc.desc   Anchor: BreakpointType<string> preserves empty/unicode token per breakpoint key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0226 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('', 'md-empty', 'lg-empty');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md-empty');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg-empty');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0226 end');
    });

    /**
     * @tc.name   testBpStrVol0227
     * @tc.number SUB_MC_BPG_0227
     * @tc.desc   Anchor: BreakpointType<string> preserves empty/unicode token per breakpoint key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0227 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('unicode_日本_☑', 'tab_x', 'sp a c e');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('unicode_日本_☑');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('tab_x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('sp a c e');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0227 end');
    });

    /**
     * @tc.name   testBpStrVol0228
     * @tc.number SUB_MC_BPG_0228
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 228)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0228 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_228_a', 'md_228_b', 'lg_228_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_228_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_228_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_228_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0228 end');
    });

    /**
     * @tc.name   testBpStrVol0229
     * @tc.number SUB_MC_BPG_0229
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 229)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0229 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_229_a', 'md_229_b', 'lg_229_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_229_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_229_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_229_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0229 end');
    });

    /**
     * @tc.name   testBpStrVol0230
     * @tc.number SUB_MC_BPG_0230
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 230)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0230 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_230_a', 'md_230_b', 'lg_230_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_230_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_230_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_230_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0230 end');
    });

    /**
     * @tc.name   testBpStrVol0231
     * @tc.number SUB_MC_BPG_0231
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 231)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0231 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_231_a', 'md_231_b', 'lg_231_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_231_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_231_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_231_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0231 end');
    });

    /**
     * @tc.name   testBpStrVol0232
     * @tc.number SUB_MC_BPG_0232
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 232)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0232 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_232_a', 'md_232_b', 'lg_232_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_232_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_232_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_232_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0232 end');
    });

    /**
     * @tc.name   testBpStrVol0233
     * @tc.number SUB_MC_BPG_0233
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 233)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0233 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_233_a', 'md_233_b', 'lg_233_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_233_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_233_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_233_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0233 end');
    });

    /**
     * @tc.name   testBpStrVol0234
     * @tc.number SUB_MC_BPG_0234
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 234)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0234 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_234_a', 'md_234_b', 'lg_234_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_234_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_234_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_234_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0234 end');
    });

    /**
     * @tc.name   testBpStrVol0235
     * @tc.number SUB_MC_BPG_0235
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 235)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0235 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_235_a', 'md_235_b', 'lg_235_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_235_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_235_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_235_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0235 end');
    });

    /**
     * @tc.name   testBpStrVol0236
     * @tc.number SUB_MC_BPG_0236
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 236)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0236 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_236_a', 'md_236_b', 'lg_236_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_236_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_236_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_236_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0236 end');
    });

    /**
     * @tc.name   testBpStrVol0237
     * @tc.number SUB_MC_BPG_0237
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 237)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0237 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_237_a', 'md_237_b', 'lg_237_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_237_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_237_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_237_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0237 end');
    });

    /**
     * @tc.name   testBpStrVol0238
     * @tc.number SUB_MC_BPG_0238
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 238)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0238 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_238_a', 'md_238_b', 'lg_238_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_238_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_238_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_238_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0238 end');
    });

    /**
     * @tc.name   testBpStrVol0239
     * @tc.number SUB_MC_BPG_0239
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 239)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0239 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_239_a', 'md_239_b', 'lg_239_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_239_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_239_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_239_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0239 end');
    });

    /**
     * @tc.name   testBpStrVol0240
     * @tc.number SUB_MC_BPG_0240
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 240)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0240 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_240_a', 'md_240_b', 'lg_240_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_240_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_240_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_240_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0240 end');
    });

    /**
     * @tc.name   testBpStrVol0241
     * @tc.number SUB_MC_BPG_0241
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 241)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0241 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_241_a', 'md_241_b', 'lg_241_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_241_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_241_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_241_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0241 end');
    });

    /**
     * @tc.name   testBpStrVol0242
     * @tc.number SUB_MC_BPG_0242
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 242)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0242 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_242_a', 'md_242_b', 'lg_242_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_242_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_242_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_242_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0242 end');
    });

    /**
     * @tc.name   testBpStrVol0243
     * @tc.number SUB_MC_BPG_0243
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 243)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0243 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_243_a', 'md_243_b', 'lg_243_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_243_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_243_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_243_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0243 end');
    });

    /**
     * @tc.name   testBpStrVol0244
     * @tc.number SUB_MC_BPG_0244
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 244)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0244 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_244_a', 'md_244_b', 'lg_244_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_244_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_244_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_244_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0244 end');
    });

    /**
     * @tc.name   testBpStrVol0245
     * @tc.number SUB_MC_BPG_0245
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 245)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0245 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_245_a', 'md_245_b', 'lg_245_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_245_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_245_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_245_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0245 end');
    });

    /**
     * @tc.name   testBpStrVol0246
     * @tc.number SUB_MC_BPG_0246
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 246)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0246 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_246_a', 'md_246_b', 'lg_246_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_246_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_246_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_246_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0246 end');
    });

    /**
     * @tc.name   testBpStrVol0247
     * @tc.number SUB_MC_BPG_0247
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 247)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0247 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_247_a', 'md_247_b', 'lg_247_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_247_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_247_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_247_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0247 end');
    });

    /**
     * @tc.name   testBpStrVol0248
     * @tc.number SUB_MC_BPG_0248
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 248)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0248 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_248_a', 'md_248_b', 'lg_248_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_248_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_248_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_248_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0248 end');
    });

    /**
     * @tc.name   testBpStrVol0249
     * @tc.number SUB_MC_BPG_0249
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 249)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0249 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_249_a', 'md_249_b', 'lg_249_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_249_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_249_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_249_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0249 end');
    });

    /**
     * @tc.name   testBpStrVol0250
     * @tc.number SUB_MC_BPG_0250
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 250)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0250 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_250_a', 'md_250_b', 'lg_250_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_250_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_250_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_250_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0250 end');
    });

    /**
     * @tc.name   testBpStrVol0251
     * @tc.number SUB_MC_BPG_0251
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 251)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0251 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_251_a', 'md_251_b', 'lg_251_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_251_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_251_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_251_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0251 end');
    });

    /**
     * @tc.name   testBpStrVol0252
     * @tc.number SUB_MC_BPG_0252
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 252)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0252 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_252_a', 'md_252_b', 'lg_252_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_252_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_252_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_252_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0252 end');
    });

    /**
     * @tc.name   testBpStrVol0253
     * @tc.number SUB_MC_BPG_0253
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 253)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0253 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_253_a', 'md_253_b', 'lg_253_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_253_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_253_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_253_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0253 end');
    });

    /**
     * @tc.name   testBpStrVol0254
     * @tc.number SUB_MC_BPG_0254
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 254)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0254 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_254_a', 'md_254_b', 'lg_254_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_254_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_254_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_254_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0254 end');
    });

    /**
     * @tc.name   testBpStrVol0255
     * @tc.number SUB_MC_BPG_0255
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 255)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0255 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_255_a', 'md_255_b', 'lg_255_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_255_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_255_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_255_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0255 end');
    });

    /**
     * @tc.name   testBpStrVol0256
     * @tc.number SUB_MC_BPG_0256
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 256)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0256 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_256_a', 'md_256_b', 'lg_256_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_256_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_256_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_256_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0256 end');
    });

    /**
     * @tc.name   testBpStrVol0257
     * @tc.number SUB_MC_BPG_0257
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 257)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0257 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_257_a', 'md_257_b', 'lg_257_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_257_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_257_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_257_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0257 end');
    });

    /**
     * @tc.name   testBpStrVol0258
     * @tc.number SUB_MC_BPG_0258
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 258)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0258 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_258_a', 'md_258_b', 'lg_258_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_258_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_258_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_258_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0258 end');
    });

    /**
     * @tc.name   testBpStrVol0259
     * @tc.number SUB_MC_BPG_0259
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 259)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0259 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_259_a', 'md_259_b', 'lg_259_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_259_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_259_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_259_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0259 end');
    });

    /**
     * @tc.name   testBpStrVol0260
     * @tc.number SUB_MC_BPG_0260
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 260)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0260 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_260_a', 'md_260_b', 'lg_260_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_260_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_260_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_260_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0260 end');
    });

    /**
     * @tc.name   testBpStrVol0261
     * @tc.number SUB_MC_BPG_0261
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 261)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0261 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_261_a', 'md_261_b', 'lg_261_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_261_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_261_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_261_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0261 end');
    });

    /**
     * @tc.name   testBpStrVol0262
     * @tc.number SUB_MC_BPG_0262
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 262)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0262 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_262_a', 'md_262_b', 'lg_262_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_262_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_262_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_262_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0262 end');
    });

    /**
     * @tc.name   testBpStrVol0263
     * @tc.number SUB_MC_BPG_0263
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 263)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0263 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_263_a', 'md_263_b', 'lg_263_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_263_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_263_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_263_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0263 end');
    });

    /**
     * @tc.name   testBpStrVol0264
     * @tc.number SUB_MC_BPG_0264
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 264)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0264 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_264_a', 'md_264_b', 'lg_264_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_264_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_264_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_264_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0264 end');
    });

    /**
     * @tc.name   testBpStrVol0265
     * @tc.number SUB_MC_BPG_0265
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 265)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0265 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_265_a', 'md_265_b', 'lg_265_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_265_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_265_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_265_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0265 end');
    });

    /**
     * @tc.name   testBpStrVol0266
     * @tc.number SUB_MC_BPG_0266
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 266)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0266 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_266_a', 'md_266_b', 'lg_266_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_266_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_266_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_266_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0266 end');
    });

    /**
     * @tc.name   testBpStrVol0267
     * @tc.number SUB_MC_BPG_0267
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 267)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0267 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_267_a', 'md_267_b', 'lg_267_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_267_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_267_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_267_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0267 end');
    });

    /**
     * @tc.name   testBpStrVol0268
     * @tc.number SUB_MC_BPG_0268
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 268)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0268 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_268_a', 'md_268_b', 'lg_268_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_268_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_268_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_268_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0268 end');
    });

    /**
     * @tc.name   testBpStrVol0269
     * @tc.number SUB_MC_BPG_0269
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 269)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0269 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_269_a', 'md_269_b', 'lg_269_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_269_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_269_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_269_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0269 end');
    });

    /**
     * @tc.name   testBpStrVol0270
     * @tc.number SUB_MC_BPG_0270
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 270)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0270 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_270_a', 'md_270_b', 'lg_270_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_270_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_270_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_270_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0270 end');
    });

    /**
     * @tc.name   testBpStrVol0271
     * @tc.number SUB_MC_BPG_0271
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 271)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0271 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_271_a', 'md_271_b', 'lg_271_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_271_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_271_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_271_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0271 end');
    });

    /**
     * @tc.name   testBpStrVol0272
     * @tc.number SUB_MC_BPG_0272
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 272)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0272 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_272_a', 'md_272_b', 'lg_272_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_272_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_272_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_272_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0272 end');
    });

    /**
     * @tc.name   testBpStrVol0273
     * @tc.number SUB_MC_BPG_0273
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 273)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0273 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_273_a', 'md_273_b', 'lg_273_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_273_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_273_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_273_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0273 end');
    });

    /**
     * @tc.name   testBpStrVol0274
     * @tc.number SUB_MC_BPG_0274
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 274)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0274 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_274_a', 'md_274_b', 'lg_274_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_274_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_274_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_274_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0274 end');
    });

    /**
     * @tc.name   testBpStrVol0275
     * @tc.number SUB_MC_BPG_0275
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 275)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0275 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_275_a', 'md_275_b', 'lg_275_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_275_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_275_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_275_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0275 end');
    });

    /**
     * @tc.name   testBpStrVol0276
     * @tc.number SUB_MC_BPG_0276
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 276)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0276 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_276_a', 'md_276_b', 'lg_276_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_276_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_276_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_276_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0276 end');
    });

    /**
     * @tc.name   testBpStrVol0277
     * @tc.number SUB_MC_BPG_0277
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 277)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0277 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_277_a', 'md_277_b', 'lg_277_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_277_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_277_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_277_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0277 end');
    });

    /**
     * @tc.name   testBpStrVol0278
     * @tc.number SUB_MC_BPG_0278
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 278)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0278 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_278_a', 'md_278_b', 'lg_278_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_278_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_278_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_278_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0278 end');
    });

    /**
     * @tc.name   testBpStrVol0279
     * @tc.number SUB_MC_BPG_0279
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 279)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0279 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_279_a', 'md_279_b', 'lg_279_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_279_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_279_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_279_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0279 end');
    });

    /**
     * @tc.name   testBpStrVol0280
     * @tc.number SUB_MC_BPG_0280
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 280)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0280 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_280_a', 'md_280_b', 'lg_280_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_280_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_280_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_280_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0280 end');
    });

    /**
     * @tc.name   testBpStrVol0281
     * @tc.number SUB_MC_BPG_0281
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 281)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0281 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_281_a', 'md_281_b', 'lg_281_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_281_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_281_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_281_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0281 end');
    });

    /**
     * @tc.name   testBpStrVol0282
     * @tc.number SUB_MC_BPG_0282
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 282)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0282 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_282_a', 'md_282_b', 'lg_282_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_282_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_282_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_282_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0282 end');
    });

    /**
     * @tc.name   testBpStrVol0283
     * @tc.number SUB_MC_BPG_0283
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 283)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0283 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_283_a', 'md_283_b', 'lg_283_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_283_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_283_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_283_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0283 end');
    });

    /**
     * @tc.name   testBpStrVol0284
     * @tc.number SUB_MC_BPG_0284
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 284)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0284 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_284_a', 'md_284_b', 'lg_284_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_284_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_284_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_284_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0284 end');
    });

    /**
     * @tc.name   testBpStrVol0285
     * @tc.number SUB_MC_BPG_0285
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 285)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0285 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_285_a', 'md_285_b', 'lg_285_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_285_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_285_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_285_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0285 end');
    });

    /**
     * @tc.name   testBpStrVol0286
     * @tc.number SUB_MC_BPG_0286
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 286)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0286 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_286_a', 'md_286_b', 'lg_286_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_286_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_286_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_286_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0286 end');
    });

    /**
     * @tc.name   testBpStrVol0287
     * @tc.number SUB_MC_BPG_0287
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 287)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0287 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_287_a', 'md_287_b', 'lg_287_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_287_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_287_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_287_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0287 end');
    });

    /**
     * @tc.name   testBpStrVol0288
     * @tc.number SUB_MC_BPG_0288
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 288)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0288 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_288_a', 'md_288_b', 'lg_288_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_288_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_288_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_288_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0288 end');
    });

    /**
     * @tc.name   testBpStrVol0289
     * @tc.number SUB_MC_BPG_0289
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 289)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0289 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_289_a', 'md_289_b', 'lg_289_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_289_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_289_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_289_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0289 end');
    });

    /**
     * @tc.name   testBpStrVol0290
     * @tc.number SUB_MC_BPG_0290
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 290)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0290 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_290_a', 'md_290_b', 'lg_290_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_290_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_290_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_290_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0290 end');
    });

    /**
     * @tc.name   testBpStrVol0291
     * @tc.number SUB_MC_BPG_0291
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 291)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0291 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_291_a', 'md_291_b', 'lg_291_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_291_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_291_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_291_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0291 end');
    });

    /**
     * @tc.name   testBpStrVol0292
     * @tc.number SUB_MC_BPG_0292
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 292)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0292 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_292_a', 'md_292_b', 'lg_292_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_292_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_292_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_292_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0292 end');
    });

    /**
     * @tc.name   testBpStrVol0293
     * @tc.number SUB_MC_BPG_0293
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 293)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0293 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_293_a', 'md_293_b', 'lg_293_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_293_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_293_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_293_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0293 end');
    });

    /**
     * @tc.name   testBpStrVol0294
     * @tc.number SUB_MC_BPG_0294
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 294)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0294 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_294_a', 'md_294_b', 'lg_294_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_294_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_294_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_294_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0294 end');
    });

    /**
     * @tc.name   testBpStrVol0295
     * @tc.number SUB_MC_BPG_0295
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 295)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0295 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_295_a', 'md_295_b', 'lg_295_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_295_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_295_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_295_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0295 end');
    });

    /**
     * @tc.name   testBpStrVol0296
     * @tc.number SUB_MC_BPG_0296
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 296)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0296 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_296_a', 'md_296_b', 'lg_296_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_296_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_296_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_296_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0296 end');
    });

    /**
     * @tc.name   testBpStrVol0297
     * @tc.number SUB_MC_BPG_0297
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 297)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0297 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_297_a', 'md_297_b', 'lg_297_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_297_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_297_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_297_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0297 end');
    });

    /**
     * @tc.name   testBpStrVol0298
     * @tc.number SUB_MC_BPG_0298
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 298)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0298 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_298_a', 'md_298_b', 'lg_298_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_298_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_298_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_298_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0298 end');
    });

    /**
     * @tc.name   testBpStrVol0299
     * @tc.number SUB_MC_BPG_0299
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 299)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0299 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_299_a', 'md_299_b', 'lg_299_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_299_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_299_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_299_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0299 end');
    });

    /**
     * @tc.name   testBpStrVol0300
     * @tc.number SUB_MC_BPG_0300
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 300)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0300 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_300_a', 'md_300_b', 'lg_300_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_300_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_300_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_300_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0300 end');
    });

  });
}
