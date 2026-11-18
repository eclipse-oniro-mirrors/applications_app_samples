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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import type { common } from '@kit.AbilityKit';
import type { resourceManager } from '@kit.LocalizationKit';

// 首页三段文案：标题“通用互联”、入口“附近设备”、入口“我的”
const HOME_TITLE: string = '通用互联';
const ENTRY_NEARBY: string = '附近设备';
const ENTRY_MINE: string = '我的';

// 首页文案属于应用主模块的资源表，测试模块自己的资源表里没有对应 id，
// 必须通过主模块的 resourceManager 读取。模块名在部分整机上是 entry，旧整机上是 tv，这里做兼容。
function appResourceManager(): resourceManager.ResourceManager {
  const context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  try {
    return context.createModuleContext('entry').resourceManager;
  } catch (err) {
    return context.createModuleContext('tv').resourceManager;
  }
}

function textByName(name: string): string {
  return appResourceManager().getStringByNameSync(name);
}

export default function homeTextsTest(): void {
  describe('HomeTextsTest', () => {
    beforeAll(() => {
      console.info('[Suite] HomeTextsTest start');
    });

    afterAll(() => {
      console.info('[Suite] HomeTextsTest end');
    });

    it('home_title_text_is_general_connect', 0, () => {
      expect(
        textByName('ability_label')
      ).assertEqual(
        HOME_TITLE
      );
    });

    it('home_nearby_entry_text_is_nearby_device', 0, () => {
      expect(
        textByName('tab_scan')
      ).assertEqual(
        ENTRY_NEARBY
      );
    });

    it('home_mine_entry_text_is_mine', 0, () => {
      expect(
        textByName('tab_personal')
      ).assertEqual(
        ENTRY_MINE
      );
    });

    it('home_title_text_is_not_empty', 0, () => {
      expect(
        textByName('ability_label').length > 0
      ).assertTrue();
    });

    it('home_nearby_entry_text_is_not_empty', 0, () => {
      expect(
        textByName('tab_scan').length > 0
      ).assertTrue();
    });

    it('home_mine_entry_text_is_not_empty', 0, () => {
      expect(
        textByName('tab_personal').length > 0
      ).assertTrue();
    });

    it('home_three_texts_are_distinct', 0, () => {
      const title: string = textByName('ability_label');
      const nearby: string = textByName('tab_scan');
      const mine: string = textByName('tab_personal');
      expect(
        title === nearby
      ).assertFalse();
      expect(
        title === mine
      ).assertFalse();
      expect(
        nearby === mine
      ).assertFalse();
    });

    it('home_texts_have_no_line_break', 0, () => {
      expect(
        textByName('ability_label').indexOf('\n') < 0
      ).assertTrue();
      expect(
        textByName('tab_scan').indexOf('\n') < 0
      ).assertTrue();
      expect(
        textByName('tab_personal').indexOf('\n') < 0
      ).assertTrue();
    });

    it('home_texts_have_no_surrounding_space', 0, () => {
      expect(
        textByName('ability_label').trim() === textByName('ability_label')
      ).assertTrue();
      expect(
        textByName('tab_scan').trim() === textByName('tab_scan')
      ).assertTrue();
      expect(
        textByName('tab_personal').trim() === textByName('tab_personal')
      ).assertTrue();
    });

    it('home_texts_are_chinese', 0, () => {
      const regex: RegExp = /^[\u4e00-\u9fa5]+$/;
      expect(
        regex.test(textByName('ability_label'))
      ).assertTrue();
      expect(
        regex.test(textByName('tab_scan'))
      ).assertTrue();
      expect(
        regex.test(textByName('tab_personal'))
      ).assertTrue();
    });
  });
}
