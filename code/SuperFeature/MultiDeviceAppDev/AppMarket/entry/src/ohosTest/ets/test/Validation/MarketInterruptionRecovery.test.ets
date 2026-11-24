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

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1222
     * @tc.name    MarketInterruptionRecovery1222
     * @tc.desc    Market unknown keyword search 1222 probe 1222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1222')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1222')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1223
     * @tc.name    MarketInterruptionRecovery1223
     * @tc.desc    Market total pages formula for page size 3 probe 1223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1223')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1224
     * @tc.name    MarketInterruptionRecovery1224
     * @tc.desc    Market unknown keyword search 1224 probe 1224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1224')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1224')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1225
     * @tc.name    MarketInterruptionRecovery1225
     * @tc.desc    Market total pages formula for page size 5 probe 1225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1225')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1226
     * @tc.name    MarketInterruptionRecovery1226
     * @tc.desc    Market unknown keyword search 1226 probe 1226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1226')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1226')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1227
     * @tc.name    MarketInterruptionRecovery1227
     * @tc.desc    Market total pages formula for page size 7 probe 1227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1227')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1228
     * @tc.name    MarketInterruptionRecovery1228
     * @tc.desc    Market unknown keyword search 1228 probe 1228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1228')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1228')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1229
     * @tc.name    MarketInterruptionRecovery1229
     * @tc.desc    Market total pages formula for page size 9 probe 1229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1229')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1230
     * @tc.name    MarketInterruptionRecovery1230
     * @tc.desc    Market unknown keyword search 1230 probe 1230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1230')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1230')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1231
     * @tc.name    MarketInterruptionRecovery1231
     * @tc.desc    Market total pages formula for page size 11 probe 1231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1231')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1232
     * @tc.name    MarketInterruptionRecovery1232
     * @tc.desc    Market unknown keyword search 1232 probe 1232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1232')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1232')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1233
     * @tc.name    MarketInterruptionRecovery1233
     * @tc.desc    Market total pages formula for page size 2 probe 1233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1233')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1234
     * @tc.name    MarketInterruptionRecovery1234
     * @tc.desc    Market unknown keyword search 1234 probe 1234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1234')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1234')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1235
     * @tc.name    MarketInterruptionRecovery1235
     * @tc.desc    Market total pages formula for page size 4 probe 1235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1235')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1236
     * @tc.name    MarketInterruptionRecovery1236
     * @tc.desc    Market unknown keyword search 1236 probe 1236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1236')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1236')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1237
     * @tc.name    MarketInterruptionRecovery1237
     * @tc.desc    Market total pages formula for page size 6 probe 1237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1237')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1238
     * @tc.name    MarketInterruptionRecovery1238
     * @tc.desc    Market unknown keyword search 1238 probe 1238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1238')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1238')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1239
     * @tc.name    MarketInterruptionRecovery1239
     * @tc.desc    Market total pages formula for page size 8 probe 1239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1239')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1240
     * @tc.name    MarketInterruptionRecovery1240
     * @tc.desc    Market unknown keyword search 1240 probe 1240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1240')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1240')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1241
     * @tc.name    MarketInterruptionRecovery1241
     * @tc.desc    Market total pages formula for page size 10 probe 1241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1241')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1242
     * @tc.name    MarketInterruptionRecovery1242
     * @tc.desc    Market unknown keyword search 1242 probe 1242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1242')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1242')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1243
     * @tc.name    MarketInterruptionRecovery1243
     * @tc.desc    Market total pages formula for page size 1 probe 1243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1243')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1244
     * @tc.name    MarketInterruptionRecovery1244
     * @tc.desc    Market unknown keyword search 1244 probe 1244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1244')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1244')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1245
     * @tc.name    MarketInterruptionRecovery1245
     * @tc.desc    Market total pages formula for page size 3 probe 1245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1245')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1246
     * @tc.name    MarketInterruptionRecovery1246
     * @tc.desc    Market unknown keyword search 1246 probe 1246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1246')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1246')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1247
     * @tc.name    MarketInterruptionRecovery1247
     * @tc.desc    Market total pages formula for page size 5 probe 1247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1247')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1248
     * @tc.name    MarketInterruptionRecovery1248
     * @tc.desc    Market unknown keyword search 1248 probe 1248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1248')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1248')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1249
     * @tc.name    MarketInterruptionRecovery1249
     * @tc.desc    Market total pages formula for page size 7 probe 1249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1249')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1250
     * @tc.name    MarketInterruptionRecovery1250
     * @tc.desc    Market unknown keyword search 1250 probe 1250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1250')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1250')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1251
     * @tc.name    MarketInterruptionRecovery1251
     * @tc.desc    Market total pages formula for page size 9 probe 1251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1251')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1252
     * @tc.name    MarketInterruptionRecovery1252
     * @tc.desc    Market unknown keyword search 1252 probe 1252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1252')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1252')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1253
     * @tc.name    MarketInterruptionRecovery1253
     * @tc.desc    Market total pages formula for page size 11 probe 1253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1253')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1254
     * @tc.name    MarketInterruptionRecovery1254
     * @tc.desc    Market unknown keyword search 1254 probe 1254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1254')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1254')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1255
     * @tc.name    MarketInterruptionRecovery1255
     * @tc.desc    Market total pages formula for page size 2 probe 1255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1255')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1256
     * @tc.name    MarketInterruptionRecovery1256
     * @tc.desc    Market unknown keyword search 1256 probe 1256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1256')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1256')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1257
     * @tc.name    MarketInterruptionRecovery1257
     * @tc.desc    Market total pages formula for page size 4 probe 1257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1257')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1258
     * @tc.name    MarketInterruptionRecovery1258
     * @tc.desc    Market unknown keyword search 1258 probe 1258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1258')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1258')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1259
     * @tc.name    MarketInterruptionRecovery1259
     * @tc.desc    Market total pages formula for page size 6 probe 1259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1259')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1260
     * @tc.name    MarketInterruptionRecovery1260
     * @tc.desc    Market unknown keyword search 1260 probe 1260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1260')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1260')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1261
     * @tc.name    MarketInterruptionRecovery1261
     * @tc.desc    Market total pages formula for page size 8 probe 1261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1261')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1262
     * @tc.name    MarketInterruptionRecovery1262
     * @tc.desc    Market unknown keyword search 1262 probe 1262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1262')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1262')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1263
     * @tc.name    MarketInterruptionRecovery1263
     * @tc.desc    Market total pages formula for page size 10 probe 1263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1263')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1264
     * @tc.name    MarketInterruptionRecovery1264
     * @tc.desc    Market unknown keyword search 1264 probe 1264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1264')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1264')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1265
     * @tc.name    MarketInterruptionRecovery1265
     * @tc.desc    Market total pages formula for page size 1 probe 1265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1265')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1266
     * @tc.name    MarketInterruptionRecovery1266
     * @tc.desc    Market unknown keyword search 1266 probe 1266
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1266', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1266')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1266')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1267
     * @tc.name    MarketInterruptionRecovery1267
     * @tc.desc    Market total pages formula for page size 3 probe 1267
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1267', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1267')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1268
     * @tc.name    MarketInterruptionRecovery1268
     * @tc.desc    Market unknown keyword search 1268 probe 1268
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1268', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1268')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1268')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1269
     * @tc.name    MarketInterruptionRecovery1269
     * @tc.desc    Market total pages formula for page size 5 probe 1269
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1269', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1269')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1270
     * @tc.name    MarketInterruptionRecovery1270
     * @tc.desc    Market unknown keyword search 1270 probe 1270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1270', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1270')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1270')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1271
     * @tc.name    MarketInterruptionRecovery1271
     * @tc.desc    Market total pages formula for page size 7 probe 1271
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1271', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1271')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1272
     * @tc.name    MarketInterruptionRecovery1272
     * @tc.desc    Market unknown keyword search 1272 probe 1272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1272')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1272')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1273
     * @tc.name    MarketInterruptionRecovery1273
     * @tc.desc    Market total pages formula for page size 9 probe 1273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1273')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1274
     * @tc.name    MarketInterruptionRecovery1274
     * @tc.desc    Market unknown keyword search 1274 probe 1274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1274')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1274')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1275
     * @tc.name    MarketInterruptionRecovery1275
     * @tc.desc    Market total pages formula for page size 11 probe 1275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1275')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1276
     * @tc.name    MarketInterruptionRecovery1276
     * @tc.desc    Market unknown keyword search 1276 probe 1276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1276')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1276')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1277
     * @tc.name    MarketInterruptionRecovery1277
     * @tc.desc    Market total pages formula for page size 2 probe 1277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1277')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1278
     * @tc.name    MarketInterruptionRecovery1278
     * @tc.desc    Market unknown keyword search 1278 probe 1278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1278')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1278')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1279
     * @tc.name    MarketInterruptionRecovery1279
     * @tc.desc    Market total pages formula for page size 4 probe 1279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1279')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1280
     * @tc.name    MarketInterruptionRecovery1280
     * @tc.desc    Market unknown keyword search 1280 probe 1280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1280', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1280')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1280')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1281
     * @tc.name    MarketInterruptionRecovery1281
     * @tc.desc    Market total pages formula for page size 6 probe 1281
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1281', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1281')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1282
     * @tc.name    MarketInterruptionRecovery1282
     * @tc.desc    Market unknown keyword search 1282 probe 1282
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1282', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1282')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1282')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1283
     * @tc.name    MarketInterruptionRecovery1283
     * @tc.desc    Market total pages formula for page size 8 probe 1283
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1283', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1283')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1284
     * @tc.name    MarketInterruptionRecovery1284
     * @tc.desc    Market unknown keyword search 1284 probe 1284
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1284', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1284')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1284')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1285
     * @tc.name    MarketInterruptionRecovery1285
     * @tc.desc    Market total pages formula for page size 10 probe 1285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1285', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1285')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1286
     * @tc.name    MarketInterruptionRecovery1286
     * @tc.desc    Market unknown keyword search 1286 probe 1286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1286', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1286')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1286')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1287
     * @tc.name    MarketInterruptionRecovery1287
     * @tc.desc    Market total pages formula for page size 1 probe 1287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1287', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1287')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1288
     * @tc.name    MarketInterruptionRecovery1288
     * @tc.desc    Market unknown keyword search 1288 probe 1288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1288', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1288')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1288')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1289
     * @tc.name    MarketInterruptionRecovery1289
     * @tc.desc    Market total pages formula for page size 3 probe 1289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1289', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1289')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1290
     * @tc.name    MarketInterruptionRecovery1290
     * @tc.desc    Market unknown keyword search 1290 probe 1290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1290', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1290')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1290')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1291
     * @tc.name    MarketInterruptionRecovery1291
     * @tc.desc    Market total pages formula for page size 5 probe 1291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1291', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1291')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1292
     * @tc.name    MarketInterruptionRecovery1292
     * @tc.desc    Market unknown keyword search 1292 probe 1292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1292', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1292')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1292')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1293
     * @tc.name    MarketInterruptionRecovery1293
     * @tc.desc    Market total pages formula for page size 7 probe 1293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1293')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1294
     * @tc.name    MarketInterruptionRecovery1294
     * @tc.desc    Market unknown keyword search 1294 probe 1294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1294')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1294')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1295
     * @tc.name    MarketInterruptionRecovery1295
     * @tc.desc    Market total pages formula for page size 9 probe 1295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1295')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1296
     * @tc.name    MarketInterruptionRecovery1296
     * @tc.desc    Market unknown keyword search 1296 probe 1296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1296')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1296')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1297
     * @tc.name    MarketInterruptionRecovery1297
     * @tc.desc    Market total pages formula for page size 11 probe 1297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1297')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1298
     * @tc.name    MarketInterruptionRecovery1298
     * @tc.desc    Market unknown keyword search 1298 probe 1298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1298')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1298')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1299
     * @tc.name    MarketInterruptionRecovery1299
     * @tc.desc    Market total pages formula for page size 2 probe 1299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1299')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1300
     * @tc.name    MarketInterruptionRecovery1300
     * @tc.desc    Market unknown keyword search 1300 probe 1300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1300')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1300')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1301
     * @tc.name    MarketInterruptionRecovery1301
     * @tc.desc    Market total pages formula for page size 4 probe 1301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketInterruptionRecovery1301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1301')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

