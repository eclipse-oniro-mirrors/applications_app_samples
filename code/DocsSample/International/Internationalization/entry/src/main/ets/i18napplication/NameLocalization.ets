/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import TitleBar from '../component/TitleBar';
import { assertEqual, assertEqualFuzzy } from '../component/AssertEqual';
import { resourceToString } from '../component/ResourceToString';
// [Start import_module]
import { i18n } from '@kit.LocalizationKit';
// [End import_module]

/**********************************
 * 本地化语言与地区名称开发步骤
 **********************************/
// [Start localized_language_names]
let displayLanguage = i18n.System.getDisplayLanguage('de', 'zh-Hans-CN'); // displayLanguage = '德文'
// language: 语言两字母代码，如'zh'，'de'，'fr'等
// locale: 表示区域ID的字符串，如'en-GB'、'en-US'、'zh-Hans-CN'等
// sentenceCase: 返回的语言名称是否需要首字母大写，默认值：true
// [End localized_language_names]

// [Start localized_country_names]
let displayCountry = i18n.System.getDisplayCountry('SA', 'en-GB'); // displayCountry = 'Saudi Arabia'
// country: 国家/地区两字母代码，如'CN'、'DE'、'SA'等
// locale: 表示区域ID的字符串，如'en-GB'、'en-US'、'zh-Hans-CN'等
// sentenceCase: 返回的国家/地区名称是否需要首字母大写，默认值：true
// [End localized_country_names]

/**********************************
 * 本地化时区名称开发步骤
 **********************************/
// [Start localized_timezone_names]
let timezone = i18n.getTimeZone('America/Sao_Paulo');
let timeZoneName = timezone.getDisplayName('zh-Hans', true); // 巴西利亚标准时间
// [End localized_timezone_names]

/**********************************
 * 获取系统区域与DateTimeFormat开发步骤
 **********************************/
// [Start system_locale_datetimeformat]
// 获取系统区域对象
let locale = i18n.System.getSystemLocaleInstance();

// 如果接口入参是区域ID（string类型），则通过toString()获取系统区域ID
let dateTimeFormat = new Intl.DateTimeFormat(locale.toString());

// 如果接口入参是区域对象（Intl.Locale类型），则直接使用系统区域对象
let simpleDateTimeFormat = i18n.getSimpleDateTimeFormatBySkeleton('yMd', locale);
// [End system_locale_datetimeformat]

/**********************************
 * 获取最佳匹配语言开发步骤
 **********************************/
// [Start best_match_locale]
let systemLanguage = i18n.System.getSimplifiedLanguage();
// languagesList根据应用实际需要进行配置。例如，当应用不需要区分不同的繁体中文时，可将'zh-Hant-HK'和'zh-Hant-TW'合并成'zh-Hant'
let languagesList = ['zh-Hans', 'zh-Hant-HK', 'zh-Hant-TW'];
let matchedLanguage = i18n.I18NUtil.getBestMatchLocale(systemLanguage, languagesList);
switch (matchedLanguage) {
  case 'zh-Hans':
    // 系统语言为简体中文
    break;
  case 'zh-Hant-HK':
    // 系统语言为繁体中文（香港）
    break;
  case 'zh-Hant-TW':
    // 系统语言为繁体中文（台湾）
    break;
  default:
    // 系统语言不属于languageList中的任何一种
}
// [End best_match_locale]

const expectedDisplayLanguage = resourceToString($r('app.string.ExpectedDisplayLanguage'));
const expectedDisplayCountry = 'Saudi Arabia';
const expectedTimeZoneName = [resourceToString($r('app.string.ExpectedTimeZoneName'))];

@Extend(Text)
function textStyle() {
  .fontSize(20)
  .margin({ top: 20, left: 20, right: 20 });
}

@Entry
@Component
struct NameLocalization {
  build() {
    Column() {
      TitleBar({ hasBackPress: true, title: $r('app.string.NameLocalization') })
      Text($r('app.string.ResultsOfLanguageRegion'))
        .textStyle()
        .fontWeight(FontWeight.Bold)
      Text(assertEqual(displayLanguage, expectedDisplayLanguage, $r('app.string.DisplayLanguage')))
        .textStyle()
      Text(assertEqual(displayCountry, expectedDisplayCountry, $r('app.string.DisplayCountry')))
        .textStyle()
      Text($r('app.string.ResultsOfDisplayTimezone'))
        .textStyle()
        .fontWeight(FontWeight.Bold)
      Text(assertEqualFuzzy(timeZoneName, expectedTimeZoneName, $r('app.string.ResultOfTimezoneName')))
        .textStyle()
      Text($r('app.string.ResultsOfSystemLocale'))
        .textStyle()
        .fontWeight(FontWeight.Bold)
      Text('DateTimeFormat区域ID: ' + dateTimeFormat.format(new Date()))
        .textStyle()
      Text('SimpleDateTimeFormat格式化: ' + simpleDateTimeFormat.format(new Date()))
        .textStyle()
      Text($r('app.string.ResultsOfBestMatchLocale'))
        .textStyle()
        .fontWeight(FontWeight.Bold)
      Text('matchedLanguage: ' + matchedLanguage)
        .textStyle()
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
  }
}