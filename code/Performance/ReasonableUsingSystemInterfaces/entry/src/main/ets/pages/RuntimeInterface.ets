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

// 导入自定义打点模块
import { hiTraceMeter, hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0000;
const TAG: string = 'RuntimeInterface';
const LOOP_COUNT: number = 100;

/**
 * “国际化使用Localization Kit接口替换ArkTS运行时接口” - 反例：使用ArkTS运行时接口Intl
 * 循环创建国际化对象，记录每次创建的耗时和总执行耗时
 */
function runIntlBenchmark(): void {
  hiTraceMeter.startTrace('RelativeTimeFormat-100', 1);
  try {
    for (let i: number = 0; i < LOOP_COUNT; i++) {
      hiTraceMeter.startTrace('RelativeTimeFormat-single', 2);
      try {
        new Intl.RelativeTimeFormat('zh-CN', { numeric: 'auto' });
      } finally {
        hiTraceMeter.finishTrace('RelativeTimeFormat-single', 2);
      }
    }
  } finally {
    hiTraceMeter.finishTrace('RelativeTimeFormat-100', 1);
  }

  hiTraceMeter.startTrace('Locale-100', 3);
  try {
    for (let i: number = 0; i < LOOP_COUNT; i++) {
      hiTraceMeter.startTrace('Locale-single', 4);
      try {
        new Intl.Locale('zh-CN');
      } finally {
        hiTraceMeter.finishTrace('Locale-single', 4);
      }
    }
  } finally {
    hiTraceMeter.finishTrace('Locale-100', 3);
  }

  hiTraceMeter.startTrace('DateTimeFormat-100', 5);
  try {
    for (let i: number = 0; i < LOOP_COUNT; i++) {
      hiTraceMeter.startTrace('DateTimeFormat-single', 6);
      try {
        new Intl.DateTimeFormat('zh-CN', { dateStyle: 'full', timeStyle: 'medium' });
      } finally {
        hiTraceMeter.finishTrace('DateTimeFormat-single', 6);
      }
    }
  } finally {
    hiTraceMeter.finishTrace('DateTimeFormat-100', 5);
  }

  hiTraceMeter.startTrace('NumberFormat-100', 7);
  try {
    for (let i: number = 0; i < LOOP_COUNT; i++) {
      hiTraceMeter.startTrace('NumberFormat-single', 8);
      try {
        new Intl.NumberFormat('en-GB', { style: 'decimal', notation: 'scientific' });
      } finally {
        hiTraceMeter.finishTrace('NumberFormat-single', 8);
      }
    }
  } finally {
    hiTraceMeter.finishTrace('NumberFormat-100', 7);
  }

  hiTraceMeter.startTrace('Collator-100', 9);
  try {
    for (let i: number = 0; i < LOOP_COUNT; i++) {
      hiTraceMeter.startTrace('Collator-single', 10);
      try {
        new Intl.Collator('zh-CN', { localeMatcher: 'lookup', usage: 'sort' });
      } finally {
        hiTraceMeter.finishTrace('Collator-single', 10);
      }
    }
  } finally {
    hiTraceMeter.finishTrace('Collator-100', 9);
  }

  hiTraceMeter.startTrace('PluralRules-100', 11);
  try {
    for (let i: number = 0; i < LOOP_COUNT; i++) {
      hiTraceMeter.startTrace('PluralRules-single', 12);
      try {
        new Intl.PluralRules('zh-CN', { localeMatcher: 'lookup', type: 'cardinal' });
      } finally {
        hiTraceMeter.finishTrace('PluralRules-single', 12);
      }
    }
  } finally {
    hiTraceMeter.finishTrace('PluralRules-100', 11);
  }
}

@Entry
@Component
struct RuntimeInterface {
  @State message: string = 'RuntimeInterface';

  aboutToAppear(): void {
    try {
      runIntlBenchmark();
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'Failed to create Intl objects: %{private}s', JSON.stringify(error));
    }
  }

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('RuntimeInterface')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}
