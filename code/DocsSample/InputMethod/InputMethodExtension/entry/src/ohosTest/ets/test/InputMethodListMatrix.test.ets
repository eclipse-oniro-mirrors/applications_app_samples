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
import { LIST_PATTERN_COUNT } from '../../../main/ets/common/AppConstants';
import {
  FeatureEntry,
  FeatureId,
  FEATURES,
  declaredApiCount,
  featureById,
  filterFeatures,
  routes,
  uncoveredSummary
} from '../../../main/ets/model/FeatureCatalog';
import {
  PatternSpec,
  actionText,
  clampSelected,
  listSummary,
  patternSpecs,
  specAt
} from '../../../main/ets/utils/InputMethodListSession';

/**
 * 输入法列表与首页目录矩阵：模式项数量（0/1/2/超出）× 下标（-1/0/最后/越界）× 过滤关键字（空/标题/接口名/大小写/无命中）。
 * 列表数据是纯逻辑，对话框本身由系统填充；用例断言的是"页面声明的模式项"与"回调下标翻译"的规则。
 */
export default function inputMethodListMatrixTest() {
  describe('InputMethodListMatrixTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_0100
     * @tc.name testListMatrix0001
     * @tc.desc Verify the default pattern list matches the constant that the page also uses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0001', 0, () => {
      expect(patternSpecs().length).assertEqual(LIST_PATTERN_COUNT);
      expect(LIST_PATTERN_COUNT).assertEqual(2);
      expect(patternSpecs(0).length).assertEqual(0);
      expect(patternSpecs(1).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_0200
     * @tc.name testListMatrix0002
     * @tc.desc Verify each pattern spec keeps its index, label and hint aligned with the array position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0002', 0, () => {
      const specs = patternSpecs();
      expect(specs[0].index).assertEqual(0);
      expect(specs[0].labelText()).assertEqual('中文输入');
      expect(specs[1].index).assertEqual(1);
      expect(specs[1].labelText()).assertEqual('英文输入');
      expect(specs[1].hintText().includes('直接上屏')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_0300
     * @tc.name testListMatrix0003
     * @tc.desc Verify asking for more patterns than defined returns the defined ones instead of padding empty rows.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0003', 0, () => {
      expect(patternSpecs(3).length).assertEqual(2);
      expect(patternSpecs(99).length).assertEqual(2);
      expect(patternSpecs(3)[1].labelText()).assertEqual('英文输入');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_0400
     * @tc.name testListMatrix0004
     * @tc.desc Verify a negative count is treated by slice as drop the last item, which the page never passes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0004', 0, () => {
      expect(patternSpecs(-1).length).assertEqual(1);
      expect(patternSpecs(-1)[0].labelText()).assertEqual('中文输入');
      expect(patternSpecs(-5).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_0500
     * @tc.name testListMatrix0005
     * @tc.desc Verify the display string is one based and carries the hint for the dialog row.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0005', 0, () => {
      expect(patternSpecs()[0].display()).assertEqual('1. 中文输入（拼音候选，适用于文本编辑框）');
      expect(patternSpecs()[1].display()).assertEqual('2. 英文输入（直接上屏，适用于密码外的普通输入）');
      expect(new PatternSpec(2, 'x', 'y').display()).assertEqual('3. x（y）');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_0600
     * @tc.name testListMatrix0006
     * @tc.desc Verify a legal selected index is returned unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0006', 0, () => {
      expect(clampSelected(0, 2)).assertEqual(0);
      expect(clampSelected(1, 2)).assertEqual(1);
      expect(clampSelected(2, 5)).assertEqual(2);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_0700
     * @tc.name testListMatrix0007
     * @tc.desc Verify negative, equal to count and empty ranges all fall back to the first item.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0007', 0, () => {
      expect(clampSelected(-1, 2)).assertEqual(0);
      expect(clampSelected(-9, 2)).assertEqual(0);
      expect(clampSelected(2, 2)).assertEqual(0);
      expect(clampSelected(0, 0)).assertEqual(0);
      expect(clampSelected(5, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_0800
     * @tc.name testListMatrix0008
     * @tc.desc Verify specAt answers for both ends and rejects negative, equal and empty ranges with undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0008', 0, () => {
      expect(specAt(0)?.labelText()).assertEqual('中文输入');
      expect(specAt(1)?.labelText()).assertEqual('英文输入');
      expect(specAt(2) === undefined).assertTrue();
      expect(specAt(-1) === undefined).assertTrue();
      expect(specAt(0, []) === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_0900
     * @tc.name testListMatrix0009
     * @tc.desc Verify the summary lists every label and states which item is selected by default.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0009', 0, () => {
      const summary = listSummary();
      // 前缀就是条目数，列表长度一旦变化第一个断言就会先红
      expect(summary.startsWith('2 ')).assertTrue();
      expect(summary).assertEqual('2 个模式项：中文输入、英文输入；默认选中第 1 项');
      expect(summary.includes('、')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_1000
     * @tc.name testListMatrix0010
     * @tc.desc Verify the summary handles an empty list and a single item without a dangling separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0010', 0, () => {
      expect(listSummary([])).assertEqual('没有模式项');
      const single = listSummary(patternSpecs(1));
      expect(single).assertEqual('1 个模式项：中文输入；默认选中第 1 项');
      expect(single.includes('、')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_1100
     * @tc.name testListMatrix0011
     * @tc.desc Verify a legal callback index is translated to the pattern the user picked.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0011', 0, () => {
      expect(actionText(0)).assertEqual('回调下标 0：中文输入');
      expect(actionText(1)).assertEqual('回调下标 1：英文输入');
      expect(actionText(0, patternSpecs(1))).assertEqual('回调下标 0：中文输入');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_1200
     * @tc.name testListMatrix0012
     * @tc.desc Verify an illegal callback index is reported as out of range or empty and never as the first item.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0012', 0, () => {
      expect(actionText(2)).assertEqual('回调下标 2：超出范围（共 2 项）');
      expect(actionText(-1).includes('超出范围')).assertTrue();
      expect(actionText(0, [])).assertEqual('回调下标 0：列表为空，无可选项');
      expect(actionText(5, patternSpecs(1)).includes('共 1 项')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_1300
     * @tc.name testListMatrix0013
     * @tc.desc Verify the home catalog declares exactly the three implemented demo pages.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0013', 0, () => {
      expect(FEATURES.length).assertEqual(3);
      expect(FEATURES[0].id).assertEqual(FeatureId.EXTRA);
      expect(FEATURES[1].id).assertEqual(FeatureId.LIST);
      expect(FEATURES[2].id).assertEqual(FeatureId.PANEL);
      expect(FEATURES.every((item: FeatureEntry) => item.apis.length > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_1400
     * @tc.name testListMatrix0014
     * @tc.desc Verify the declared API count equals the sum per page so the catalog cannot drift silently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0014', 0, () => {
      expect(FEATURES[0].apiCount()).assertEqual(4);
      expect(FEATURES[1].apiCount()).assertEqual(3);
      expect(FEATURES[2].apiCount()).assertEqual(4);
      expect(declaredApiCount()).assertEqual(11);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_1500
     * @tc.name testListMatrix0015
     * @tc.desc Verify an unknown feature id falls back to the first entry instead of returning undefined to the page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0015', 0, () => {
      expect(featureById(FeatureId.EXTRA).titleText()).assertEqual('扩展信息');
      expect(featureById(FeatureId.PANEL).titleText()).assertEqual('面板与模式');
      expect(featureById('unknown' as FeatureId).titleText()).assertEqual('扩展信息');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_1600
     * @tc.name testListMatrix0016
     * @tc.desc Verify every catalog entry points at a page route registered by the demo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0016', 0, () => {
      const all = routes();
      expect(all.length).assertEqual(3);
      expect(all[0]).assertEqual('pages/demos/ExtraConfigDemo');
      expect(all[1]).assertEqual('pages/demos/InputMethodListDemo');
      expect(all[2]).assertEqual('pages/demos/PanelDemo');
      expect(all.every((item: string) => item.startsWith('pages/demos/'))).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_1700
     * @tc.name testListMatrix0017
     * @tc.desc Verify an empty or blank keyword keeps every entry so the home page starts with a full list.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0017', 0, () => {
      expect(filterFeatures('').length).assertEqual(3);
      expect(filterFeatures('   ').length).assertEqual(3);
      // 制表符与换行同样被当作空白，不会当成关键字筛掉全部条目
      expect(filterFeatures('\t').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_1800
     * @tc.name testListMatrix0018
     * @tc.desc Verify a title keyword narrows the list to the matching page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0018', 0, () => {
      const hit = filterFeatures('面板');
      expect(hit.length).assertEqual(1);
      expect(hit[0].id).assertEqual(FeatureId.PANEL);
      expect(filterFeatures('扩展').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_1900
     * @tc.name testListMatrix0019
     * @tc.desc Verify the search ignores case for both title and API names.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0019', 0, () => {
      expect(filterFeatures('PANEL').length).assertEqual(1);
      expect(filterFeatures('panel').length).assertEqual(1);
      expect(filterFeatures('inputmethodlistdialog').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_2000
     * @tc.name testListMatrix0020
     * @tc.desc Verify searching a covered API name returns the page that documents it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0020', 0, () => {
      const hit = filterFeatures('CustomValueType');
      expect(hit.length).assertEqual(1);
      expect(hit[0].id).assertEqual(FeatureId.EXTRA);
      expect(filterFeatures('createPanel')[0].id).assertEqual(FeatureId.PANEL);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_2100
     * @tc.name testListMatrix0021
     * @tc.desc Verify an unmatched keyword returns an empty list instead of everything.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0021', 0, () => {
      expect(filterFeatures('zzz').length).assertEqual(0);
      // 大写同样命中不到，说明大小写归一化没有把不存在的关键字放行
      expect(filterFeatures('ZZZ').length).assertEqual(0);
      expect(filterFeatures('不存在的接口').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LISTM_2200
     * @tc.name testListMatrix0022
     * @tc.desc Verify the uncovered list names both capabilities and carries a reason for each,
     * never a bare not supported claim.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testListMatrix0022', 0, () => {
      const summary = uncoveredSummary();
      expect(summary.includes('InputMethodExtensionAbility 真实输入')).assertTrue();
      expect(summary.includes('inputMethodEngine')).assertTrue();
      expect(summary.includes('；')).assertTrue();
      expect(summary.includes('不支持')).assertFalse();
      expect(FEATURES[0].apiSummary().includes('、')).assertTrue();
    });
  });
}
