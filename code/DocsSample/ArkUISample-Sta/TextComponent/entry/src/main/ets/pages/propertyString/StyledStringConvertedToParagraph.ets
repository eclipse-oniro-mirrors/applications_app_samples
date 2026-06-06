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

// [Start styledStringConvertedToParagraph_start]
import {
  $r,
  Color,
  Column,
  Component,
  Divider,
  Entry,
  Font,
  LengthMetrics,
  MutableStyledString,
  ResourceStr,
  Scroll,
  StyledString,
  StyledStringKey,
  Text,
  TextController,
  TextStyle,
  CustomSpan,
  CustomSpanDrawInfo,
  DrawContext,
  CustomSpanMetrics,
  CustomSpanMeasureInfo
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import drawing from '@ohos.graphics.drawing';

class MyCustomSpan extends CustomSpan {
  constructor(word: string, width: number, height: number, context: UIContext) {
    super();
    this.word = word;
    this.width = width;
    this.height = height;
    this.context = context;
  }

  onMeasure(measureInfo: CustomSpanMeasureInfo): CustomSpanMetrics {
    return { width: this.width, height: this.height };
  }

  onDraw(context: DrawContext, options: CustomSpanDrawInfo): void {
    let canvas = context.canvas;
    const brush = new drawing.Brush();
    brush.setColor({
      alpha: 255,
      red: 0,
      green: 74,
      blue: 175
    });
    const font = new drawing.Font();
    font.setSize(25);
    const textBlob = drawing.TextBlob.makeFromString(this.word, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    if (!textBlob) {
      return;
    }
    canvas.attachBrush(brush);
    canvas.drawRect({
      left: options.x + 10,
      right: options.x + this.context.vp2px(this.width) - 10,
      top: options.lineTop + 10,
      bottom: options.lineBottom - 10
    });
    brush.setColor({
      alpha: 255,
      red: 23,
      green: 169,
      blue: 141
    });
    canvas.attachBrush(brush);
    canvas.drawTextBlob(textBlob, options.x + 20, options.lineBottom - 15);
    canvas.detachBrush();
  }

  setWord(word: string) {
    this.word = word;
  }

  public width: number = 160;
  public word: string = 'drawing';
  public height: number = 10;
  public context: UIContext;
}

@Entry
@Component
export struct Index {
  // 请在resources\base\element\string.json文件中配置name为'Full_text'，value为非空字符串的资源
  @State fullText: string =
    this.getUIContext().getHostContext()?.resourceManager.getStringByNameSync('Full_text') as string;
  // 请将$r('app.string.Original_text')替换为实际资源文件，在本示例中该资源文件的value值为"原文"
  @State originalText: ResourceStr = $r('app.string.Original_text');
  // 请将$r('app.string.After_typesetting')替换为实际资源文件，在本示例中该资源文件的value值为"排版后"
  @State afterTypesetting: ResourceStr = $r('app.string.After_typesetting');
  str: string =
    'Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.';
  mutableStr2: MutableStyledString = new MutableStyledString(this.str, [
    {
      start: 0,
      length: 3,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontSize: LengthMetrics.px(20) })
    },
    {
      start: 3,
      length: 3,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Brown })
    }
  ]);

  // 测算属性字符串在指定宽度下能显示的行数
  getLineNum(styledString: StyledString, width: LengthMetrics): int {
    let paragraphArr = this.getUIContext().getMeasureUtils().getParagraphs(styledString, { constraintWidth: width });
    let res = 0;
    for (let i = 0; i < paragraphArr.length; ++i) {
      res += paragraphArr[i].getLineCount();
    }
    return res;
  }

  // 测算属性字符串显示maxLines行时最多可以显示的字数
  getCorrectIndex(styledString: MutableStyledString, maxLines: number, width: LengthMetrics): int {
    let low: int = 0;
    let high: int = styledString.length - 1;
    // 使用二分查找
    while (low <= high) {
      let mid = (low + high) >> 1;
      console.info('demo: get ' + low + ' ' + high + ' ' + mid);
      let moreStyledString = new MutableStyledString(this.fullText, [{
        start: 4,
        length: 2,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontColor: Color.Blue })
      }]);
      let subStyledString: StyledString | undefined = styledString.subStyledString(0, mid);
      if (subStyledString) {
        moreStyledString.insertStyledString(0, subStyledString);
      }
      let lineNum = this.getLineNum(moreStyledString, LengthMetrics.px(500));
      if (lineNum <= maxLines) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }
    return high;
  }

  mutableStrAllContent: MutableStyledString = new MutableStyledString(this.str, [
    {
      start: 0,
      length: 3,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontSize: LengthMetrics.px(40) })
    },
    {
      start: 3,
      length: 3,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Brown })
    }
  ]);
  customSpan1: CustomSpan = new MyCustomSpan('Hello', 120, 10, this.getUIContext());
  mutableStrAllContent2: MutableStyledString = new MutableStyledString(this.str, [
    {
      start: 0,
      length: 3,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontSize: LengthMetrics.px(100) })
    },
    {
      start: 3,
      length: 3,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Brown })
    }
  ]);
  controller: TextController = new TextController();
  controller2: TextController = new TextController();
  textController: TextController = new TextController();
  textController2: TextController = new TextController();

  aboutToAppear(): void {
    this.mutableStrAllContent2.insertStyledString(0, new StyledString(this.customSpan1));
    this.mutableStr2.insertStyledString(0, new StyledString(this.customSpan1));
  }

  build(): void {
    Scroll() {
      Column() {
        Text(this.originalText)
        Text(undefined, { controller: this.controller }).width('500px').onAppear(() => {
          this.controller.setStyledString(this.mutableStrAllContent);
        })
        Divider().strokeWidth(8).color('#F1F3F5')
        Text(this.afterTypesetting)
        Text(undefined, { controller: this.textController }).onAppear(() => {
          let now = this.getCorrectIndex(this.mutableStrAllContent, 3, LengthMetrics.px(500));
          if (now != this.mutableStrAllContent.length - 1) {
            let moreStyledString = new MutableStyledString(this.fullText, [{
              start: 4,
              length: 2,
              styledKey: StyledStringKey.FONT,
              styledValue: new TextStyle({ fontColor: Color.Blue })
            }]);
            let subStyledString: StyledString | undefined = this.mutableStrAllContent2.subStyledString(0, now);
            if (subStyledString) {
              moreStyledString.insertStyledString(0, subStyledString);
              this.textController.setStyledString(moreStyledString);
            }
          } else {
            this.textController.setStyledString(this.mutableStrAllContent);
          }
        })
          .width('500px')
        Divider().strokeWidth(8).color('#F1F3F5')
        Text(this.originalText)
        Text(undefined, { controller: this.controller2 }).width('500px').onAppear(() => {
          this.controller2.setStyledString(this.mutableStrAllContent2);
        })
        Divider().strokeWidth(8).color('#F1F3F5')
        Text(this.afterTypesetting)
        Text(undefined, { controller: this.textController2 }).onAppear(() => {
          let now = this.getCorrectIndex(this.mutableStrAllContent2, 3, LengthMetrics.px(500));
          let moreStyledString = new MutableStyledString(this.fullText, [{
            start: 4,
            length: 2,
            styledKey: StyledStringKey.FONT,
            styledValue: new TextStyle({ fontColor: Color.Blue })
          }]);
          let subStyledString: StyledString | undefined = this.mutableStrAllContent2.subStyledString(0, now);
          if (subStyledString) {
            moreStyledString.insertStyledString(0, subStyledString);
            this.textController2.setStyledString(moreStyledString);
          }
        })
          .width('500px')
      }.width('100%')
    }
  }
}

// [End styledStringConvertedToParagraph_start]
