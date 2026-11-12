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
import { Country } from '@ohos/mine/src/main/ets/model/entity/Country';
import { Language } from '@ohos/mine/src/main/ets/model/entity/Language';
import { CommErr } from '@ohos/mine/src/main/ets/model/utils/CommErr';
import { JsonUtil } from '@ohos/mine/src/main/ets/model/utils/JsonUtil';
import { InternationalManager } from '@ohos/mine/src/main/ets/model/manager/InternationalManager';

// 我的页面与设置项的中文文案，用于校验资源表接线是否正确
const MINE_TITLE: string = '我的';
const MINE_SETTINGS: string = '设置';
const MINE_LANGUAGE: string = '语言';
const MINE_ABOUT: string = '关于';
const MINE_DEVICE_SYNC: string = '设备库同步';
const MINE_SCENE_SYNC: string = '场景库同步';
const MINE_LOGIN: string = '点击登录';

// 应用主模块（tv）的资源管理器，测试模块自己的资源表里没有这些字符串
function appResourceManager(): resourceManager.ResourceManager {
  const context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  try {
    return context.createModuleContext('tv').resourceManager;
  } catch (err) {
    return context.createModuleContext('entry').resourceManager;
  }
}

function textByName(name: string): string {
  return appResourceManager().getStringByNameSync(name);
}

// JsonUtil.parseToClass 的目标对象，字段与测试 JSON 对应
class JsonSample {
  public name: string = '';
  public age: number = 0;
  public active: boolean = false;
}

function createJsonSample(): JsonSample {
  return new JsonSample();
}

export default function minePageTest(): void {
  describe('MinePageTest', () => {
    beforeAll(() => {
      console.info('[Suite] MinePageTest start');
    });

    afterAll(() => {
      console.info('[Suite] MinePageTest end');
    });

    it('mine_page_title_is_mine', 0, () => {
      expect(
        textByName('page_mine')
      ).assertEqual(
        MINE_TITLE
      );
    });

    it('mine_settings_item_text', 0, () => {
      expect(
        textByName('page_settings')
      ).assertEqual(
        MINE_SETTINGS
      );
    });

    it('mine_language_item_text', 0, () => {
      expect(
        textByName('page_settings_language')
      ).assertEqual(
        MINE_LANGUAGE
      );
    });

    it('mine_about_item_text', 0, () => {
      expect(
        textByName('page_settings_about')
      ).assertEqual(
        MINE_ABOUT
      );
    });

    it('mine_device_sync_item_text', 0, () => {
      expect(
        textByName('page_device_store_sync')
      ).assertEqual(
        MINE_DEVICE_SYNC
      );
    });

    it('mine_scene_sync_item_text', 0, () => {
      expect(
        textByName('page_scene_store_sync')
      ).assertEqual(
        MINE_SCENE_SYNC
      );
    });

    it('mine_login_prompt_text', 0, () => {
      expect(
        textByName('click_to_login')
      ).assertEqual(
        MINE_LOGIN
      );
    });

    it('mine_menu_texts_are_distinct', 0, () => {
      const texts: string[] = [
        textByName('page_mine'),
        textByName('page_settings'),
        textByName('page_settings_language'),
        textByName('page_settings_about'),
        textByName('page_device_store_sync'),
        textByName('page_scene_store_sync'),
        textByName('click_to_login')
      ];
      expect(
        texts.length
      ).assertEqual(
        new Set<string>(texts).size
      );
    });

    it('country_fields_are_stored', 0, () => {
      const country: Country = new Country('CN', 'zh');
      expect(
        country.countryCode
      ).assertEqual(
        'CN'
      );
      expect(
        country.displayCode
      ).assertEqual(
        'zh'
      );
    });

    it('country_display_is_not_empty', 0, () => {
      const country: Country = new Country('CN', 'zh');
      expect(
        country.countryDisplay.length > 0
      ).assertTrue();
    });

    it('country_display_is_stable', 0, () => {
      const first: Country = new Country('CN', 'zh');
      const second: Country = new Country('CN', 'zh');
      expect(
        first.countryDisplay
      ).assertEqual(
        second.countryDisplay
      );
    });

    it('country_different_code_gives_different_display', 0, () => {
      const china: Country = new Country('CN', 'en');
      const america: Country = new Country('US', 'en');
      expect(
        china.countryDisplay === america.countryDisplay
      ).assertFalse();
    });

    it('country_unknown_code_keeps_raw_code', 0, () => {
      const unknown: Country = new Country('ZZ', 'en');
      expect(
        unknown.countryCode
      ).assertEqual(
        'ZZ'
      );
      expect(
        typeof unknown.countryDisplay
      ).assertEqual(
        'string'
      );
    });

    it('language_fields_are_stored', 0, () => {
      const language: Language = new Language('zh', 'zh');
      expect(
        language.languageCode
      ).assertEqual(
        'zh'
      );
      expect(
        language.displayCode
      ).assertEqual(
        'zh'
      );
    });

    it('language_follow_system_default_is_false', 0, () => {
      const language: Language = new Language('zh', 'zh');
      expect(
        language.isFollowSystemLanguage
      ).assertFalse();
    });

    it('language_follow_system_can_be_enabled', 0, () => {
      const language: Language = new Language('en', 'en');
      language.isFollowSystemLanguage = true;
      expect(
        language.isFollowSystemLanguage
      ).assertTrue();
    });

    it('language_display_is_not_empty', 0, () => {
      const language: Language = new Language('zh', 'zh');
      expect(
        (language.languageDisplay as string).length > 0
      ).assertTrue();
    });

    it('language_different_code_gives_different_display', 0, () => {
      const chinese: Language = new Language('zh', 'en');
      const english: Language = new Language('en', 'en');
      expect(
        (chinese.languageDisplay as string) === (english.languageDisplay as string)
      ).assertFalse();
    });

    it('comm_err_stores_code_and_msg', 0, () => {
      const err: CommErr = new CommErr(500, 'server error');
      expect(
        err.code
      ).assertEqual(
        500
      );
      expect(
        err.msg
      ).assertEqual(
        'server error'
      );
    });

    it('comm_err_is_error_instance', 0, () => {
      const err: CommErr = new CommErr(1, 'x');
      expect(
        err instanceof Error
      ).assertTrue();
    });

    it('comm_err_keeps_negative_code', 0, () => {
      const err: CommErr = new CommErr(-1, 'negative');
      expect(
        err.code
      ).assertEqual(
        -1
      );
    });

    it('comm_err_message_is_empty_by_default', 0, () => {
      const err: CommErr = new CommErr(2, 'ignored');
      expect(
        err.message
      ).assertEqual(
        ''
      );
    });

    it('comm_err_instances_are_independent', 0, () => {
      const first: CommErr = new CommErr(1, 'first');
      const second: CommErr = new CommErr(2, 'second');
      expect(
        first.code === second.code
      ).assertFalse();
      expect(
        first.msg
      ).assertEqual(
        'first'
      );
    });

    it('json_parse_maps_all_fields', 0, () => {
      const result = JsonUtil.parseToClass<JsonSample>('{"name":"ohos","age":18,"active":true}', {
        createClassTarget: () => createJsonSample()
      });
      expect(
        result?.name
      ).assertEqual(
        'ohos'
      );
      expect(
        result?.age
      ).assertEqual(
        18
      );
      expect(
        result?.active
      ).assertTrue();
    });

    it('json_parse_keeps_field_types', 0, () => {
      const result = JsonUtil.parseToClass<JsonSample>('{"age":7}', {
        createClassTarget: () => createJsonSample()
      });
      expect(
        typeof result?.age
      ).assertEqual(
        'number'
      );
      expect(
        typeof result?.name
      ).assertEqual(
        'string'
      );
    });

    it('json_parse_empty_object_keeps_defaults', 0, () => {
      const result = JsonUtil.parseToClass<JsonSample>('{}', {
        createClassTarget: () => createJsonSample()
      });
      expect(
        result?.name
      ).assertEqual(
        ''
      );
      expect(
        result?.age
      ).assertEqual(
        0
      );
      expect(
        result?.active
      ).assertFalse();
    });

    it('json_parse_invalid_json_returns_null', 0, () => {
      const result = JsonUtil.parseToClass<JsonSample>('not a json', {
        createClassTarget: () => createJsonSample()
      });
      expect(
        result === null
      ).assertTrue();
    });

    it('json_parse_empty_string_returns_null', 0, () => {
      const result = JsonUtil.parseToClass<JsonSample>('', {
        createClassTarget: () => createJsonSample()
      });
      expect(
        result === null
      ).assertTrue();
    });

    it('json_parse_undefined_returns_null', 0, () => {
      const result = JsonUtil.parseToClass<JsonSample>(undefined, {
        createClassTarget: () => createJsonSample()
      });
      expect(
        result === null
      ).assertTrue();
    });

    it('json_parse_null_returns_null', 0, () => {
      const result = JsonUtil.parseToClass<JsonSample>(null, {
        createClassTarget: () => createJsonSample()
      });
      expect(
        result === null
      ).assertTrue();
    });

    it('json_parse_missing_field_keeps_default', 0, () => {
      const result = JsonUtil.parseToClass<JsonSample>('{"name":"only"}', {
        createClassTarget: () => createJsonSample()
      });
      expect(
        result?.age
      ).assertEqual(
        0
      );
      expect(
        result?.active
      ).assertFalse();
    });

    it('international_manager_country_key', 0, () => {
      expect(
        InternationalManager.CURRENT_COUNTRY_KEY
      ).assertEqual(
        'current_country'
      );
    });

    it('international_manager_language_key', 0, () => {
      expect(
        InternationalManager.CURRENT_LANGUAGE_KEY
      ).assertEqual(
        'current_language'
      );
    });

    it('international_manager_available_languages_key', 0, () => {
      expect(
        InternationalManager.AVAILABLE_LANGUAGES
      ).assertEqual(
        'available_language'
      );
    });
  });
}
