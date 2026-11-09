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

import { describe, expect, it } from '@ohos/hypium';
import { AppColors } from '../../../main/ets/common/Theme';
import { WidgetTone, toneSoftColor, toneTextColor } from '../../../main/ets/components/CommonWidgets';
import { outcomeRow, outcomeRows, outcomeTone } from '../../../main/ets/components/OutcomeView';
import { ResultRow, rowOf } from '../../../main/ets/components/ResultList';
import {
  ApiStatus,
  CallOutcome,
  emptyOutcome,
  failedOutcome,
  invalidOutcome,
  okOutcome
} from '../../../main/ets/model/CallOutcome';
import { defaultOutcomes } from '../../../main/ets/utils/ExtraConfigSession';

/** 有语义的四个 tone：它们各自有一对"深字 + 浅底"颜色 */
const SEMANTIC_TONES: WidgetTone[] = [
  WidgetTone.PRIMARY, WidgetTone.SUCCESS, WidgetTone.WARNING, WidgetTone.DANGER
];

/** 与 Theme 套件同一套亮度公式，用来判断"文字比底色更深" */
function luma(hex: string): number {
  const value = hex.replace('#', '');
  const r = parseInt(value.substring(0, 2), 16);
  const g = parseInt(value.substring(2, 4), 16);
  const b = parseInt(value.substring(4, 6), 16);
  return Math.round(0.299 * r + 0.587 * g + 0.114 * b);
}

/** Theme 里登记的全部颜色：映射出来的颜色必须落在这个集合里，不能手写新色值 */
function themeColors(): string[] {
  return [
    AppColors.PAGE_BG, AppColors.CARD_BG, AppColors.PRIMARY, AppColors.PRIMARY_SOFT,
    AppColors.SUBTLE_BG, AppColors.SOFT_BG, AppColors.TEXT_PRIMARY, AppColors.TEXT_SECONDARY,
    AppColors.TEXT_TERTIARY, AppColors.TEXT_MUTED, AppColors.TEXT_STRONG, AppColors.DANGER,
    AppColors.DANGER_SOFT, AppColors.WARNING, AppColors.WARNING_SOFT, AppColors.SUCCESS,
    AppColors.SUCCESS_SOFT, AppColors.GRADIENT_PRIMARY, AppColors.GRADIENT_SECONDARY, AppColors.WHITE
  ];
}

/**
 * 展示层绑定：tone → 颜色、CallOutcome → 行。
 *
 * CommonWidgets 的注释写明这两个映射"做成纯函数，既方便页面复用，也能在本地单测里直接断言"，
 * 本套件就是那条断言。它们此前零覆盖，而一旦把某个 tone 的颜色写错或把成功/失败映射反了，
 * 页面照样渲染、纯逻辑用例照样全绿——只是红绿颠倒了。所以这里断言的是"哪一类结果配哪一档色"。
 */
export default function inputMethodViewBindingTest() {
  describe('InputMethodViewBindingTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_VIEW_0100
     * @tc.name testViewBinding0001
     * @tc.desc Verify each tone resolves to its own text colour instead of falling through to the default.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testViewBinding0001', 0, () => {
      expect(toneTextColor(WidgetTone.PRIMARY)).assertEqual(AppColors.PRIMARY);
      expect(toneTextColor(WidgetTone.SUCCESS)).assertEqual(AppColors.SUCCESS);
      expect(toneTextColor(WidgetTone.WARNING)).assertEqual(AppColors.WARNING);
      expect(toneTextColor(WidgetTone.DANGER)).assertEqual(AppColors.DANGER);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VIEW_0200
     * @tc.name testViewBinding0002
     * @tc.desc Verify each tone resolves to its own soft background colour instead of falling through.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testViewBinding0002', 0, () => {
      expect(toneSoftColor(WidgetTone.PRIMARY)).assertEqual(AppColors.PRIMARY_SOFT);
      expect(toneSoftColor(WidgetTone.SUCCESS)).assertEqual(AppColors.SUCCESS_SOFT);
      expect(toneSoftColor(WidgetTone.WARNING)).assertEqual(AppColors.WARNING_SOFT);
      expect(toneSoftColor(WidgetTone.DANGER)).assertEqual(AppColors.DANGER_SOFT);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VIEW_0300
     * @tc.name testViewBinding0003
     * @tc.desc Verify the neutral tone takes the default branch: secondary text on the subtle background.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testViewBinding0003', 0, () => {
      expect(toneTextColor(WidgetTone.NEUTRAL)).assertEqual(AppColors.TEXT_SECONDARY);
      expect(toneSoftColor(WidgetTone.NEUTRAL)).assertEqual(AppColors.SOFT_BG);
      expect(toneTextColor(WidgetTone.NEUTRAL) !== toneTextColor(WidgetTone.PRIMARY)).assertTrue();
      expect(toneSoftColor(WidgetTone.NEUTRAL) !== toneSoftColor(WidgetTone.PRIMARY)).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VIEW_0400
     * @tc.name testViewBinding0004
     * @tc.desc Verify every tone colour is one of the twenty Theme constants, so no ad hoc hex slips in.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testViewBinding0004', 0, () => {
      const palette: string[] = themeColors();
      expect(palette.length).assertEqual(20);
      SEMANTIC_TONES.forEach((tone: WidgetTone) => {
        expect(palette.includes(toneTextColor(tone))).assertTrue();
        expect(palette.includes(toneSoftColor(tone))).assertTrue();
      });
      expect(palette.includes(toneTextColor(WidgetTone.NEUTRAL))).assertTrue();
      expect(palette.includes(toneSoftColor(WidgetTone.NEUTRAL))).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VIEW_0500
     * @tc.name testViewBinding0005
     * @tc.desc Verify the text colour of each semantic tone is darker than its own soft background.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testViewBinding0005', 0, () => {
      SEMANTIC_TONES.forEach((tone: WidgetTone) => {
        expect(luma(toneTextColor(tone)) < luma(toneSoftColor(tone))).assertTrue();
        // 文字色也不能是纯白，否则在浅底上根本看不见
        expect(luma(toneTextColor(tone)) < luma(AppColors.WHITE)).assertTrue();
      });
      // 四个语义词各用一种文字色，否则“语义”在视觉上就退化成一种颜色
      const textColors: string[] = [];
      SEMANTIC_TONES.forEach((tone: WidgetTone) => {
        const color: string = toneTextColor(tone);
        if (!textColors.includes(color)) {
          textColors.push(color);
        }
      });
      expect(textColors.length).assertEqual(SEMANTIC_TONES.length);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VIEW_0600
     * @tc.name testViewBinding0006
     * @tc.desc Verify the six ApiStatus values map to the tones the pages promise: green ok, yellow expected, red rest.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testViewBinding0006', 0, () => {
      expect(outcomeTone(ApiStatus.OK)).assertEqual(WidgetTone.SUCCESS);
      expect(outcomeTone(ApiStatus.INPUT_METHOD)).assertEqual(WidgetTone.WARNING);
      expect(outcomeTone(ApiStatus.INVALID_INPUT)).assertEqual(WidgetTone.WARNING);
      expect(outcomeTone(ApiStatus.EMPTY_RESULT)).assertEqual(WidgetTone.DANGER);
      expect(outcomeTone(ApiStatus.INTERNAL)).assertEqual(WidgetTone.DANGER);
      expect(outcomeTone(ApiStatus.UNSUPPORTED)).assertEqual(WidgetTone.DANGER);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VIEW_0700
     * @tc.name testViewBinding0007
     * @tc.desc Verify a row carries describe and describeDetail unchanged, so phone reports match on screen text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testViewBinding0007', 0, () => {
      const ok: CallOutcome = okOutcome('probe', '正常', '细节说明', 12);
      const row: ResultRow = outcomeRow(ok);
      expect(row.title).assertEqual(ok.describe());
      expect(row.title).assertEqual('probe → 成功：正常');
      expect(row.detail).assertEqual('细节说明');
      expect(row.tone).assertEqual(WidgetTone.SUCCESS);
      expect(outcomeRow(failedOutcome('probe', ApiStatus.INPUT_METHOD, 12800004, '身份不符', 'd', 5)).tone)
        .assertEqual(WidgetTone.WARNING);
      expect(outcomeRow(invalidOutcome('probe', 'd')).tone).assertEqual(WidgetTone.WARNING);
      expect(outcomeRow(emptyOutcome('probe', 'd', 1)).tone).assertEqual(WidgetTone.DANGER);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VIEW_0800
     * @tc.name testViewBinding0008
     * @tc.desc Verify the batch mapping keeps the six demo results in order and keeps the oversized one yellow.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testViewBinding0008', 0, () => {
      const outcomes: CallOutcome[] = defaultOutcomes();
      const rows: ResultRow[] = outcomeRows(outcomes);
      expect(rows.length).assertEqual(outcomes.length);
      expect(rows.length).assertEqual(6);
      expect(rows[0].title).assertEqual(outcomes[0].describe());
      expect(rows[5].title).assertEqual(outcomes[5].describe());
      expect(rows[0].tone).assertEqual(WidgetTone.SUCCESS);
      expect(rows[3].tone).assertEqual(WidgetTone.SUCCESS);
      expect(outcomes[4].status).assertEqual(ApiStatus.INVALID_INPUT);
      expect(rows[4].tone).assertEqual(WidgetTone.WARNING);
      expect(rows[5].tone).assertEqual(WidgetTone.SUCCESS);
      expect(outcomeRows([]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VIEW_0900
     * @tc.name testViewBinding0009
     * @tc.desc Verify the boolean shortcut never produces a neutral or warning row, only green or red.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testViewBinding0009', 0, () => {
      const good: ResultRow = rowOf(true, '已打开', '细节');
      const bad: ResultRow = rowOf(false, '打开失败', '细节');
      expect(good.tone).assertEqual(WidgetTone.SUCCESS);
      expect(bad.tone).assertEqual(WidgetTone.DANGER);
      expect(good.title).assertEqual('已打开');
      expect(bad.title).assertEqual('打开失败');
      expect(good.detail).assertEqual('细节');
      expect(bad.detail).assertEqual('细节');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_VIEW_1000
     * @tc.name testViewBinding0010
     * @tc.desc Verify an empty detail stays empty, which is the value the result list uses to hide the second line.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testViewBinding0010', 0, () => {
      const row: ResultRow = new ResultRow('标题', '', WidgetTone.NEUTRAL);
      expect(row.detail).assertEqual('');
      expect(row.detail.length).assertEqual(0);
      expect(row.title).assertEqual('标题');
      expect(row.tone).assertEqual(WidgetTone.NEUTRAL);
    });
  });
}
