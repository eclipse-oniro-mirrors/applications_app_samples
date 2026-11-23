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
import { ColumnsModel } from '../Shared/ColumnsModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[ColumnsTests]';

export default function columnsOfflineNetworkSuite() {
  describe('ColumnsOfflineNetworkSuite', () => {
    let m: ColumnsModel = new ColumnsModel();

    beforeEach(() => {
      m = new ColumnsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1169
     * @tc.name    ColumnsOfflineNetwork1169
     * @tc.desc    Columns split mode at 169 probe 1169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 169;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1169') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1170
     * @tc.name    ColumnsOfflineNetwork1170
     * @tc.desc    Columns split mode at 170 probe 1170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 170;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1170') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1171
     * @tc.name    ColumnsOfflineNetwork1171
     * @tc.desc    Columns split mode at 171 probe 1171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 171;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1171') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1172
     * @tc.name    ColumnsOfflineNetwork1172
     * @tc.desc    Columns split mode at 172 probe 1172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 172;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1172') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1173
     * @tc.name    ColumnsOfflineNetwork1173
     * @tc.desc    Columns split mode at 173 probe 1173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 173;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1173') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1174
     * @tc.name    ColumnsOfflineNetwork1174
     * @tc.desc    Columns split mode at 174 probe 1174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 174;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1174') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1175
     * @tc.name    ColumnsOfflineNetwork1175
     * @tc.desc    Columns split mode at 175 probe 1175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 175;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1175') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1176
     * @tc.name    ColumnsOfflineNetwork1176
     * @tc.desc    Columns split mode at 176 probe 1176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 176;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1176') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1177
     * @tc.name    ColumnsOfflineNetwork1177
     * @tc.desc    Columns split mode at 177 probe 1177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 177;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1177') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1178
     * @tc.name    ColumnsOfflineNetwork1178
     * @tc.desc    Columns split mode at 178 probe 1178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 178;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1178') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1179
     * @tc.name    ColumnsOfflineNetwork1179
     * @tc.desc    Columns split mode at 179 probe 1179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 179;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1179') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1180
     * @tc.name    ColumnsOfflineNetwork1180
     * @tc.desc    Columns split mode at 180 probe 1180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 180;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1180') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1181
     * @tc.name    ColumnsOfflineNetwork1181
     * @tc.desc    Columns split mode at 181 probe 1181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 181;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1181') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1182
     * @tc.name    ColumnsOfflineNetwork1182
     * @tc.desc    Columns split mode at 182 probe 1182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 182;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1182') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1183
     * @tc.name    ColumnsOfflineNetwork1183
     * @tc.desc    Columns split mode at 183 probe 1183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 183;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1183') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1184
     * @tc.name    ColumnsOfflineNetwork1184
     * @tc.desc    Columns split mode at 184 probe 1184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 184;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1184') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1185
     * @tc.name    ColumnsOfflineNetwork1185
     * @tc.desc    Columns split mode at 185 probe 1185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 185;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1185') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1186
     * @tc.name    ColumnsOfflineNetwork1186
     * @tc.desc    Columns split mode at 186 probe 1186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 186;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1186') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1187
     * @tc.name    ColumnsOfflineNetwork1187
     * @tc.desc    Columns split mode at 187 probe 1187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 187;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1187') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1188
     * @tc.name    ColumnsOfflineNetwork1188
     * @tc.desc    Columns split mode at 188 probe 1188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 188;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1188') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1189
     * @tc.name    ColumnsOfflineNetwork1189
     * @tc.desc    Columns split mode at 189 probe 1189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 189;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1189') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1190
     * @tc.name    ColumnsOfflineNetwork1190
     * @tc.desc    Columns split mode at 190 probe 1190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 190;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1190') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1191
     * @tc.name    ColumnsOfflineNetwork1191
     * @tc.desc    Columns split mode at 191 probe 1191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 191;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1191') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1192
     * @tc.name    ColumnsOfflineNetwork1192
     * @tc.desc    Columns split mode at 192 probe 1192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 192;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1192') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1193
     * @tc.name    ColumnsOfflineNetwork1193
     * @tc.desc    Columns split mode at 193 probe 1193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 193;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1193') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1194
     * @tc.name    ColumnsOfflineNetwork1194
     * @tc.desc    Columns split mode at 194 probe 1194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 194;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1194') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1195
     * @tc.name    ColumnsOfflineNetwork1195
     * @tc.desc    Columns split mode at 195 probe 1195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 195;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1195') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1196
     * @tc.name    ColumnsOfflineNetwork1196
     * @tc.desc    Columns split mode at 196 probe 1196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 196;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1196') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1197
     * @tc.name    ColumnsOfflineNetwork1197
     * @tc.desc    Columns split mode at 197 probe 1197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 197;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1197') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1198
     * @tc.name    ColumnsOfflineNetwork1198
     * @tc.desc    Columns split mode at 198 probe 1198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 198;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1198') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1199
     * @tc.name    ColumnsOfflineNetwork1199
     * @tc.desc    Columns split mode at 199 probe 1199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 199;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1199') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1200
     * @tc.name    ColumnsOfflineNetwork1200
     * @tc.desc    Columns split mode at 200 probe 1200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 200;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1200') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1201
     * @tc.name    ColumnsOfflineNetwork1201
     * @tc.desc    Columns split mode at 201 probe 1201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 201;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1201') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1202
     * @tc.name    ColumnsOfflineNetwork1202
     * @tc.desc    Columns split mode at 202 probe 1202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 202;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1202') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1203
     * @tc.name    ColumnsOfflineNetwork1203
     * @tc.desc    Columns split mode at 203 probe 1203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 203;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1203') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1204
     * @tc.name    ColumnsOfflineNetwork1204
     * @tc.desc    Columns split mode at 204 probe 1204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 204;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1204') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1205
     * @tc.name    ColumnsOfflineNetwork1205
     * @tc.desc    Columns split mode at 205 probe 1205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 205;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1205') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1206
     * @tc.name    ColumnsOfflineNetwork1206
     * @tc.desc    Columns split mode at 206 probe 1206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 206;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1206') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1207
     * @tc.name    ColumnsOfflineNetwork1207
     * @tc.desc    Columns split mode at 207 probe 1207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 207;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1207') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1208
     * @tc.name    ColumnsOfflineNetwork1208
     * @tc.desc    Columns split mode at 208 probe 1208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 208;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1208') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1209
     * @tc.name    ColumnsOfflineNetwork1209
     * @tc.desc    Columns split mode at 209 probe 1209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 209;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1209') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1210
     * @tc.name    ColumnsOfflineNetwork1210
     * @tc.desc    Columns split mode at 210 probe 1210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 210;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1210') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1211
     * @tc.name    ColumnsOfflineNetwork1211
     * @tc.desc    Columns split mode at 211 probe 1211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 211;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1211') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1212
     * @tc.name    ColumnsOfflineNetwork1212
     * @tc.desc    Columns split mode at 212 probe 1212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 212;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1212') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1213
     * @tc.name    ColumnsOfflineNetwork1213
     * @tc.desc    Columns split mode at 213 probe 1213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 213;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1213') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1214
     * @tc.name    ColumnsOfflineNetwork1214
     * @tc.desc    Columns split mode at 214 probe 1214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 214;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1214') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1215
     * @tc.name    ColumnsOfflineNetwork1215
     * @tc.desc    Columns split mode at 215 probe 1215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 215;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1215') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1216
     * @tc.name    ColumnsOfflineNetwork1216
     * @tc.desc    Columns split mode at 216 probe 1216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 216;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1216') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1217
     * @tc.name    ColumnsOfflineNetwork1217
     * @tc.desc    Columns split mode at 217 probe 1217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 217;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1217') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1218
     * @tc.name    ColumnsOfflineNetwork1218
     * @tc.desc    Columns split mode at 218 probe 1218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 218;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1218') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1219
     * @tc.name    ColumnsOfflineNetwork1219
     * @tc.desc    Columns split mode at 219 probe 1219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 219;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1219') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1220
     * @tc.name    ColumnsOfflineNetwork1220
     * @tc.desc    Columns split mode at 220 probe 1220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 220;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1220') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1221
     * @tc.name    ColumnsOfflineNetwork1221
     * @tc.desc    Columns split mode at 221 probe 1221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 221;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1221') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1222
     * @tc.name    ColumnsOfflineNetwork1222
     * @tc.desc    Columns split mode at 222 probe 1222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 222;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1222') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1223
     * @tc.name    ColumnsOfflineNetwork1223
     * @tc.desc    Columns split mode at 223 probe 1223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 223;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1223') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1224
     * @tc.name    ColumnsOfflineNetwork1224
     * @tc.desc    Columns split mode at 224 probe 1224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 224;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1224') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1225
     * @tc.name    ColumnsOfflineNetwork1225
     * @tc.desc    Columns split mode at 225 probe 1225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 225;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1225') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1226
     * @tc.name    ColumnsOfflineNetwork1226
     * @tc.desc    Columns split mode at 226 probe 1226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 226;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1226') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1227
     * @tc.name    ColumnsOfflineNetwork1227
     * @tc.desc    Columns split mode at 227 probe 1227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 227;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1227') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1228
     * @tc.name    ColumnsOfflineNetwork1228
     * @tc.desc    Columns split mode at 228 probe 1228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 228;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1228') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1229
     * @tc.name    ColumnsOfflineNetwork1229
     * @tc.desc    Columns split mode at 229 probe 1229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 229;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1229') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1230
     * @tc.name    ColumnsOfflineNetwork1230
     * @tc.desc    Columns split mode at 230 probe 1230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 230;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1230') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1231
     * @tc.name    ColumnsOfflineNetwork1231
     * @tc.desc    Columns split mode at 231 probe 1231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 231;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1231') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1232
     * @tc.name    ColumnsOfflineNetwork1232
     * @tc.desc    Columns split mode at 232 probe 1232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 232;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1232') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1233
     * @tc.name    ColumnsOfflineNetwork1233
     * @tc.desc    Columns split mode at 233 probe 1233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 233;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1233') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1234
     * @tc.name    ColumnsOfflineNetwork1234
     * @tc.desc    Columns split mode at 234 probe 1234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 234;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1234') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1235
     * @tc.name    ColumnsOfflineNetwork1235
     * @tc.desc    Columns split mode at 235 probe 1235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 235;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1235') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1236
     * @tc.name    ColumnsOfflineNetwork1236
     * @tc.desc    Columns split mode at 236 probe 1236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 236;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1236') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1237
     * @tc.name    ColumnsOfflineNetwork1237
     * @tc.desc    Columns split mode at 237 probe 1237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 237;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1237') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1238
     * @tc.name    ColumnsOfflineNetwork1238
     * @tc.desc    Columns split mode at 238 probe 1238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 238;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1238') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1239
     * @tc.name    ColumnsOfflineNetwork1239
     * @tc.desc    Columns split mode at 239 probe 1239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 239;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1239') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1240
     * @tc.name    ColumnsOfflineNetwork1240
     * @tc.desc    Columns split mode at 240 probe 1240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 240;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1240') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1241
     * @tc.name    ColumnsOfflineNetwork1241
     * @tc.desc    Columns split mode at 241 probe 1241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 241;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1241') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1242
     * @tc.name    ColumnsOfflineNetwork1242
     * @tc.desc    Columns split mode at 242 probe 1242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 242;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1242') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1243
     * @tc.name    ColumnsOfflineNetwork1243
     * @tc.desc    Columns split mode at 243 probe 1243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 243;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1243') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1244
     * @tc.name    ColumnsOfflineNetwork1244
     * @tc.desc    Columns split mode at 244 probe 1244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 244;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1244') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1245
     * @tc.name    ColumnsOfflineNetwork1245
     * @tc.desc    Columns split mode at 245 probe 1245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 245;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1245') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1246
     * @tc.name    ColumnsOfflineNetwork1246
     * @tc.desc    Columns split mode at 246 probe 1246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 246;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1246') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1247
     * @tc.name    ColumnsOfflineNetwork1247
     * @tc.desc    Columns split mode at 247 probe 1247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 247;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1247') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1248
     * @tc.name    ColumnsOfflineNetwork1248
     * @tc.desc    Columns split mode at 248 probe 1248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 248;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1248') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1249
     * @tc.name    ColumnsOfflineNetwork1249
     * @tc.desc    Columns split mode at 249 probe 1249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 249;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1249') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1250
     * @tc.name    ColumnsOfflineNetwork1250
     * @tc.desc    Columns split mode at 250 probe 1250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 250;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1250') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1251
     * @tc.name    ColumnsOfflineNetwork1251
     * @tc.desc    Columns split mode at 251 probe 1251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 251;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1251') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1252
     * @tc.name    ColumnsOfflineNetwork1252
     * @tc.desc    Columns split mode at 252 probe 1252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 252;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1252') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1253
     * @tc.name    ColumnsOfflineNetwork1253
     * @tc.desc    Columns split mode at 253 probe 1253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 253;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1253') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1254
     * @tc.name    ColumnsOfflineNetwork1254
     * @tc.desc    Columns split mode at 254 probe 1254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 254;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1254') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1255
     * @tc.name    ColumnsOfflineNetwork1255
     * @tc.desc    Columns split mode at 255 probe 1255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 255;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1255') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1256
     * @tc.name    ColumnsOfflineNetwork1256
     * @tc.desc    Columns split mode at 256 probe 1256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 256;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1256') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1257
     * @tc.name    ColumnsOfflineNetwork1257
     * @tc.desc    Columns split mode at 257 probe 1257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 257;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1257') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1258
     * @tc.name    ColumnsOfflineNetwork1258
     * @tc.desc    Columns split mode at 258 probe 1258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 258;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1258') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1259
     * @tc.name    ColumnsOfflineNetwork1259
     * @tc.desc    Columns split mode at 259 probe 1259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 259;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1259') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1260
     * @tc.name    ColumnsOfflineNetwork1260
     * @tc.desc    Columns split mode at 260 probe 1260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 260;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1260') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1261
     * @tc.name    ColumnsOfflineNetwork1261
     * @tc.desc    Columns split mode at 261 probe 1261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 261;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1261') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1262
     * @tc.name    ColumnsOfflineNetwork1262
     * @tc.desc    Columns split mode at 262 probe 1262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 262;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1262') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1263
     * @tc.name    ColumnsOfflineNetwork1263
     * @tc.desc    Columns split mode at 263 probe 1263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 263;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1263') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1264
     * @tc.name    ColumnsOfflineNetwork1264
     * @tc.desc    Columns split mode at 264 probe 1264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 264;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1264') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1265
     * @tc.name    ColumnsOfflineNetwork1265
     * @tc.desc    Columns split mode at 265 probe 1265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 265;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1265') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1266
     * @tc.name    ColumnsOfflineNetwork1266
     * @tc.desc    Columns split mode at 266 probe 1266
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1266', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 266;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1266') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1267
     * @tc.name    ColumnsOfflineNetwork1267
     * @tc.desc    Columns split mode at 267 probe 1267
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1267', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 267;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1267') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1268
     * @tc.name    ColumnsOfflineNetwork1268
     * @tc.desc    Columns split mode at 268 probe 1268
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1268', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 268;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1268') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1269
     * @tc.name    ColumnsOfflineNetwork1269
     * @tc.desc    Columns split mode at 269 probe 1269
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1269', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 269;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1269') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1270
     * @tc.name    ColumnsOfflineNetwork1270
     * @tc.desc    Columns split mode at 270 probe 1270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1270', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 270;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1270') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1271
     * @tc.name    ColumnsOfflineNetwork1271
     * @tc.desc    Columns split mode at 271 probe 1271
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1271', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 271;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1271') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1272
     * @tc.name    ColumnsOfflineNetwork1272
     * @tc.desc    Columns split mode at 272 probe 1272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 272;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1272') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1273
     * @tc.name    ColumnsOfflineNetwork1273
     * @tc.desc    Columns split mode at 273 probe 1273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 273;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1273') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1274
     * @tc.name    ColumnsOfflineNetwork1274
     * @tc.desc    Columns split mode at 274 probe 1274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 274;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1274') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1275
     * @tc.name    ColumnsOfflineNetwork1275
     * @tc.desc    Columns split mode at 275 probe 1275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 275;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1275') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1276
     * @tc.name    ColumnsOfflineNetwork1276
     * @tc.desc    Columns split mode at 276 probe 1276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 276;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1276') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1277
     * @tc.name    ColumnsOfflineNetwork1277
     * @tc.desc    Columns split mode at 277 probe 1277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 277;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1277') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1278
     * @tc.name    ColumnsOfflineNetwork1278
     * @tc.desc    Columns split mode at 278 probe 1278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 278;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1278') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1279
     * @tc.name    ColumnsOfflineNetwork1279
     * @tc.desc    Columns split mode at 279 probe 1279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 279;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1279') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1280
     * @tc.name    ColumnsOfflineNetwork1280
     * @tc.desc    Columns split mode at 280 probe 1280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1280', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 280;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1280') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1281
     * @tc.name    ColumnsOfflineNetwork1281
     * @tc.desc    Columns split mode at 281 probe 1281
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1281', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 281;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1281') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1282
     * @tc.name    ColumnsOfflineNetwork1282
     * @tc.desc    Columns split mode at 282 probe 1282
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1282', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 282;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1282') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1283
     * @tc.name    ColumnsOfflineNetwork1283
     * @tc.desc    Columns split mode at 283 probe 1283
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1283', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 283;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1283') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1284
     * @tc.name    ColumnsOfflineNetwork1284
     * @tc.desc    Columns split mode at 284 probe 1284
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1284', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 284;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1284') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1285
     * @tc.name    ColumnsOfflineNetwork1285
     * @tc.desc    Columns split mode at 285 probe 1285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1285', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 285;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1285') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1286
     * @tc.name    ColumnsOfflineNetwork1286
     * @tc.desc    Columns split mode at 286 probe 1286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1286', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 286;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1286') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1287
     * @tc.name    ColumnsOfflineNetwork1287
     * @tc.desc    Columns split mode at 287 probe 1287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1287', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 287;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1287') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1288
     * @tc.name    ColumnsOfflineNetwork1288
     * @tc.desc    Columns split mode at 288 probe 1288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1288', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 288;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1288') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1289
     * @tc.name    ColumnsOfflineNetwork1289
     * @tc.desc    Columns split mode at 289 probe 1289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1289', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 289;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1289') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1290
     * @tc.name    ColumnsOfflineNetwork1290
     * @tc.desc    Columns split mode at 290 probe 1290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1290', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 290;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1290') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1291
     * @tc.name    ColumnsOfflineNetwork1291
     * @tc.desc    Columns split mode at 291 probe 1291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1291', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 291;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1291') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1292
     * @tc.name    ColumnsOfflineNetwork1292
     * @tc.desc    Columns split mode at 292 probe 1292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1292', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 292;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1292') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1293
     * @tc.name    ColumnsOfflineNetwork1293
     * @tc.desc    Columns split mode at 293 probe 1293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 293;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1293') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1294
     * @tc.name    ColumnsOfflineNetwork1294
     * @tc.desc    Columns split mode at 294 probe 1294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 294;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1294') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1295
     * @tc.name    ColumnsOfflineNetwork1295
     * @tc.desc    Columns split mode at 295 probe 1295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 295;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1295') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1296
     * @tc.name    ColumnsOfflineNetwork1296
     * @tc.desc    Columns split mode at 296 probe 1296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 296;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1296') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1297
     * @tc.name    ColumnsOfflineNetwork1297
     * @tc.desc    Columns split mode at 297 probe 1297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 297;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1297') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1298
     * @tc.name    ColumnsOfflineNetwork1298
     * @tc.desc    Columns split mode at 298 probe 1298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 298;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1298') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1299
     * @tc.name    ColumnsOfflineNetwork1299
     * @tc.desc    Columns split mode at 299 probe 1299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 299;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1299') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1300
     * @tc.name    ColumnsOfflineNetwork1300
     * @tc.desc    Columns split mode at 300 probe 1300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 300;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1300') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1301
     * @tc.name    ColumnsOfflineNetwork1301
     * @tc.desc    Columns split mode at 301 probe 1301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 301;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1301') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1302
     * @tc.name    ColumnsOfflineNetwork1302
     * @tc.desc    Columns split mode at 302 probe 1302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1302', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 302;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1302') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1303
     * @tc.name    ColumnsOfflineNetwork1303
     * @tc.desc    Columns split mode at 303 probe 1303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1303', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 303;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1303') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1304
     * @tc.name    ColumnsOfflineNetwork1304
     * @tc.desc    Columns split mode at 304 probe 1304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1304', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 304;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1304') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1305
     * @tc.name    ColumnsOfflineNetwork1305
     * @tc.desc    Columns split mode at 305 probe 1305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1305', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 305;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1305') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1306
     * @tc.name    ColumnsOfflineNetwork1306
     * @tc.desc    Columns split mode at 306 probe 1306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1306', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 306;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1306') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1307
     * @tc.name    ColumnsOfflineNetwork1307
     * @tc.desc    Columns split mode at 307 probe 1307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1307', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 307;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1307') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1308
     * @tc.name    ColumnsOfflineNetwork1308
     * @tc.desc    Columns split mode at 308 probe 1308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1308', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 308;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1308') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1309
     * @tc.name    ColumnsOfflineNetwork1309
     * @tc.desc    Columns split mode at 309 probe 1309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1309', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 309;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1309') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1310
     * @tc.name    ColumnsOfflineNetwork1310
     * @tc.desc    Columns split mode at 310 probe 1310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1310', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 310;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1310') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1311
     * @tc.name    ColumnsOfflineNetwork1311
     * @tc.desc    Columns split mode at 311 probe 1311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1311', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 311;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1311') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1312
     * @tc.name    ColumnsOfflineNetwork1312
     * @tc.desc    Columns split mode at 312 probe 1312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1312', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 312;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1312') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1313
     * @tc.name    ColumnsOfflineNetwork1313
     * @tc.desc    Columns split mode at 313 probe 1313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1313', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 313;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1313') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1314
     * @tc.name    ColumnsOfflineNetwork1314
     * @tc.desc    Columns split mode at 314 probe 1314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1314', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 314;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1314') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1315
     * @tc.name    ColumnsOfflineNetwork1315
     * @tc.desc    Columns split mode at 315 probe 1315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1315', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 315;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1315') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1316
     * @tc.name    ColumnsOfflineNetwork1316
     * @tc.desc    Columns split mode at 316 probe 1316
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1316', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 316;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1316') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1317
     * @tc.name    ColumnsOfflineNetwork1317
     * @tc.desc    Columns split mode at 317 probe 1317
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1317', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 317;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1317') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1318
     * @tc.name    ColumnsOfflineNetwork1318
     * @tc.desc    Columns split mode at 318 probe 1318
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1318', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 318;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1318') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1319
     * @tc.name    ColumnsOfflineNetwork1319
     * @tc.desc    Columns split mode at 319 probe 1319
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1319', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 319;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1319') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1320
     * @tc.name    ColumnsOfflineNetwork1320
     * @tc.desc    Columns split mode at 320 probe 1320
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1320', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 320;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1320') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1321
     * @tc.name    ColumnsOfflineNetwork1321
     * @tc.desc    Columns split mode at 321 probe 1321
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1321', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 321;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1321') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1322
     * @tc.name    ColumnsOfflineNetwork1322
     * @tc.desc    Columns split mode at 322 probe 1322
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1322', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 322;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1322') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1323
     * @tc.name    ColumnsOfflineNetwork1323
     * @tc.desc    Columns split mode at 323 probe 1323
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1323', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 323;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1323') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1324
     * @tc.name    ColumnsOfflineNetwork1324
     * @tc.desc    Columns split mode at 324 probe 1324
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1324', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 324;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1324') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1325
     * @tc.name    ColumnsOfflineNetwork1325
     * @tc.desc    Columns split mode at 325 probe 1325
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1325', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 325;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1325') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1326
     * @tc.name    ColumnsOfflineNetwork1326
     * @tc.desc    Columns split mode at 326 probe 1326
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1326', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 326;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1326') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1327
     * @tc.name    ColumnsOfflineNetwork1327
     * @tc.desc    Columns split mode at 327 probe 1327
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1327', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 327;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1327') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1328
     * @tc.name    ColumnsOfflineNetwork1328
     * @tc.desc    Columns split mode at 328 probe 1328
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1328', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 328;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1328') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1329
     * @tc.name    ColumnsOfflineNetwork1329
     * @tc.desc    Columns split mode at 329 probe 1329
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1329', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 329;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1329') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1330
     * @tc.name    ColumnsOfflineNetwork1330
     * @tc.desc    Columns split mode at 330 probe 1330
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1330', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 330;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1330') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1331
     * @tc.name    ColumnsOfflineNetwork1331
     * @tc.desc    Columns split mode at 331 probe 1331
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1331', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 331;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1331') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1332
     * @tc.name    ColumnsOfflineNetwork1332
     * @tc.desc    Columns split mode at 332 probe 1332
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1332', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 332;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1332') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1333
     * @tc.name    ColumnsOfflineNetwork1333
     * @tc.desc    Columns split mode at 333 probe 1333
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1333', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 333;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1333') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1334
     * @tc.name    ColumnsOfflineNetwork1334
     * @tc.desc    Columns split mode at 334 probe 1334
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1334', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 334;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1334') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1335
     * @tc.name    ColumnsOfflineNetwork1335
     * @tc.desc    Columns split mode at 335 probe 1335
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1335', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 335;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1335') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1336
     * @tc.name    ColumnsOfflineNetwork1336
     * @tc.desc    Columns split mode at 336 probe 1336
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1336', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 336;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1336') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1337
     * @tc.name    ColumnsOfflineNetwork1337
     * @tc.desc    Columns split mode at 337 probe 1337
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1337', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 337;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1337') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1338
     * @tc.name    ColumnsOfflineNetwork1338
     * @tc.desc    Columns split mode at 338 probe 1338
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1338', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 338;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1338') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1339
     * @tc.name    ColumnsOfflineNetwork1339
     * @tc.desc    Columns split mode at 339 probe 1339
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1339', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 339;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1339') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1340
     * @tc.name    ColumnsOfflineNetwork1340
     * @tc.desc    Columns split mode at 340 probe 1340
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1340', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 340;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1340') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1341
     * @tc.name    ColumnsOfflineNetwork1341
     * @tc.desc    Columns split mode at 341 probe 1341
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1341', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 341;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1341') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1342
     * @tc.name    ColumnsOfflineNetwork1342
     * @tc.desc    Columns split mode at 342 probe 1342
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1342', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 342;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1342') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1343
     * @tc.name    ColumnsOfflineNetwork1343
     * @tc.desc    Columns split mode at 343 probe 1343
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1343', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 343;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1343') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1344
     * @tc.name    ColumnsOfflineNetwork1344
     * @tc.desc    Columns split mode at 344 probe 1344
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1344', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 344;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1344') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1345
     * @tc.name    ColumnsOfflineNetwork1345
     * @tc.desc    Columns split mode at 345 probe 1345
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1345', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 345;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1345') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1346
     * @tc.name    ColumnsOfflineNetwork1346
     * @tc.desc    Columns split mode at 346 probe 1346
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1346', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 346;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1346') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1347
     * @tc.name    ColumnsOfflineNetwork1347
     * @tc.desc    Columns split mode at 347 probe 1347
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1347', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 347;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1347') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1348
     * @tc.name    ColumnsOfflineNetwork1348
     * @tc.desc    Columns split mode at 348 probe 1348
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1348', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 348;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1348') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1349
     * @tc.name    ColumnsOfflineNetwork1349
     * @tc.desc    Columns split mode at 349 probe 1349
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1349', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 349;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1349') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1350
     * @tc.name    ColumnsOfflineNetwork1350
     * @tc.desc    Columns split mode at 350 probe 1350
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1350', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 350;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1350') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1351
     * @tc.name    ColumnsOfflineNetwork1351
     * @tc.desc    Columns split mode at 351 probe 1351
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1351', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 351;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1351') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1352
     * @tc.name    ColumnsOfflineNetwork1352
     * @tc.desc    Columns split mode at 352 probe 1352
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1352', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 352;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1352') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1353
     * @tc.name    ColumnsOfflineNetwork1353
     * @tc.desc    Columns split mode at 353 probe 1353
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1353', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 353;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1353') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1354
     * @tc.name    ColumnsOfflineNetwork1354
     * @tc.desc    Columns split mode at 354 probe 1354
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1354', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 354;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1354') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1355
     * @tc.name    ColumnsOfflineNetwork1355
     * @tc.desc    Columns split mode at 355 probe 1355
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1355', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 355;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1355') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1356
     * @tc.name    ColumnsOfflineNetwork1356
     * @tc.desc    Columns split mode at 356 probe 1356
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1356', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 356;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1356') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1357
     * @tc.name    ColumnsOfflineNetwork1357
     * @tc.desc    Columns split mode at 357 probe 1357
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1357', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 357;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1357') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1358
     * @tc.name    ColumnsOfflineNetwork1358
     * @tc.desc    Columns split mode at 358 probe 1358
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1358', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 358;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1358') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1359
     * @tc.name    ColumnsOfflineNetwork1359
     * @tc.desc    Columns split mode at 359 probe 1359
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1359', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 359;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1359') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1360
     * @tc.name    ColumnsOfflineNetwork1360
     * @tc.desc    Columns split mode at 360 probe 1360
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1360', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 360;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1360') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1361
     * @tc.name    ColumnsOfflineNetwork1361
     * @tc.desc    Columns split mode at 361 probe 1361
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1361', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 361;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1361') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1362
     * @tc.name    ColumnsOfflineNetwork1362
     * @tc.desc    Columns split mode at 362 probe 1362
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1362', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 362;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1362') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1363
     * @tc.name    ColumnsOfflineNetwork1363
     * @tc.desc    Columns split mode at 363 probe 1363
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1363', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 363;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1363') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1364
     * @tc.name    ColumnsOfflineNetwork1364
     * @tc.desc    Columns split mode at 364 probe 1364
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1364', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 364;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1364') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1365
     * @tc.name    ColumnsOfflineNetwork1365
     * @tc.desc    Columns split mode at 365 probe 1365
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1365', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 365;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1365') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1366
     * @tc.name    ColumnsOfflineNetwork1366
     * @tc.desc    Columns split mode at 366 probe 1366
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1366', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 366;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1366') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1367
     * @tc.name    ColumnsOfflineNetwork1367
     * @tc.desc    Columns split mode at 367 probe 1367
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1367', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 367;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1367') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1368
     * @tc.name    ColumnsOfflineNetwork1368
     * @tc.desc    Columns split mode at 368 probe 1368
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1368', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 368;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1368') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1369
     * @tc.name    ColumnsOfflineNetwork1369
     * @tc.desc    Columns split mode at 369 probe 1369
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1369', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 369;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1369') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1370
     * @tc.name    ColumnsOfflineNetwork1370
     * @tc.desc    Columns split mode at 370 probe 1370
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1370', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 370;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1370') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1371
     * @tc.name    ColumnsOfflineNetwork1371
     * @tc.desc    Columns split mode at 371 probe 1371
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1371', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 371;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1371') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1372
     * @tc.name    ColumnsOfflineNetwork1372
     * @tc.desc    Columns split mode at 372 probe 1372
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1372', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 372;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1372') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1373
     * @tc.name    ColumnsOfflineNetwork1373
     * @tc.desc    Columns split mode at 373 probe 1373
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1373', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 373;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1373') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1374
     * @tc.name    ColumnsOfflineNetwork1374
     * @tc.desc    Columns split mode at 374 probe 1374
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1374', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 374;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1374') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1375
     * @tc.name    ColumnsOfflineNetwork1375
     * @tc.desc    Columns split mode at 375 probe 1375
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1375', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 375;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1375') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1376
     * @tc.name    ColumnsOfflineNetwork1376
     * @tc.desc    Columns split mode at 376 probe 1376
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1376', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 376;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1376') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1377
     * @tc.name    ColumnsOfflineNetwork1377
     * @tc.desc    Columns split mode at 377 probe 1377
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1377', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 377;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1377') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1378
     * @tc.name    ColumnsOfflineNetwork1378
     * @tc.desc    Columns split mode at 378 probe 1378
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1378', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 378;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1378') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1379
     * @tc.name    ColumnsOfflineNetwork1379
     * @tc.desc    Columns split mode at 379 probe 1379
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1379', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 379;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1379') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1380
     * @tc.name    ColumnsOfflineNetwork1380
     * @tc.desc    Columns split mode at 380 probe 1380
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1380', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 380;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1380') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1381
     * @tc.name    ColumnsOfflineNetwork1381
     * @tc.desc    Columns split mode at 381 probe 1381
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1381', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 381;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1381') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1382
     * @tc.name    ColumnsOfflineNetwork1382
     * @tc.desc    Columns split mode at 382 probe 1382
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1382', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 382;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1382') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1383
     * @tc.name    ColumnsOfflineNetwork1383
     * @tc.desc    Columns split mode at 383 probe 1383
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1383', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 383;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1383') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1384
     * @tc.name    ColumnsOfflineNetwork1384
     * @tc.desc    Columns split mode at 384 probe 1384
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1384', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 384;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1384') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1385
     * @tc.name    ColumnsOfflineNetwork1385
     * @tc.desc    Columns split mode at 385 probe 1385
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1385', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 385;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1385') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1386
     * @tc.name    ColumnsOfflineNetwork1386
     * @tc.desc    Columns split mode at 386 probe 1386
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1386', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 386;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1386') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_1387
     * @tc.name    ColumnsOfflineNetwork1387
     * @tc.desc    Columns split mode at 387 probe 1387
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOfflineNetwork1387', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 387;
      expect(m.isSplitMode(width)).assertEqual(width >= 600);
      expect(m.getMailByType('nohit1387') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

