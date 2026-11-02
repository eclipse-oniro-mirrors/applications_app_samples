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
 
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { IconStyle, TitlePosition, BottomOffset } from '@kit.ArkUI';
import {
  InterstitialConfig, buildPrimaryButton, buildSecondaryButton, buildSheetInfos,
  ConfirmParams, AlertParams, SelectParams, TipsParams, LoadingParams, CustomParams
} from '../../../main/ets/model/DialogModels';

/**
 * DialogModels 工厂与参数类矩阵套件
 * 补充基线未覆盖的分支：按钮内容边界与实例隔离、SheetInfo 单条 / 空串 / 百条 / 回调隔离、
 * 插屏配置其余枚举组合与可变性、各参数类默认值与实例隔离
 */

export default function dialogModelsMatrixTest() {
  describe('dialogModelsMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_0100
     * @tc.name primaryContentUnicode001
     * @tc.desc Verify primary button keeps Chinese and emoji content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('primary_contentUnicode', 0, () => {
      const btn = buildPrimaryButton('立即开启🔔');
      expect(btn.content).assertEqual('立即开启🔔');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_0200
     * @tc.name primaryEmptyContent002
     * @tc.desc Verify an empty primary button content is stored as an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('primary_emptyContent', 0, () => {
      const btn = buildPrimaryButton('');
      expect(btn.content).assertEqual('');
      expect(btn.buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_0300
     * @tc.name primaryActionCalledTwice003
     * @tc.desc Verify the same action can be invoked multiple times and counts every call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('primary_actionCalledTwice', 0, () => {
      let calls: number = 0;
      const btn = buildPrimaryButton('重试', () => {
        calls++;
      });
      btn.action!();
      btn.action!();
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_0400
     * @tc.name buttonInstancesDistinct004
     * @tc.desc Verify two buttons built with identical content are distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('button_instancesDistinct', 0, () => {
      const first = buildPrimaryButton('确定');
      const second = buildPrimaryButton('确定');
      expect(first === second).assertFalse();
      expect(first.content).assertEqual(second.content);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_0500
     * @tc.name primarySecondaryActionsIndependent005
     * @tc.desc Verify invoking the primary action does not fire the secondary action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('primary_secondaryActionsIndependent', 0, () => {
      let primaryCalls: number = 0;
      let secondaryCalls: number = 0;
      const primary = buildPrimaryButton('主', () => {
        primaryCalls++;
      });
      const secondary = buildSecondaryButton('次', () => {
        secondaryCalls++;
      });
      primary.action!();
      expect(primaryCalls).assertEqual(1);
      expect(secondaryCalls).assertEqual(0);
      secondary.action!();
      expect(primaryCalls).assertEqual(1);
      expect(secondaryCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_0600
     * @tc.name buttonContentsIndependent006
     * @tc.desc Verify the primary and secondary builders keep their own content and style
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('button_contentsIndependent', 0, () => {
      const primary = buildPrimaryButton('保存并退出');
      const secondary = buildSecondaryButton('稍后');
      expect(primary.content).assertEqual('保存并退出');
      expect(secondary.content).assertEqual('稍后');
      expect(primary.buttonStyle === secondary.buttonStyle).assertFalse();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_0700
     * @tc.name sheetInfosSingleItem007
     * @tc.desc Verify a single label produces exactly one SheetInfo reporting index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_singleItem', 0, () => {
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['仅一项'], (index: number) => {
        picked = index;
      });
      expect(sheets.length).assertEqual(1);
      expect(sheets[0].title).assertEqual('仅一项');
      sheets[0].action!();
      expect(picked).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_0800
     * @tc.name sheetInfosUnicodeLabels008
     * @tc.desc Verify Chinese labels are kept verbatim in SheetInfo titles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_unicodeLabels', 0, () => {
      const sheets: SheetInfo[] = buildSheetInfos(['只看标题', '包含内容'], (index: number) => {
      });
      expect(sheets[0].title).assertEqual('只看标题');
      expect(sheets[1].title).assertEqual('包含内容');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_0900
     * @tc.name sheetInfosEmptyStringLabel009
     * @tc.desc Verify an empty-string label still produces a selectable row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_emptyStringLabel', 0, () => {
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['', 'B'], (index: number) => {
        picked = index;
      });
      expect(sheets.length).assertEqual(2);
      expect(sheets[0].title).assertEqual('');
      sheets[0].action!();
      expect(picked).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_1000
     * @tc.name sheetInfosActionRepeatable010
     * @tc.desc Verify a SheetInfo action can fire repeatedly and always reports the same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_actionRepeatable', 0, () => {
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['A', 'B'], (index: number) => {
        picked = index;
      });
      sheets[1].action!();
      expect(picked).assertEqual(1);
      picked = -1;
      sheets[1].action!();
      expect(picked).assertEqual(1);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_1100
     * @tc.name sheetInfosHundredItems011
     * @tc.desc Verify a 100-item label list keeps titles and index closures aligned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_hundredItems', 0, () => {
      const labels: string[] = [];
      for (let i = 0; i < 100; i++) {
        labels.push(`项${i}`);
      }
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(labels, (index: number) => {
        picked = index;
      });
      expect(sheets.length).assertEqual(100);
      expect(sheets[50].title).assertEqual('项50');
      sheets[99].action!();
      expect(picked).assertEqual(99);
      sheets[0].action!();
      expect(picked).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_1200
     * @tc.name sheetInfosCallbacksIsolated012
     * @tc.desc Verify two builds with different callbacks do not cross-fire
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_callbacksIsolated', 0, () => {
      let pickFirst: number = -1;
      let pickSecond: number = -1;
      const first: SheetInfo[] = buildSheetInfos(['A'], (index: number) => {
        pickFirst = index;
      });
      const second: SheetInfo[] = buildSheetInfos(['B'], (index: number) => {
        pickSecond = index;
      });
      first[0].action!();
      expect(pickFirst).assertEqual(0);
      expect(pickSecond).assertEqual(-1);
      second[0].action!();
      expect(pickSecond).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_1300
     * @tc.name sheetInfosOrderPreserved013
     * @tc.desc Verify SheetInfo order follows the labels array exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sheetInfos_orderPreserved', 0, () => {
      const sheets: SheetInfo[] = buildSheetInfos(['Z', 'Y', 'X'], (index: number) => {
      });
      expect(sheets[0].title).assertEqual('Z');
      expect(sheets[1].title).assertEqual('Y');
      expect(sheets[2].title).assertEqual('X');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_1400
     * @tc.name interstitialTopDarkBar014
     * @tc.desc Verify the alternative enum combination (TOP / DARK / OFFSET_FOR_BAR) is stored as given
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('interstitial_topDarkBar', 0, () => {
      const cfg: InterstitialConfig = new InterstitialConfig('活动', '限时',
        TitlePosition.TOP, IconStyle.DARK, BottomOffset.OFFSET_FOR_BAR);
      expect(cfg.titlePosition).assertEqual(TitlePosition.TOP);
      expect(cfg.iconStyle).assertEqual(IconStyle.DARK);
      expect(cfg.bottomOffsetType).assertEqual(BottomOffset.OFFSET_FOR_BAR);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_1500
     * @tc.name interstitialUnicodeTexts015
     * @tc.desc Verify Chinese title and subtitle are preserved by the interstitial config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('interstitial_unicodeTexts', 0, () => {
      const cfg: InterstitialConfig = new InterstitialConfig('版本更新提示', '立即体验新功能',
        TitlePosition.BOTTOM, IconStyle.LIGHT, BottomOffset.OFFSET_FOR_NONE);
      expect(cfg.title).assertEqual('版本更新提示');
      expect(cfg.subtitle).assertEqual('立即体验新功能');
      expect(cfg.title.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_1600
     * @tc.name interstitialEmptyTexts016
     * @tc.desc Verify empty title and subtitle are accepted without substitution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('interstitial_emptyTexts', 0, () => {
      const cfg: InterstitialConfig = new InterstitialConfig('', '',
        TitlePosition.BOTTOM, IconStyle.LIGHT, BottomOffset.OFFSET_FOR_NONE);
      expect(cfg.title).assertEqual('');
      expect(cfg.subtitle).assertEqual('');
      expect(cfg.subtitle.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_1700
     * @tc.name interstitialFieldsMutable017
     * @tc.desc Verify interstitial config fields can be reassigned after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('interstitial_fieldsMutable', 0, () => {
      const cfg: InterstitialConfig = new InterstitialConfig('旧标题', '旧副标题',
        TitlePosition.BOTTOM, IconStyle.LIGHT, BottomOffset.OFFSET_FOR_NONE);
      cfg.title = '新标题';
      cfg.subtitle = '新副标题';
      cfg.titlePosition = TitlePosition.TOP;
      cfg.iconStyle = IconStyle.DARK;
      cfg.bottomOffsetType = BottomOffset.OFFSET_FOR_BAR;
      expect(cfg.title).assertEqual('新标题');
      expect(cfg.subtitle).assertEqual('新副标题');
      expect(cfg.titlePosition).assertEqual(TitlePosition.TOP);
      expect(cfg.iconStyle).assertEqual(IconStyle.DARK);
      expect(cfg.bottomOffsetType).assertEqual(BottomOffset.OFFSET_FOR_BAR);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_1800
     * @tc.name interstitialInstancesIsolated018
     * @tc.desc Verify two interstitial configs do not share field values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('interstitial_instancesIsolated', 0, () => {
      const first: InterstitialConfig = new InterstitialConfig('A', 'a',
        TitlePosition.TOP, IconStyle.DARK, BottomOffset.OFFSET_FOR_BAR);
      const second: InterstitialConfig = new InterstitialConfig('B', 'b',
        TitlePosition.BOTTOM, IconStyle.LIGHT, BottomOffset.OFFSET_FOR_NONE);
      first.title = 'A2';
      expect(first.title).assertEqual('A2');
      expect(second.title).assertEqual('B');
      expect(first.iconStyle).assertEqual(IconStyle.DARK);
      expect(second.iconStyle).assertEqual(IconStyle.LIGHT);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_1900
     * @tc.name confirmParamsDefaults019
     * @tc.desc Verify ConfirmParams defaults: scene 1, empty texts, no buttons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('confirmParams_defaults', 0, () => {
      const p = new ConfirmParams();
      expect(p.sceneId).assertEqual(1);
      expect(p.title).assertEqual('');
      expect(p.content).assertEqual('');
      expect(p.checkTips).assertEqual('');
      expect(p.primaryButton === null).assertTrue();
      expect(p.secondaryButton === null).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_2000
     * @tc.name alertParamsDefaults020
     * @tc.desc Verify AlertParams defaults: scene 2, empty titles, no buttons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('alertParams_defaults', 0, () => {
      const p = new AlertParams();
      expect(p.sceneId).assertEqual(2);
      expect(p.primaryTitle).assertEqual('');
      expect(p.secondaryTitle).assertEqual('');
      expect(p.content).assertEqual('');
      expect(p.primaryButton === null).assertTrue();
      expect(p.secondaryButton === null).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_2100
     * @tc.name selectParamsDefaults021
     * @tc.desc Verify SelectParams defaults: scene 3, index 0, empty radio list, no confirm
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('selectParams_defaults', 0, () => {
      const p = new SelectParams();
      expect(p.sceneId).assertEqual(3);
      expect(p.title).assertEqual('');
      expect(p.content).assertEqual('');
      expect(p.selectedIndex).assertEqual(0);
      expect(p.radioContent.length).assertEqual(0);
      expect(p.confirm === null).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_2200
     * @tc.name tipsParamsDefaults022
     * @tc.desc Verify TipsParams defaults and that imageRes accepts a string resource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tipsParams_defaults', 0, () => {
      const p = new TipsParams();
      expect(p.sceneId).assertEqual(4);
      expect(p.title).assertEqual('');
      expect(p.content).assertEqual('');
      expect(p.checkTips).assertEqual('');
      expect(p.primaryButton === null).assertTrue();
      expect(p.secondaryButton === null).assertTrue();
      p.imageRes = 'icon://custom';
      expect(p.imageRes).assertEqual('icon://custom');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_2300
     * @tc.name loadingParamsDefaults023
     * @tc.desc Verify LoadingParams defaults: scene 5 and empty content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('loadingParams_defaults', 0, () => {
      const p = new LoadingParams();
      expect(p.sceneId).assertEqual(5);
      expect(p.content).assertEqual('');
      expect(p.content.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_2400
     * @tc.name paramsSceneIdsDistinct024
     * @tc.desc Verify the six parameter classes carry pairwise distinct scene ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('params_sceneIdsDistinct', 0, () => {
      const ids: number[] = [
        new ConfirmParams().sceneId,
        new AlertParams().sceneId,
        new SelectParams().sceneId,
        new TipsParams().sceneId,
        new LoadingParams().sceneId,
        new CustomParams().sceneId
      ];
      let unique: number = 0;
      for (let i = 0; i < ids.length; i++) {
        let seen: boolean = false;
        for (let j = 0; j < i; j++) {
          if (ids[j] === ids[i]) {
            seen = true;
          }
        }
        if (!seen) {
          unique++;
        }
      }
      expect(unique).assertEqual(6);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_2500
     * @tc.name customParamsButtonOrder025
     * @tc.desc Verify custom dialog buttons keep their push order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('customParams_buttonOrder', 0, () => {
      const p = new CustomParams();
      p.buttons.push(buildPrimaryButton('重置'));
      p.buttons.push(buildSecondaryButton('保存'));
      expect(p.buttons.length).assertEqual(2);
      expect(p.buttons[0].content).assertEqual('重置');
      expect(p.buttons[1].content).assertEqual('保存');
      expect(p.buttons[0].buttonStyle).assertEqual(ButtonStyleMode.EMPHASIZED);
      expect(p.buttons[1].buttonStyle).assertEqual(ButtonStyleMode.TEXTUAL);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_DIALOGMODELSMATRIX_2600
     * @tc.name customParamsButtonsAppendable026
     * @tc.desc Verify the buttons array accepts repeated appends and reports the last button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('customParams_buttonsAppendable', 0, () => {
      const p = new CustomParams();
      for (let i = 1; i <= 5; i++) {
        p.buttons.push(buildSecondaryButton(`按钮${i}`));
      }
      expect(p.buttons.length).assertEqual(5);
      expect(p.buttons[4].content).assertEqual('按钮5');
    });
  });
}
