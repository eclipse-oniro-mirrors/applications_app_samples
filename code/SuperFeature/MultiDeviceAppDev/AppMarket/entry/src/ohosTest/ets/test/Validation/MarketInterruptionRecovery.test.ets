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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { MarketModel } from '../Shared/MarketModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[MarketTests]';

export default function marketInterruptionRecoverySuite() {
  describe('MarketInterruptionRecoverySuite', () => {
    let m: MarketModel = new MarketModel();

    beforeEach(() => {
      m = new MarketModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1143
     * @tc.name    MarketInterruptionRecovery1143
     * @tc.desc    Market total pages formula for page size 11 probe 1143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1143')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1144
     * @tc.name    MarketInterruptionRecovery1144
     * @tc.desc    Market unknown keyword search 1144 probe 1144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1144')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1144')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1145
     * @tc.name    MarketInterruptionRecovery1145
     * @tc.desc    Market total pages formula for page size 2 probe 1145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1145')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1146
     * @tc.name    MarketInterruptionRecovery1146
     * @tc.desc    Market unknown keyword search 1146 probe 1146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1146')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1146')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1147
     * @tc.name    MarketInterruptionRecovery1147
     * @tc.desc    Market total pages formula for page size 4 probe 1147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1147')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1148
     * @tc.name    MarketInterruptionRecovery1148
     * @tc.desc    Market unknown keyword search 1148 probe 1148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1148')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1148')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1149
     * @tc.name    MarketInterruptionRecovery1149
     * @tc.desc    Market total pages formula for page size 6 probe 1149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1149')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1150
     * @tc.name    MarketInterruptionRecovery1150
     * @tc.desc    Market unknown keyword search 1150 probe 1150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1150')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1150')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1151
     * @tc.name    MarketInterruptionRecovery1151
     * @tc.desc    Market total pages formula for page size 8 probe 1151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1151')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1152
     * @tc.name    MarketInterruptionRecovery1152
     * @tc.desc    Market unknown keyword search 1152 probe 1152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1152')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1152')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1153
     * @tc.name    MarketInterruptionRecovery1153
     * @tc.desc    Market total pages formula for page size 10 probe 1153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1153')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1154
     * @tc.name    MarketInterruptionRecovery1154
     * @tc.desc    Market unknown keyword search 1154 probe 1154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1154')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1154')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1155
     * @tc.name    MarketInterruptionRecovery1155
     * @tc.desc    Market total pages formula for page size 1 probe 1155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1155')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1156
     * @tc.name    MarketInterruptionRecovery1156
     * @tc.desc    Market unknown keyword search 1156 probe 1156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1156')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1156')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1157
     * @tc.name    MarketInterruptionRecovery1157
     * @tc.desc    Market total pages formula for page size 3 probe 1157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1157')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1158
     * @tc.name    MarketInterruptionRecovery1158
     * @tc.desc    Market unknown keyword search 1158 probe 1158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1158')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1158')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1159
     * @tc.name    MarketInterruptionRecovery1159
     * @tc.desc    Market total pages formula for page size 5 probe 1159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1159')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1160
     * @tc.name    MarketInterruptionRecovery1160
     * @tc.desc    Market unknown keyword search 1160 probe 1160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1160')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1160')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1161
     * @tc.name    MarketInterruptionRecovery1161
     * @tc.desc    Market total pages formula for page size 7 probe 1161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1161')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1162
     * @tc.name    MarketInterruptionRecovery1162
     * @tc.desc    Market unknown keyword search 1162 probe 1162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1162')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1162')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1163
     * @tc.name    MarketInterruptionRecovery1163
     * @tc.desc    Market total pages formula for page size 9 probe 1163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1163')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1164
     * @tc.name    MarketInterruptionRecovery1164
     * @tc.desc    Market unknown keyword search 1164 probe 1164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1164')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1164')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1165
     * @tc.name    MarketInterruptionRecovery1165
     * @tc.desc    Market total pages formula for page size 11 probe 1165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1165')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1166
     * @tc.name    MarketInterruptionRecovery1166
     * @tc.desc    Market unknown keyword search 1166 probe 1166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1166')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1166')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1167
     * @tc.name    MarketInterruptionRecovery1167
     * @tc.desc    Market total pages formula for page size 2 probe 1167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1167')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1168
     * @tc.name    MarketInterruptionRecovery1168
     * @tc.desc    Market unknown keyword search 1168 probe 1168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1168')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1168')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1169
     * @tc.name    MarketInterruptionRecovery1169
     * @tc.desc    Market total pages formula for page size 4 probe 1169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1169')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1170
     * @tc.name    MarketInterruptionRecovery1170
     * @tc.desc    Market unknown keyword search 1170 probe 1170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1170')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1170')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1171
     * @tc.name    MarketInterruptionRecovery1171
     * @tc.desc    Market total pages formula for page size 6 probe 1171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1171')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1172
     * @tc.name    MarketInterruptionRecovery1172
     * @tc.desc    Market unknown keyword search 1172 probe 1172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1172')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1172')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1173
     * @tc.name    MarketInterruptionRecovery1173
     * @tc.desc    Market total pages formula for page size 8 probe 1173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1173')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1174
     * @tc.name    MarketInterruptionRecovery1174
     * @tc.desc    Market unknown keyword search 1174 probe 1174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1174')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1174')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1175
     * @tc.name    MarketInterruptionRecovery1175
     * @tc.desc    Market total pages formula for page size 10 probe 1175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1175')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1176
     * @tc.name    MarketInterruptionRecovery1176
     * @tc.desc    Market unknown keyword search 1176 probe 1176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1176')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1176')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1177
     * @tc.name    MarketInterruptionRecovery1177
     * @tc.desc    Market total pages formula for page size 1 probe 1177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1177')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1178
     * @tc.name    MarketInterruptionRecovery1178
     * @tc.desc    Market unknown keyword search 1178 probe 1178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1178')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1178')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1179
     * @tc.name    MarketInterruptionRecovery1179
     * @tc.desc    Market total pages formula for page size 3 probe 1179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1179')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1180
     * @tc.name    MarketInterruptionRecovery1180
     * @tc.desc    Market unknown keyword search 1180 probe 1180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1180')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1180')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1181
     * @tc.name    MarketInterruptionRecovery1181
     * @tc.desc    Market total pages formula for page size 5 probe 1181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1181')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1182
     * @tc.name    MarketInterruptionRecovery1182
     * @tc.desc    Market unknown keyword search 1182 probe 1182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1182')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1182')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1183
     * @tc.name    MarketInterruptionRecovery1183
     * @tc.desc    Market total pages formula for page size 7 probe 1183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1183')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1184
     * @tc.name    MarketInterruptionRecovery1184
     * @tc.desc    Market unknown keyword search 1184 probe 1184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1184')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1184')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1185
     * @tc.name    MarketInterruptionRecovery1185
     * @tc.desc    Market total pages formula for page size 9 probe 1185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1185')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1186
     * @tc.name    MarketInterruptionRecovery1186
     * @tc.desc    Market unknown keyword search 1186 probe 1186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1186')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1186')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1187
     * @tc.name    MarketInterruptionRecovery1187
     * @tc.desc    Market total pages formula for page size 11 probe 1187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1187')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1188
     * @tc.name    MarketInterruptionRecovery1188
     * @tc.desc    Market unknown keyword search 1188 probe 1188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1188')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1188')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1189
     * @tc.name    MarketInterruptionRecovery1189
     * @tc.desc    Market total pages formula for page size 2 probe 1189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1189')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1190
     * @tc.name    MarketInterruptionRecovery1190
     * @tc.desc    Market unknown keyword search 1190 probe 1190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1190')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1190')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1191
     * @tc.name    MarketInterruptionRecovery1191
     * @tc.desc    Market total pages formula for page size 4 probe 1191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1191')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1192
     * @tc.name    MarketInterruptionRecovery1192
     * @tc.desc    Market unknown keyword search 1192 probe 1192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1192')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1192')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1193
     * @tc.name    MarketInterruptionRecovery1193
     * @tc.desc    Market total pages formula for page size 6 probe 1193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1193')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1194
     * @tc.name    MarketInterruptionRecovery1194
     * @tc.desc    Market unknown keyword search 1194 probe 1194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1194')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1194')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1195
     * @tc.name    MarketInterruptionRecovery1195
     * @tc.desc    Market total pages formula for page size 8 probe 1195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1195')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1196
     * @tc.name    MarketInterruptionRecovery1196
     * @tc.desc    Market unknown keyword search 1196 probe 1196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1196')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1196')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1197
     * @tc.name    MarketInterruptionRecovery1197
     * @tc.desc    Market total pages formula for page size 10 probe 1197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1197')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1198
     * @tc.name    MarketInterruptionRecovery1198
     * @tc.desc    Market unknown keyword search 1198 probe 1198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1198')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1198')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1199
     * @tc.name    MarketInterruptionRecovery1199
     * @tc.desc    Market total pages formula for page size 1 probe 1199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1199')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1200
     * @tc.name    MarketInterruptionRecovery1200
     * @tc.desc    Market unknown keyword search 1200 probe 1200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1200')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1200')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1201
     * @tc.name    MarketInterruptionRecovery1201
     * @tc.desc    Market total pages formula for page size 3 probe 1201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1201')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1202
     * @tc.name    MarketInterruptionRecovery1202
     * @tc.desc    Market unknown keyword search 1202 probe 1202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1202')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1202')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1203
     * @tc.name    MarketInterruptionRecovery1203
     * @tc.desc    Market total pages formula for page size 5 probe 1203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1203')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1204
     * @tc.name    MarketInterruptionRecovery1204
     * @tc.desc    Market unknown keyword search 1204 probe 1204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1204')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1204')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1205
     * @tc.name    MarketInterruptionRecovery1205
     * @tc.desc    Market total pages formula for page size 7 probe 1205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1205')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1206
     * @tc.name    MarketInterruptionRecovery1206
     * @tc.desc    Market unknown keyword search 1206 probe 1206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1206')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1206')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1207
     * @tc.name    MarketInterruptionRecovery1207
     * @tc.desc    Market total pages formula for page size 9 probe 1207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1207')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1208
     * @tc.name    MarketInterruptionRecovery1208
     * @tc.desc    Market unknown keyword search 1208 probe 1208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1208')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1208')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1209
     * @tc.name    MarketInterruptionRecovery1209
     * @tc.desc    Market total pages formula for page size 11 probe 1209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1209')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1210
     * @tc.name    MarketInterruptionRecovery1210
     * @tc.desc    Market unknown keyword search 1210 probe 1210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1210')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1210')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1211
     * @tc.name    MarketInterruptionRecovery1211
     * @tc.desc    Market total pages formula for page size 2 probe 1211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1211')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1212
     * @tc.name    MarketInterruptionRecovery1212
     * @tc.desc    Market unknown keyword search 1212 probe 1212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1212')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1212')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1213
     * @tc.name    MarketInterruptionRecovery1213
     * @tc.desc    Market total pages formula for page size 4 probe 1213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1213')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1214
     * @tc.name    MarketInterruptionRecovery1214
     * @tc.desc    Market unknown keyword search 1214 probe 1214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1214')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1214')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1215
     * @tc.name    MarketInterruptionRecovery1215
     * @tc.desc    Market total pages formula for page size 6 probe 1215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1215')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1216
     * @tc.name    MarketInterruptionRecovery1216
     * @tc.desc    Market unknown keyword search 1216 probe 1216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1216')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1216')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1217
     * @tc.name    MarketInterruptionRecovery1217
     * @tc.desc    Market total pages formula for page size 8 probe 1217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1217')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1218
     * @tc.name    MarketInterruptionRecovery1218
     * @tc.desc    Market unknown keyword search 1218 probe 1218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1218')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1218')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1219
     * @tc.name    MarketInterruptionRecovery1219
     * @tc.desc    Market total pages formula for page size 10 probe 1219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1219')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1220
     * @tc.name    MarketInterruptionRecovery1220
     * @tc.desc    Market unknown keyword search 1220 probe 1220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1220')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1220')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1221
     * @tc.name    MarketInterruptionRecovery1221
     * @tc.desc    Market total pages formula for page size 1 probe 1221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1221')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
  });
}

