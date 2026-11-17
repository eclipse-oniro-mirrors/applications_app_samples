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

/**
 * 中间截断（truncateMiddle）的取值交叉矩阵。
 *
 * 截断只在「最大长度」小于原文长度时才插入省略号，因此按 max 从小到大铺开，
 * 分成「原样返回」与「真的截断」两组，每组同时断言结果、长度与是否含省略号，
 * 避免只比较结果放过长度算错。
 *
 * 本文件从 FormatCrossMatrix 拆出，用例编号沿用 SUB_BLUETOOTH_FMT_CROSS_0121~0232，
 * 名称仍是 formatCross<NNNN>，与 @tc.number、@tc.name 逐字对应。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { truncateMiddle } from '../../../main/ets/utils/FormatUtil';

export default function bluetoothProfileFormatTruncateCrossTest() {
  describe('BluetoothProfileFormatTruncateCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0121
     * @tc.name formatCross0121
     * @tc.desc Verify truncateMiddle with max 0 returns an intact text.
     */
    it('formatCross0121', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 0);
      expect(cut).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(cut.length).assertEqual(17);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0122
     * @tc.name formatCross0122
     * @tc.desc Verify truncateMiddle with max 1 returns an intact text.
     */
    it('formatCross0122', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 1);
      expect(cut).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(cut.length).assertEqual(17);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0123
     * @tc.name formatCross0123
     * @tc.desc Verify truncateMiddle with max 2 returns an intact text.
     */
    it('formatCross0123', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 2);
      expect(cut).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(cut.length).assertEqual(17);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0124
     * @tc.name formatCross0124
     * @tc.desc Verify truncateMiddle with max 3 returns an intact text.
     */
    it('formatCross0124', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 3);
      expect(cut).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(cut.length).assertEqual(17);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0125
     * @tc.name formatCross0125
     * @tc.desc Verify truncateMiddle with max 4 returns a cut text.
     */
    it('formatCross0125', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 4);
      expect(cut).assertEqual('A1…6');
      expect(cut.length).assertEqual(4);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0126
     * @tc.name formatCross0126
     * @tc.desc Verify truncateMiddle with max 5 returns a cut text.
     */
    it('formatCross0126', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 5);
      expect(cut).assertEqual('A1…F6');
      expect(cut.length).assertEqual(5);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0127
     * @tc.name formatCross0127
     * @tc.desc Verify truncateMiddle with max 6 returns a cut text.
     */
    it('formatCross0127', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 6);
      expect(cut).assertEqual('A1:…F6');
      expect(cut.length).assertEqual(6);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0128
     * @tc.name formatCross0128
     * @tc.desc Verify truncateMiddle with max 7 returns a cut text.
     */
    it('formatCross0128', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 7);
      expect(cut).assertEqual('A1:…:F6');
      expect(cut.length).assertEqual(7);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0129
     * @tc.name formatCross0129
     * @tc.desc Verify truncateMiddle with max 8 returns a cut text.
     */
    it('formatCross0129', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 8);
      expect(cut).assertEqual('A1:B…:F6');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0130
     * @tc.name formatCross0130
     * @tc.desc Verify truncateMiddle with max 10 returns a cut text.
     */
    it('formatCross0130', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 10);
      expect(cut).assertEqual('A1:B2…5:F6');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0131
     * @tc.name formatCross0131
     * @tc.desc Verify truncateMiddle with max 12 returns a cut text.
     */
    it('formatCross0131', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 12);
      expect(cut).assertEqual('A1:B2:…E5:F6');
      expect(cut.length).assertEqual(12);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0132
     * @tc.name formatCross0132
     * @tc.desc Verify truncateMiddle with max 16 returns a cut text.
     */
    it('formatCross0132', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 16);
      expect(cut).assertEqual('A1:B2:C3…4:E5:F6');
      expect(cut.length).assertEqual(16);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0133
     * @tc.name formatCross0133
     * @tc.desc Verify truncateMiddle with max 20 returns an intact text.
     */
    it('formatCross0133', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 20);
      expect(cut).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(cut.length).assertEqual(17);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0134
     * @tc.name formatCross0134
     * @tc.desc Verify truncateMiddle with max 24 returns an intact text.
     */
    it('formatCross0134', 0, () => {
      const text: string = 'A1:B2:C3:D4:E5:F6';
      const cut: string = truncateMiddle(text, 24);
      expect(cut).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(cut.length).assertEqual(17);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0135
     * @tc.name formatCross0135
     * @tc.desc Verify truncateMiddle with max 0 returns an intact text.
     */
    it('formatCross0135', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 0);
      expect(cut).assertEqual('hfp.createHfpAgProfile');
      expect(cut.length).assertEqual(22);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0136
     * @tc.name formatCross0136
     * @tc.desc Verify truncateMiddle with max 1 returns an intact text.
     */
    it('formatCross0136', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 1);
      expect(cut).assertEqual('hfp.createHfpAgProfile');
      expect(cut.length).assertEqual(22);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0137
     * @tc.name formatCross0137
     * @tc.desc Verify truncateMiddle with max 2 returns an intact text.
     */
    it('formatCross0137', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 2);
      expect(cut).assertEqual('hfp.createHfpAgProfile');
      expect(cut.length).assertEqual(22);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0138
     * @tc.name formatCross0138
     * @tc.desc Verify truncateMiddle with max 3 returns an intact text.
     */
    it('formatCross0138', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 3);
      expect(cut).assertEqual('hfp.createHfpAgProfile');
      expect(cut.length).assertEqual(22);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0139
     * @tc.name formatCross0139
     * @tc.desc Verify truncateMiddle with max 4 returns a cut text.
     */
    it('formatCross0139', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 4);
      expect(cut).assertEqual('hf…e');
      expect(cut.length).assertEqual(4);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0140
     * @tc.name formatCross0140
     * @tc.desc Verify truncateMiddle with max 5 returns a cut text.
     */
    it('formatCross0140', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 5);
      expect(cut).assertEqual('hf…le');
      expect(cut.length).assertEqual(5);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0141
     * @tc.name formatCross0141
     * @tc.desc Verify truncateMiddle with max 6 returns a cut text.
     */
    it('formatCross0141', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 6);
      expect(cut).assertEqual('hfp…le');
      expect(cut.length).assertEqual(6);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0142
     * @tc.name formatCross0142
     * @tc.desc Verify truncateMiddle with max 7 returns a cut text.
     */
    it('formatCross0142', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 7);
      expect(cut).assertEqual('hfp…ile');
      expect(cut.length).assertEqual(7);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0143
     * @tc.name formatCross0143
     * @tc.desc Verify truncateMiddle with max 8 returns a cut text.
     */
    it('formatCross0143', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 8);
      expect(cut).assertEqual('hfp.…ile');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0144
     * @tc.name formatCross0144
     * @tc.desc Verify truncateMiddle with max 10 returns a cut text.
     */
    it('formatCross0144', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 10);
      expect(cut).assertEqual('hfp.c…file');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0145
     * @tc.name formatCross0145
     * @tc.desc Verify truncateMiddle with max 12 returns a cut text.
     */
    it('formatCross0145', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 12);
      expect(cut).assertEqual('hfp.cr…ofile');
      expect(cut.length).assertEqual(12);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0146
     * @tc.name formatCross0146
     * @tc.desc Verify truncateMiddle with max 16 returns a cut text.
     */
    it('formatCross0146', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 16);
      expect(cut).assertEqual('hfp.crea…Profile');
      expect(cut.length).assertEqual(16);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0147
     * @tc.name formatCross0147
     * @tc.desc Verify truncateMiddle with max 20 returns a cut text.
     */
    it('formatCross0147', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 20);
      expect(cut).assertEqual('hfp.create…AgProfile');
      expect(cut.length).assertEqual(20);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0148
     * @tc.name formatCross0148
     * @tc.desc Verify truncateMiddle with max 24 returns an intact text.
     */
    it('formatCross0148', 0, () => {
      const text: string = 'hfp.createHfpAgProfile';
      const cut: string = truncateMiddle(text, 24);
      expect(cut).assertEqual('hfp.createHfpAgProfile');
      expect(cut.length).assertEqual(22);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0149
     * @tc.name formatCross0149
     * @tc.desc Verify truncateMiddle with max 0 returns an intact text.
     */
    it('formatCross0149', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 0);
      expect(cut).assertEqual('蓝牙 Profile 示例');
      expect(cut.length).assertEqual(13);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0150
     * @tc.name formatCross0150
     * @tc.desc Verify truncateMiddle with max 1 returns an intact text.
     */
    it('formatCross0150', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 1);
      expect(cut).assertEqual('蓝牙 Profile 示例');
      expect(cut.length).assertEqual(13);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0151
     * @tc.name formatCross0151
     * @tc.desc Verify truncateMiddle with max 2 returns an intact text.
     */
    it('formatCross0151', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 2);
      expect(cut).assertEqual('蓝牙 Profile 示例');
      expect(cut.length).assertEqual(13);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0152
     * @tc.name formatCross0152
     * @tc.desc Verify truncateMiddle with max 3 returns an intact text.
     */
    it('formatCross0152', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 3);
      expect(cut).assertEqual('蓝牙 Profile 示例');
      expect(cut.length).assertEqual(13);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0153
     * @tc.name formatCross0153
     * @tc.desc Verify truncateMiddle with max 4 returns a cut text.
     */
    it('formatCross0153', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 4);
      expect(cut).assertEqual('蓝牙…例');
      expect(cut.length).assertEqual(4);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0154
     * @tc.name formatCross0154
     * @tc.desc Verify truncateMiddle with max 5 returns a cut text.
     */
    it('formatCross0154', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 5);
      expect(cut).assertEqual('蓝牙…示例');
      expect(cut.length).assertEqual(5);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0155
     * @tc.name formatCross0155
     * @tc.desc Verify truncateMiddle with max 6 returns a cut text.
     */
    it('formatCross0155', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 6);
      expect(cut).assertEqual('蓝牙 …示例');
      expect(cut.length).assertEqual(6);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0156
     * @tc.name formatCross0156
     * @tc.desc Verify truncateMiddle with max 7 returns a cut text.
     */
    it('formatCross0156', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 7);
      expect(cut).assertEqual('蓝牙 … 示例');
      expect(cut.length).assertEqual(7);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0157
     * @tc.name formatCross0157
     * @tc.desc Verify truncateMiddle with max 8 returns a cut text.
     */
    it('formatCross0157', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 8);
      expect(cut).assertEqual('蓝牙 P… 示例');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0158
     * @tc.name formatCross0158
     * @tc.desc Verify truncateMiddle with max 10 returns a cut text.
     */
    it('formatCross0158', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 10);
      expect(cut).assertEqual('蓝牙 Pr…e 示例');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0159
     * @tc.name formatCross0159
     * @tc.desc Verify truncateMiddle with max 12 returns a cut text.
     */
    it('formatCross0159', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 12);
      expect(cut).assertEqual('蓝牙 Pro…le 示例');
      expect(cut.length).assertEqual(12);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0160
     * @tc.name formatCross0160
     * @tc.desc Verify truncateMiddle with max 16 returns an intact text.
     */
    it('formatCross0160', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 16);
      expect(cut).assertEqual('蓝牙 Profile 示例');
      expect(cut.length).assertEqual(13);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0161
     * @tc.name formatCross0161
     * @tc.desc Verify truncateMiddle with max 20 returns an intact text.
     */
    it('formatCross0161', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 20);
      expect(cut).assertEqual('蓝牙 Profile 示例');
      expect(cut.length).assertEqual(13);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0162
     * @tc.name formatCross0162
     * @tc.desc Verify truncateMiddle with max 24 returns an intact text.
     */
    it('formatCross0162', 0, () => {
      const text: string = '蓝牙 Profile 示例';
      const cut: string = truncateMiddle(text, 24);
      expect(cut).assertEqual('蓝牙 Profile 示例');
      expect(cut.length).assertEqual(13);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0163
     * @tc.name formatCross0163
     * @tc.desc Verify truncateMiddle with max 0 returns an intact text.
     */
    it('formatCross0163', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 0);
      expect(cut).assertEqual('AG（音频网关）');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0164
     * @tc.name formatCross0164
     * @tc.desc Verify truncateMiddle with max 1 returns an intact text.
     */
    it('formatCross0164', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 1);
      expect(cut).assertEqual('AG（音频网关）');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0165
     * @tc.name formatCross0165
     * @tc.desc Verify truncateMiddle with max 2 returns an intact text.
     */
    it('formatCross0165', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 2);
      expect(cut).assertEqual('AG（音频网关）');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0166
     * @tc.name formatCross0166
     * @tc.desc Verify truncateMiddle with max 3 returns an intact text.
     */
    it('formatCross0166', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 3);
      expect(cut).assertEqual('AG（音频网关）');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0167
     * @tc.name formatCross0167
     * @tc.desc Verify truncateMiddle with max 4 returns a cut text.
     */
    it('formatCross0167', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 4);
      expect(cut).assertEqual('AG…）');
      expect(cut.length).assertEqual(4);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0168
     * @tc.name formatCross0168
     * @tc.desc Verify truncateMiddle with max 5 returns a cut text.
     */
    it('formatCross0168', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 5);
      expect(cut).assertEqual('AG…关）');
      expect(cut.length).assertEqual(5);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0169
     * @tc.name formatCross0169
     * @tc.desc Verify truncateMiddle with max 6 returns a cut text.
     */
    it('formatCross0169', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 6);
      expect(cut).assertEqual('AG（…关）');
      expect(cut.length).assertEqual(6);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0170
     * @tc.name formatCross0170
     * @tc.desc Verify truncateMiddle with max 7 returns a cut text.
     */
    it('formatCross0170', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 7);
      expect(cut).assertEqual('AG（…网关）');
      expect(cut.length).assertEqual(7);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0171
     * @tc.name formatCross0171
     * @tc.desc Verify truncateMiddle with max 8 returns an intact text.
     */
    it('formatCross0171', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 8);
      expect(cut).assertEqual('AG（音频网关）');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0172
     * @tc.name formatCross0172
     * @tc.desc Verify truncateMiddle with max 10 returns an intact text.
     */
    it('formatCross0172', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 10);
      expect(cut).assertEqual('AG（音频网关）');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0173
     * @tc.name formatCross0173
     * @tc.desc Verify truncateMiddle with max 12 returns an intact text.
     */
    it('formatCross0173', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 12);
      expect(cut).assertEqual('AG（音频网关）');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0174
     * @tc.name formatCross0174
     * @tc.desc Verify truncateMiddle with max 16 returns an intact text.
     */
    it('formatCross0174', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 16);
      expect(cut).assertEqual('AG（音频网关）');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0175
     * @tc.name formatCross0175
     * @tc.desc Verify truncateMiddle with max 20 returns an intact text.
     */
    it('formatCross0175', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 20);
      expect(cut).assertEqual('AG（音频网关）');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0176
     * @tc.name formatCross0176
     * @tc.desc Verify truncateMiddle with max 24 returns an intact text.
     */
    it('formatCross0176', 0, () => {
      const text: string = 'AG（音频网关）';
      const cut: string = truncateMiddle(text, 24);
      expect(cut).assertEqual('AG（音频网关）');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0177
     * @tc.name formatCross0177
     * @tc.desc Verify truncateMiddle with max 0 returns an intact text.
     */
    it('formatCross0177', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 0);
      expect(cut).assertEqual('getConnectedDevices');
      expect(cut.length).assertEqual(19);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0178
     * @tc.name formatCross0178
     * @tc.desc Verify truncateMiddle with max 1 returns an intact text.
     */
    it('formatCross0178', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 1);
      expect(cut).assertEqual('getConnectedDevices');
      expect(cut.length).assertEqual(19);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0179
     * @tc.name formatCross0179
     * @tc.desc Verify truncateMiddle with max 2 returns an intact text.
     */
    it('formatCross0179', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 2);
      expect(cut).assertEqual('getConnectedDevices');
      expect(cut.length).assertEqual(19);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0180
     * @tc.name formatCross0180
     * @tc.desc Verify truncateMiddle with max 3 returns an intact text.
     */
    it('formatCross0180', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 3);
      expect(cut).assertEqual('getConnectedDevices');
      expect(cut.length).assertEqual(19);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0181
     * @tc.name formatCross0181
     * @tc.desc Verify truncateMiddle with max 4 returns a cut text.
     */
    it('formatCross0181', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 4);
      expect(cut).assertEqual('ge…s');
      expect(cut.length).assertEqual(4);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0182
     * @tc.name formatCross0182
     * @tc.desc Verify truncateMiddle with max 5 returns a cut text.
     */
    it('formatCross0182', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 5);
      expect(cut).assertEqual('ge…es');
      expect(cut.length).assertEqual(5);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0183
     * @tc.name formatCross0183
     * @tc.desc Verify truncateMiddle with max 6 returns a cut text.
     */
    it('formatCross0183', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 6);
      expect(cut).assertEqual('get…es');
      expect(cut.length).assertEqual(6);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0184
     * @tc.name formatCross0184
     * @tc.desc Verify truncateMiddle with max 7 returns a cut text.
     */
    it('formatCross0184', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 7);
      expect(cut).assertEqual('get…ces');
      expect(cut.length).assertEqual(7);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0185
     * @tc.name formatCross0185
     * @tc.desc Verify truncateMiddle with max 8 returns a cut text.
     */
    it('formatCross0185', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 8);
      expect(cut).assertEqual('getC…ces');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0186
     * @tc.name formatCross0186
     * @tc.desc Verify truncateMiddle with max 10 returns a cut text.
     */
    it('formatCross0186', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 10);
      expect(cut).assertEqual('getCo…ices');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0187
     * @tc.name formatCross0187
     * @tc.desc Verify truncateMiddle with max 12 returns a cut text.
     */
    it('formatCross0187', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 12);
      expect(cut).assertEqual('getCon…vices');
      expect(cut.length).assertEqual(12);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0188
     * @tc.name formatCross0188
     * @tc.desc Verify truncateMiddle with max 16 returns a cut text.
     */
    it('formatCross0188', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 16);
      expect(cut).assertEqual('getConne…Devices');
      expect(cut.length).assertEqual(16);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0189
     * @tc.name formatCross0189
     * @tc.desc Verify truncateMiddle with max 20 returns an intact text.
     */
    it('formatCross0189', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 20);
      expect(cut).assertEqual('getConnectedDevices');
      expect(cut.length).assertEqual(19);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0190
     * @tc.name formatCross0190
     * @tc.desc Verify truncateMiddle with max 24 returns an intact text.
     */
    it('formatCross0190', 0, () => {
      const text: string = 'getConnectedDevices';
      const cut: string = truncateMiddle(text, 24);
      expect(cut).assertEqual('getConnectedDevices');
      expect(cut.length).assertEqual(19);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0191
     * @tc.name formatCross0191
     * @tc.desc Verify truncateMiddle with max 0 returns an intact text.
     */
    it('formatCross0191', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 0);
      expect(cut).assertEqual('ProfileSession');
      expect(cut.length).assertEqual(14);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0192
     * @tc.name formatCross0192
     * @tc.desc Verify truncateMiddle with max 1 returns an intact text.
     */
    it('formatCross0192', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 1);
      expect(cut).assertEqual('ProfileSession');
      expect(cut.length).assertEqual(14);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0193
     * @tc.name formatCross0193
     * @tc.desc Verify truncateMiddle with max 2 returns an intact text.
     */
    it('formatCross0193', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 2);
      expect(cut).assertEqual('ProfileSession');
      expect(cut.length).assertEqual(14);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0194
     * @tc.name formatCross0194
     * @tc.desc Verify truncateMiddle with max 3 returns an intact text.
     */
    it('formatCross0194', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 3);
      expect(cut).assertEqual('ProfileSession');
      expect(cut.length).assertEqual(14);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0195
     * @tc.name formatCross0195
     * @tc.desc Verify truncateMiddle with max 4 returns a cut text.
     */
    it('formatCross0195', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 4);
      expect(cut).assertEqual('Pr…n');
      expect(cut.length).assertEqual(4);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0196
     * @tc.name formatCross0196
     * @tc.desc Verify truncateMiddle with max 5 returns a cut text.
     */
    it('formatCross0196', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 5);
      expect(cut).assertEqual('Pr…on');
      expect(cut.length).assertEqual(5);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0197
     * @tc.name formatCross0197
     * @tc.desc Verify truncateMiddle with max 6 returns a cut text.
     */
    it('formatCross0197', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 6);
      expect(cut).assertEqual('Pro…on');
      expect(cut.length).assertEqual(6);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0198
     * @tc.name formatCross0198
     * @tc.desc Verify truncateMiddle with max 7 returns a cut text.
     */
    it('formatCross0198', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 7);
      expect(cut).assertEqual('Pro…ion');
      expect(cut.length).assertEqual(7);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0199
     * @tc.name formatCross0199
     * @tc.desc Verify truncateMiddle with max 8 returns a cut text.
     */
    it('formatCross0199', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 8);
      expect(cut).assertEqual('Prof…ion');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0200
     * @tc.name formatCross0200
     * @tc.desc Verify truncateMiddle with max 10 returns a cut text.
     */
    it('formatCross0200', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 10);
      expect(cut).assertEqual('Profi…sion');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0201
     * @tc.name formatCross0201
     * @tc.desc Verify truncateMiddle with max 12 returns a cut text.
     */
    it('formatCross0201', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 12);
      expect(cut).assertEqual('Profil…ssion');
      expect(cut.length).assertEqual(12);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0202
     * @tc.name formatCross0202
     * @tc.desc Verify truncateMiddle with max 16 returns an intact text.
     */
    it('formatCross0202', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 16);
      expect(cut).assertEqual('ProfileSession');
      expect(cut.length).assertEqual(14);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0203
     * @tc.name formatCross0203
     * @tc.desc Verify truncateMiddle with max 20 returns an intact text.
     */
    it('formatCross0203', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 20);
      expect(cut).assertEqual('ProfileSession');
      expect(cut.length).assertEqual(14);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0204
     * @tc.name formatCross0204
     * @tc.desc Verify truncateMiddle with max 24 returns an intact text.
     */
    it('formatCross0204', 0, () => {
      const text: string = 'ProfileSession';
      const cut: string = truncateMiddle(text, 24);
      expect(cut).assertEqual('ProfileSession');
      expect(cut.length).assertEqual(14);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0205
     * @tc.name formatCross0205
     * @tc.desc Verify truncateMiddle with max 0 returns an intact text.
     */
    it('formatCross0205', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 0);
      expect(cut).assertEqual('0123456789');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0206
     * @tc.name formatCross0206
     * @tc.desc Verify truncateMiddle with max 1 returns an intact text.
     */
    it('formatCross0206', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 1);
      expect(cut).assertEqual('0123456789');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0207
     * @tc.name formatCross0207
     * @tc.desc Verify truncateMiddle with max 2 returns an intact text.
     */
    it('formatCross0207', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 2);
      expect(cut).assertEqual('0123456789');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0208
     * @tc.name formatCross0208
     * @tc.desc Verify truncateMiddle with max 3 returns an intact text.
     */
    it('formatCross0208', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 3);
      expect(cut).assertEqual('0123456789');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0209
     * @tc.name formatCross0209
     * @tc.desc Verify truncateMiddle with max 4 returns a cut text.
     */
    it('formatCross0209', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 4);
      expect(cut).assertEqual('01…9');
      expect(cut.length).assertEqual(4);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0210
     * @tc.name formatCross0210
     * @tc.desc Verify truncateMiddle with max 5 returns a cut text.
     */
    it('formatCross0210', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 5);
      expect(cut).assertEqual('01…89');
      expect(cut.length).assertEqual(5);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0211
     * @tc.name formatCross0211
     * @tc.desc Verify truncateMiddle with max 6 returns a cut text.
     */
    it('formatCross0211', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 6);
      expect(cut).assertEqual('012…89');
      expect(cut.length).assertEqual(6);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0212
     * @tc.name formatCross0212
     * @tc.desc Verify truncateMiddle with max 7 returns a cut text.
     */
    it('formatCross0212', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 7);
      expect(cut).assertEqual('012…789');
      expect(cut.length).assertEqual(7);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0213
     * @tc.name formatCross0213
     * @tc.desc Verify truncateMiddle with max 8 returns a cut text.
     */
    it('formatCross0213', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 8);
      expect(cut).assertEqual('0123…789');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0214
     * @tc.name formatCross0214
     * @tc.desc Verify truncateMiddle with max 10 returns an intact text.
     */
    it('formatCross0214', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 10);
      expect(cut).assertEqual('0123456789');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0215
     * @tc.name formatCross0215
     * @tc.desc Verify truncateMiddle with max 12 returns an intact text.
     */
    it('formatCross0215', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 12);
      expect(cut).assertEqual('0123456789');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0216
     * @tc.name formatCross0216
     * @tc.desc Verify truncateMiddle with max 16 returns an intact text.
     */
    it('formatCross0216', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 16);
      expect(cut).assertEqual('0123456789');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0217
     * @tc.name formatCross0217
     * @tc.desc Verify truncateMiddle with max 20 returns an intact text.
     */
    it('formatCross0217', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 20);
      expect(cut).assertEqual('0123456789');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0218
     * @tc.name formatCross0218
     * @tc.desc Verify truncateMiddle with max 24 returns an intact text.
     */
    it('formatCross0218', 0, () => {
      const text: string = '0123456789';
      const cut: string = truncateMiddle(text, 24);
      expect(cut).assertEqual('0123456789');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0219
     * @tc.name formatCross0219
     * @tc.desc Verify truncateMiddle with max 0 returns an intact text.
     */
    it('formatCross0219', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 0);
      expect(cut).assertEqual('abcdefghijklmnopqrstuvwxyz');
      expect(cut.length).assertEqual(26);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0220
     * @tc.name formatCross0220
     * @tc.desc Verify truncateMiddle with max 1 returns an intact text.
     */
    it('formatCross0220', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 1);
      expect(cut).assertEqual('abcdefghijklmnopqrstuvwxyz');
      expect(cut.length).assertEqual(26);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0221
     * @tc.name formatCross0221
     * @tc.desc Verify truncateMiddle with max 2 returns an intact text.
     */
    it('formatCross0221', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 2);
      expect(cut).assertEqual('abcdefghijklmnopqrstuvwxyz');
      expect(cut.length).assertEqual(26);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0222
     * @tc.name formatCross0222
     * @tc.desc Verify truncateMiddle with max 3 returns an intact text.
     */
    it('formatCross0222', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 3);
      expect(cut).assertEqual('abcdefghijklmnopqrstuvwxyz');
      expect(cut.length).assertEqual(26);
      expect(cut.indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0223
     * @tc.name formatCross0223
     * @tc.desc Verify truncateMiddle with max 4 returns a cut text.
     */
    it('formatCross0223', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 4);
      expect(cut).assertEqual('ab…z');
      expect(cut.length).assertEqual(4);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0224
     * @tc.name formatCross0224
     * @tc.desc Verify truncateMiddle with max 5 returns a cut text.
     */
    it('formatCross0224', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 5);
      expect(cut).assertEqual('ab…yz');
      expect(cut.length).assertEqual(5);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0225
     * @tc.name formatCross0225
     * @tc.desc Verify truncateMiddle with max 6 returns a cut text.
     */
    it('formatCross0225', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 6);
      expect(cut).assertEqual('abc…yz');
      expect(cut.length).assertEqual(6);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0226
     * @tc.name formatCross0226
     * @tc.desc Verify truncateMiddle with max 7 returns a cut text.
     */
    it('formatCross0226', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 7);
      expect(cut).assertEqual('abc…xyz');
      expect(cut.length).assertEqual(7);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0227
     * @tc.name formatCross0227
     * @tc.desc Verify truncateMiddle with max 8 returns a cut text.
     */
    it('formatCross0227', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 8);
      expect(cut).assertEqual('abcd…xyz');
      expect(cut.length).assertEqual(8);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0228
     * @tc.name formatCross0228
     * @tc.desc Verify truncateMiddle with max 10 returns a cut text.
     */
    it('formatCross0228', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 10);
      expect(cut).assertEqual('abcde…wxyz');
      expect(cut.length).assertEqual(10);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0229
     * @tc.name formatCross0229
     * @tc.desc Verify truncateMiddle with max 12 returns a cut text.
     */
    it('formatCross0229', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 12);
      expect(cut).assertEqual('abcdef…vwxyz');
      expect(cut.length).assertEqual(12);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0230
     * @tc.name formatCross0230
     * @tc.desc Verify truncateMiddle with max 16 returns a cut text.
     */
    it('formatCross0230', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 16);
      expect(cut).assertEqual('abcdefgh…tuvwxyz');
      expect(cut.length).assertEqual(16);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0231
     * @tc.name formatCross0231
     * @tc.desc Verify truncateMiddle with max 20 returns a cut text.
     */
    it('formatCross0231', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 20);
      expect(cut).assertEqual('abcdefghij…rstuvwxyz');
      expect(cut.length).assertEqual(20);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FMT_CROSS_0232
     * @tc.name formatCross0232
     * @tc.desc Verify truncateMiddle with max 24 returns a cut text.
     */
    it('formatCross0232', 0, () => {
      const text: string = 'abcdefghijklmnopqrstuvwxyz';
      const cut: string = truncateMiddle(text, 24);
      expect(cut).assertEqual('abcdefghijkl…pqrstuvwxyz');
      expect(cut.length).assertEqual(24);
      expect(cut.indexOf('…') >= 0).assertEqual(true);
    });
  });
}
