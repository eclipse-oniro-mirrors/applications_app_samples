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
const LOG_TAG: string = '[MultiColumns_BPS1]';

export default function bpStrVol01Test() {
  describe('MultiColumnsBpStrVol01', () => {

    /**
     * @tc.name   testBpStrVol0151
     * @tc.number SUB_MC_BPG_0151
     * @tc.desc   Anchor: BreakpointType<string> preserves empty/unicode token per breakpoint key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0151 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0151 end');
    });

    /**
     * @tc.name   testBpStrVol0152
     * @tc.number SUB_MC_BPG_0152
     * @tc.desc   Anchor: BreakpointType<string> preserves empty/unicode token per breakpoint key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0152 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0152 end');
    });

    /**
     * @tc.name   testBpStrVol0153
     * @tc.number SUB_MC_BPG_0153
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 153)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0153 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_153_a', 'md_153_b', 'lg_153_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_153_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_153_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_153_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0153 end');
    });

    /**
     * @tc.name   testBpStrVol0154
     * @tc.number SUB_MC_BPG_0154
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 154)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0154 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_154_a', 'md_154_b', 'lg_154_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_154_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_154_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_154_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0154 end');
    });

    /**
     * @tc.name   testBpStrVol0155
     * @tc.number SUB_MC_BPG_0155
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 155)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0155 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_155_a', 'md_155_b', 'lg_155_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_155_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_155_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_155_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0155 end');
    });

    /**
     * @tc.name   testBpStrVol0156
     * @tc.number SUB_MC_BPG_0156
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 156)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0156 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_156_a', 'md_156_b', 'lg_156_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_156_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_156_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_156_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0156 end');
    });

    /**
     * @tc.name   testBpStrVol0157
     * @tc.number SUB_MC_BPG_0157
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 157)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0157 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_157_a', 'md_157_b', 'lg_157_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_157_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_157_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_157_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0157 end');
    });

    /**
     * @tc.name   testBpStrVol0158
     * @tc.number SUB_MC_BPG_0158
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 158)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0158 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_158_a', 'md_158_b', 'lg_158_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_158_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_158_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_158_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0158 end');
    });

    /**
     * @tc.name   testBpStrVol0159
     * @tc.number SUB_MC_BPG_0159
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 159)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0159 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_159_a', 'md_159_b', 'lg_159_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_159_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_159_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_159_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0159 end');
    });

    /**
     * @tc.name   testBpStrVol0160
     * @tc.number SUB_MC_BPG_0160
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 160)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0160 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_160_a', 'md_160_b', 'lg_160_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_160_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_160_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_160_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0160 end');
    });

    /**
     * @tc.name   testBpStrVol0161
     * @tc.number SUB_MC_BPG_0161
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 161)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0161 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_161_a', 'md_161_b', 'lg_161_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_161_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_161_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_161_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0161 end');
    });

    /**
     * @tc.name   testBpStrVol0162
     * @tc.number SUB_MC_BPG_0162
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 162)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0162 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_162_a', 'md_162_b', 'lg_162_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_162_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_162_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_162_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0162 end');
    });

    /**
     * @tc.name   testBpStrVol0163
     * @tc.number SUB_MC_BPG_0163
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 163)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0163 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_163_a', 'md_163_b', 'lg_163_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_163_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_163_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_163_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0163 end');
    });

    /**
     * @tc.name   testBpStrVol0164
     * @tc.number SUB_MC_BPG_0164
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 164)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0164 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_164_a', 'md_164_b', 'lg_164_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_164_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_164_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_164_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0164 end');
    });

    /**
     * @tc.name   testBpStrVol0165
     * @tc.number SUB_MC_BPG_0165
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 165)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0165 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_165_a', 'md_165_b', 'lg_165_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_165_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_165_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_165_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0165 end');
    });

    /**
     * @tc.name   testBpStrVol0166
     * @tc.number SUB_MC_BPG_0166
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 166)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0166 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_166_a', 'md_166_b', 'lg_166_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_166_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_166_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_166_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0166 end');
    });

    /**
     * @tc.name   testBpStrVol0167
     * @tc.number SUB_MC_BPG_0167
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 167)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0167 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_167_a', 'md_167_b', 'lg_167_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_167_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_167_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_167_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0167 end');
    });

    /**
     * @tc.name   testBpStrVol0168
     * @tc.number SUB_MC_BPG_0168
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 168)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0168 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_168_a', 'md_168_b', 'lg_168_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_168_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_168_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_168_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0168 end');
    });

    /**
     * @tc.name   testBpStrVol0169
     * @tc.number SUB_MC_BPG_0169
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 169)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0169 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_169_a', 'md_169_b', 'lg_169_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_169_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_169_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_169_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0169 end');
    });

    /**
     * @tc.name   testBpStrVol0170
     * @tc.number SUB_MC_BPG_0170
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 170)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0170 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_170_a', 'md_170_b', 'lg_170_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_170_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_170_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_170_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0170 end');
    });

    /**
     * @tc.name   testBpStrVol0171
     * @tc.number SUB_MC_BPG_0171
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 171)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0171 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_171_a', 'md_171_b', 'lg_171_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_171_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_171_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_171_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0171 end');
    });

    /**
     * @tc.name   testBpStrVol0172
     * @tc.number SUB_MC_BPG_0172
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 172)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0172 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_172_a', 'md_172_b', 'lg_172_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_172_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_172_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_172_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0172 end');
    });

    /**
     * @tc.name   testBpStrVol0173
     * @tc.number SUB_MC_BPG_0173
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 173)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0173 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_173_a', 'md_173_b', 'lg_173_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_173_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_173_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_173_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0173 end');
    });

    /**
     * @tc.name   testBpStrVol0174
     * @tc.number SUB_MC_BPG_0174
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 174)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0174 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_174_a', 'md_174_b', 'lg_174_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_174_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_174_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_174_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0174 end');
    });

    /**
     * @tc.name   testBpStrVol0175
     * @tc.number SUB_MC_BPG_0175
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 175)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0175 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_175_a', 'md_175_b', 'lg_175_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_175_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_175_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_175_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0175 end');
    });

    /**
     * @tc.name   testBpStrVol0176
     * @tc.number SUB_MC_BPG_0176
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 176)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0176 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_176_a', 'md_176_b', 'lg_176_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_176_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_176_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_176_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0176 end');
    });

    /**
     * @tc.name   testBpStrVol0177
     * @tc.number SUB_MC_BPG_0177
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 177)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0177 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_177_a', 'md_177_b', 'lg_177_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_177_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_177_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_177_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0177 end');
    });

    /**
     * @tc.name   testBpStrVol0178
     * @tc.number SUB_MC_BPG_0178
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 178)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0178 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_178_a', 'md_178_b', 'lg_178_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_178_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_178_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_178_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0178 end');
    });

    /**
     * @tc.name   testBpStrVol0179
     * @tc.number SUB_MC_BPG_0179
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 179)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0179 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_179_a', 'md_179_b', 'lg_179_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_179_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_179_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_179_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0179 end');
    });

    /**
     * @tc.name   testBpStrVol0180
     * @tc.number SUB_MC_BPG_0180
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 180)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0180 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_180_a', 'md_180_b', 'lg_180_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_180_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_180_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_180_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0180 end');
    });

    /**
     * @tc.name   testBpStrVol0181
     * @tc.number SUB_MC_BPG_0181
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 181)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0181 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_181_a', 'md_181_b', 'lg_181_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_181_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_181_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_181_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0181 end');
    });

    /**
     * @tc.name   testBpStrVol0182
     * @tc.number SUB_MC_BPG_0182
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 182)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0182 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_182_a', 'md_182_b', 'lg_182_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_182_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_182_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_182_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0182 end');
    });

    /**
     * @tc.name   testBpStrVol0183
     * @tc.number SUB_MC_BPG_0183
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 183)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0183 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_183_a', 'md_183_b', 'lg_183_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_183_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_183_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_183_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0183 end');
    });

    /**
     * @tc.name   testBpStrVol0184
     * @tc.number SUB_MC_BPG_0184
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 184)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0184 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_184_a', 'md_184_b', 'lg_184_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_184_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_184_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_184_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0184 end');
    });

    /**
     * @tc.name   testBpStrVol0185
     * @tc.number SUB_MC_BPG_0185
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 185)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0185 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_185_a', 'md_185_b', 'lg_185_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_185_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_185_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_185_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0185 end');
    });

    /**
     * @tc.name   testBpStrVol0186
     * @tc.number SUB_MC_BPG_0186
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 186)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0186 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_186_a', 'md_186_b', 'lg_186_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_186_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_186_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_186_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0186 end');
    });

    /**
     * @tc.name   testBpStrVol0187
     * @tc.number SUB_MC_BPG_0187
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 187)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0187 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_187_a', 'md_187_b', 'lg_187_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_187_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_187_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_187_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0187 end');
    });

    /**
     * @tc.name   testBpStrVol0188
     * @tc.number SUB_MC_BPG_0188
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 188)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0188 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_188_a', 'md_188_b', 'lg_188_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_188_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_188_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_188_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0188 end');
    });

    /**
     * @tc.name   testBpStrVol0189
     * @tc.number SUB_MC_BPG_0189
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 189)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0189 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_189_a', 'md_189_b', 'lg_189_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_189_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_189_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_189_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0189 end');
    });

    /**
     * @tc.name   testBpStrVol0190
     * @tc.number SUB_MC_BPG_0190
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 190)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0190 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_190_a', 'md_190_b', 'lg_190_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_190_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_190_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_190_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0190 end');
    });

    /**
     * @tc.name   testBpStrVol0191
     * @tc.number SUB_MC_BPG_0191
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 191)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0191 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_191_a', 'md_191_b', 'lg_191_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_191_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_191_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_191_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0191 end');
    });

    /**
     * @tc.name   testBpStrVol0192
     * @tc.number SUB_MC_BPG_0192
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 192)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0192 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_192_a', 'md_192_b', 'lg_192_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_192_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_192_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_192_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0192 end');
    });

    /**
     * @tc.name   testBpStrVol0193
     * @tc.number SUB_MC_BPG_0193
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 193)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0193 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_193_a', 'md_193_b', 'lg_193_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_193_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_193_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_193_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0193 end');
    });

    /**
     * @tc.name   testBpStrVol0194
     * @tc.number SUB_MC_BPG_0194
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 194)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0194 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_194_a', 'md_194_b', 'lg_194_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_194_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_194_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_194_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0194 end');
    });

    /**
     * @tc.name   testBpStrVol0195
     * @tc.number SUB_MC_BPG_0195
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 195)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0195 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_195_a', 'md_195_b', 'lg_195_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_195_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_195_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_195_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0195 end');
    });

    /**
     * @tc.name   testBpStrVol0196
     * @tc.number SUB_MC_BPG_0196
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 196)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0196 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_196_a', 'md_196_b', 'lg_196_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_196_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_196_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_196_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0196 end');
    });

    /**
     * @tc.name   testBpStrVol0197
     * @tc.number SUB_MC_BPG_0197
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 197)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0197 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_197_a', 'md_197_b', 'lg_197_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_197_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_197_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_197_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0197 end');
    });

    /**
     * @tc.name   testBpStrVol0198
     * @tc.number SUB_MC_BPG_0198
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 198)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0198 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_198_a', 'md_198_b', 'lg_198_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_198_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_198_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_198_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0198 end');
    });

    /**
     * @tc.name   testBpStrVol0199
     * @tc.number SUB_MC_BPG_0199
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 199)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0199 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_199_a', 'md_199_b', 'lg_199_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_199_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_199_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_199_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0199 end');
    });

    /**
     * @tc.name   testBpStrVol0200
     * @tc.number SUB_MC_BPG_0200
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 200)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0200 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_200_a', 'md_200_b', 'lg_200_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_200_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_200_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_200_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0200 end');
    });

    /**
     * @tc.name   testBpStrVol0201
     * @tc.number SUB_MC_BPG_0201
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 201)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0201 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_201_a', 'md_201_b', 'lg_201_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_201_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_201_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_201_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0201 end');
    });

    /**
     * @tc.name   testBpStrVol0202
     * @tc.number SUB_MC_BPG_0202
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 202)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0202 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_202_a', 'md_202_b', 'lg_202_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_202_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_202_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_202_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0202 end');
    });

    /**
     * @tc.name   testBpStrVol0203
     * @tc.number SUB_MC_BPG_0203
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 203)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0203 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_203_a', 'md_203_b', 'lg_203_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_203_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_203_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_203_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0203 end');
    });

    /**
     * @tc.name   testBpStrVol0204
     * @tc.number SUB_MC_BPG_0204
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 204)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0204 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_204_a', 'md_204_b', 'lg_204_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_204_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_204_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_204_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0204 end');
    });

    /**
     * @tc.name   testBpStrVol0205
     * @tc.number SUB_MC_BPG_0205
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 205)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0205 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_205_a', 'md_205_b', 'lg_205_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_205_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_205_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_205_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0205 end');
    });

    /**
     * @tc.name   testBpStrVol0206
     * @tc.number SUB_MC_BPG_0206
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 206)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0206 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_206_a', 'md_206_b', 'lg_206_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_206_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_206_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_206_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0206 end');
    });

    /**
     * @tc.name   testBpStrVol0207
     * @tc.number SUB_MC_BPG_0207
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 207)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0207 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_207_a', 'md_207_b', 'lg_207_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_207_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_207_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_207_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0207 end');
    });

    /**
     * @tc.name   testBpStrVol0208
     * @tc.number SUB_MC_BPG_0208
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 208)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0208 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_208_a', 'md_208_b', 'lg_208_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_208_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_208_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_208_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0208 end');
    });

    /**
     * @tc.name   testBpStrVol0209
     * @tc.number SUB_MC_BPG_0209
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 209)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0209 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_209_a', 'md_209_b', 'lg_209_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_209_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_209_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_209_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0209 end');
    });

    /**
     * @tc.name   testBpStrVol0210
     * @tc.number SUB_MC_BPG_0210
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 210)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0210 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_210_a', 'md_210_b', 'lg_210_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_210_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_210_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_210_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0210 end');
    });

    /**
     * @tc.name   testBpStrVol0211
     * @tc.number SUB_MC_BPG_0211
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 211)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0211 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_211_a', 'md_211_b', 'lg_211_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_211_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_211_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_211_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0211 end');
    });

    /**
     * @tc.name   testBpStrVol0212
     * @tc.number SUB_MC_BPG_0212
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 212)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0212 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_212_a', 'md_212_b', 'lg_212_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_212_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_212_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_212_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0212 end');
    });

    /**
     * @tc.name   testBpStrVol0213
     * @tc.number SUB_MC_BPG_0213
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 213)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0213 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_213_a', 'md_213_b', 'lg_213_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_213_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_213_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_213_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0213 end');
    });

    /**
     * @tc.name   testBpStrVol0214
     * @tc.number SUB_MC_BPG_0214
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 214)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0214 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_214_a', 'md_214_b', 'lg_214_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_214_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_214_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_214_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0214 end');
    });

    /**
     * @tc.name   testBpStrVol0215
     * @tc.number SUB_MC_BPG_0215
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 215)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0215 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_215_a', 'md_215_b', 'lg_215_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_215_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_215_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_215_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0215 end');
    });

    /**
     * @tc.name   testBpStrVol0216
     * @tc.number SUB_MC_BPG_0216
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 216)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0216 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_216_a', 'md_216_b', 'lg_216_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_216_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_216_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_216_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0216 end');
    });

    /**
     * @tc.name   testBpStrVol0217
     * @tc.number SUB_MC_BPG_0217
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 217)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0217 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_217_a', 'md_217_b', 'lg_217_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_217_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_217_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_217_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0217 end');
    });

    /**
     * @tc.name   testBpStrVol0218
     * @tc.number SUB_MC_BPG_0218
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 218)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0218 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_218_a', 'md_218_b', 'lg_218_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_218_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_218_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_218_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0218 end');
    });

    /**
     * @tc.name   testBpStrVol0219
     * @tc.number SUB_MC_BPG_0219
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 219)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0219 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_219_a', 'md_219_b', 'lg_219_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_219_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_219_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_219_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0219 end');
    });

    /**
     * @tc.name   testBpStrVol0220
     * @tc.number SUB_MC_BPG_0220
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 220)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0220 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_220_a', 'md_220_b', 'lg_220_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_220_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_220_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_220_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0220 end');
    });

    /**
     * @tc.name   testBpStrVol0221
     * @tc.number SUB_MC_BPG_0221
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 221)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0221 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_221_a', 'md_221_b', 'lg_221_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_221_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_221_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_221_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0221 end');
    });

    /**
     * @tc.name   testBpStrVol0222
     * @tc.number SUB_MC_BPG_0222
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 222)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0222 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_222_a', 'md_222_b', 'lg_222_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_222_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_222_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_222_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0222 end');
    });

    /**
     * @tc.name   testBpStrVol0223
     * @tc.number SUB_MC_BPG_0223
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 223)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0223 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_223_a', 'md_223_b', 'lg_223_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_223_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_223_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_223_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0223 end');
    });

    /**
     * @tc.name   testBpStrVol0224
     * @tc.number SUB_MC_BPG_0224
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 224)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0224 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_224_a', 'md_224_b', 'lg_224_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_224_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_224_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_224_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0224 end');
    });

    /**
     * @tc.name   testBpStrVol0225
     * @tc.number SUB_MC_BPG_0225
     * @tc.desc   BreakpointType<string> triple resolves sm/md/lg to frozen tokens (row 225)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBpStrVol0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0225 begin');
      const sut: BreakpointType<string> = new BreakpointType<string>('sm_225_a', 'md_225_b', 'lg_225_c');
      const r0: string = sut.GetValue('sm') as string;
      const r1: string = sut.GetValue('md') as string;
      const r2: string = sut.GetValue('lg') as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r0);
      expect(r0).assertEqual('sm_225_a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r1);
      expect(r1).assertEqual('md_225_b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', r2);
      expect(r2).assertEqual('lg_225_c');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBpStrVol0225 end');
    });

  });
}
