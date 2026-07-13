'use static'

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

// [Start Displayed_Together]
import {
  $r,
  Column,
  Component,
  Entry,
  FlexAlign,
  FontWeight,
  ForEach,
  HorizontalAlign,
  ImageSpan,
  ImageSpanAlignment,
  NavDestination,
  Resource,
  Span,
  Text,
  TextInput
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';

// 请将$r('app.media.xxx')替换为实际资源文件

@Entry
@Component
export struct DisplayedTogether {
  private context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private manager: resourceManager.ResourceManager = this.context.resourceManager;
  // 'Text_Full_Text'资源文件中的value值为
  // '你好我是Text[grin]，你好我[rolling_on_the_floor_laughing]是Text，[slightly_smiling_face]你好我是Text[grin]'
  @State fulltext: string = this.manager.getStringByNameSync('Text_Full_Text');

  classifyTextAndEmojis(input: string): Map<string, string[]> {
    // const emojiRegex: RegExp = /\[([a-zA-Z_]+)\]/g; // 根据实际情况编写正则表达式
    const emojiRegex: RegExp = new RegExp('\\[([a-zA-Z_]+)\\]', 'g');
    // 根据实际情况编写正则表达式
    const resultMap = new Map<string, string[]>(); // 用map记录普通文本和表情
    resultMap.set('text', []);
    resultMap.set('emojis', []);

    let lastIndex = 0;
    let match: RegExpExecArray | null = null;

    while ((match = emojiRegex.exec(input)) !== null) {
      // 添加普通文本
      if (match && match.index >= lastIndex) {
        resultMap.get('text')?.push(input.substring(lastIndex, match.index));
      }
      // 添加匹配到的表情
      if (resultMap && resultMap.has('emojis') && match && match.length >= 2) {
        resultMap.get('emojis')?.push(match[1] as string);
        lastIndex = match.index + (match[0] as string).length;
      }
    }
    // 添加最后一段文本
    if (lastIndex < input.length) {
      resultMap.get('text')?.push(input.substring(lastIndex));
    }
    return resultMap;
  }

  getEmojiImg(emojis: string[], index: int): Resource | string { // 根据正则匹配结果返回自定义表情资源
    let emojisImg: Resource[] = []
    for (let i = 0; i < emojis.length; i++) {
      switch (emojis[i]) {
        case 'rolling_on_the_floor_laughing':
          emojisImg.push($r('app.media.rolling_on_the_floor_laughing'))
          break;
        case 'slightly_smiling_face':
          emojisImg.push($r('app.media.slightly_smiling_face'))
          break;
        case 'grin':
          emojisImg.push($r('app.media.grin'))
          break;
        default:
          break;
      }
    }
    if (index >= 0 && emojisImg && emojisImg.length > index) {
      return emojisImg[index];
    }
    return '';
  }

  build(): void {
    NavDestination() {
      Column() {
        TextInput({
          // 请将$r('app.string.Text_emoji')替换为实际资源文件，在本示例中该资源文件的value值为"用户输入带表情的文本，例如：你好[grin]"
          placeholder: $r('app.string.Text_emoji')
        })
          .width('80%')
          .padding(10)
          .border({ width: 1, color: '#EEEEEE' })
          .onChange((value: string) => {
            // 输入变化时，更新 fulltext
            this.fulltext = value;
          });

        Text() {
          ForEach(this.classifyTextAndEmojis(this.fulltext).get('text') as string[],
            (item: string, index: int) => { // 展示文本和自定义表情资源
              Span(item)
                .fontSize(18)
                .fontColor('#666666')
                .fontWeight(FontWeight.Regular)

              ImageSpan(this.getEmojiImg(this.classifyTextAndEmojis(this.fulltext).get('emojis') as string[], index))
                .verticalAlign(ImageSpanAlignment.BOTTOM)
                .height(24)
            })
        }
        .width('80%')
        .padding(15)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .padding(20)
    }
    // [StartExclude Displayed_Together]
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.Displayed_Together_description')替换为实际资源文件，
    // 在本示例中该资源文件的value值为"emoji表情有时以表情符号的形式表示。如何将表情符号转换为emoji表情，并在Text组件中与文字一同显示"
    .title($r('app.string.Displayed_Together'))
    // [EndExclude Displayed_Together]
  }
}
// [End Displayed_Together]
